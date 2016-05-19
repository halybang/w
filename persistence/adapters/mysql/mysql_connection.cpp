#include "persistence/adapters/mysql/mysql_connection.hpp"
#include "persistence/adapters/mysql/mysql_renderers.hpp"
#include <mysql/mysql.h>

#include <wayward/support/any.hpp>
#include <wayward/support/format.hpp>
#include <wayward/support/logger.hpp>
#include <wayward/support/uri.hpp>
#include <wayward/support/data_franca/spectator.hpp>
#include <sstream>
#include <iostream>

namespace persistence {
  using wayward::URI;
  struct MySQLConnection::MySQLPrivate {
    MYSQL* conn = nullptr;
    std::shared_ptr<ILogger> logger;
    std::string host;
    std::string db;
    std::string user;
    std::string passwd;
  };

  static const AdapterRegistrar<MySQLAdapter> registrar_ = AdapterRegistrar<MySQLAdapter>("mysql");

  std::unique_ptr<IConnection> MySQLAdapter::connect(std::string connection_string) const {
    std::string error;
    auto conn = MySQLConnection::connect(std::move(connection_string), &error);
    if (conn) {
      return std::move(conn);
    } else {
      throw MySQLError{std::move(error)};
    }
  }

  namespace {
    struct MySQLResultSet : IResultSet {
      explicit MySQLResultSet(MYSQL_RES* result_) : result(result_) {
        MYSQL_FIELD *field;
        while((field = mysql_fetch_field(result))) {
            cols.push_back(field->name);
        }
      }
      virtual ~MySQLResultSet() {
        mysql_free_result(result);
      }

      size_t width() const final { return mysql_num_fields(result); }
      size_t height() const final { return mysql_num_rows(result); }

      bool is_null_at(size_t row, const std::string& col) const final {          
        if (row >= mysql_num_rows(result)) {
              return true;
        }
        int fld = -1;
        for(unsigned int i = 0; i < cols.size(); i++) {
           if (cols.at(i) == col) {
              fld = i;
              break;
           }
        }
        if (fld >= 0) {
            mysql_data_seek(result, row);
            MYSQL_ROW row = mysql_fetch_row(result);
            return (row[fld]==nullptr);
        }
        return true;
      }

      Maybe<std::string> get(size_t row, const std::string& col) const final {        
        if (row >= mysql_num_rows(result)) {
          return wayward::Nothing;
        }
        int fld = -1;
        for(unsigned int i = 0; i < cols.size(); i++) {
            if (cols.at(i) == col) {
                  fld = i;
                  break;
              }
          }
        if (fld >= 0) {
            mysql_data_seek(result, row);
            MYSQL_ROW row = mysql_fetch_row(result);
            return std::string(row[fld]);
        }
        return wayward::Nothing;
      }

      std::vector<std::string> columns() const final {
        std::vector<std::string> r(cols.begin(), cols.end());
        return r;
      }

      MYSQL_RES* result;
      std::vector<std::string> cols;
    };

    std::unique_ptr<MySQLResultSet> make_results(MYSQL_RES* result) {
      return std::unique_ptr<MySQLResultSet>(new MySQLResultSet(result));
    }
  }

  MySQLConnection::MySQLConnection() : priv(new MySQLPrivate) {}

  MySQLConnection::~MySQLConnection() {
    mysql_close(priv->conn);
  }

  std::string
  MySQLConnection::database() const {    
    return priv->db;
  }

  std::string
  MySQLConnection::user() const {    
    return priv->user;
  }

  std::string
  MySQLConnection::host() const {    
    return mysql_get_host_info(priv->conn);
  }

  std::shared_ptr<ILogger>
  MySQLConnection::logger() const {
    return priv->logger;
  }

  void
  MySQLConnection::set_logger(std::shared_ptr<ILogger> l) {
    priv->logger = std::move(l);
  }

  std::unique_ptr<IResultSet>
  MySQLConnection::execute(std::string sql) {     
    throw MySQLError{std::string(sql)};
    if(!mysql_query(priv->conn, sql.c_str())) {
        MYSQL_RES* results = mysql_store_result(priv->conn);
        if (results)
            return make_results(results);
        throw MySQLError{std::string(mysql_error(priv->conn))};
    }
    //throw MySQLError{std::string(mysql_error(priv->conn))};
    throw MySQLError{std::string(sql)};
  }

  namespace {
    struct DummyResolveSymbolicRelation : relational_algebra::IResolveSymbolicRelation {
      std::string relation_for_symbol(ast::SymbolicRelation rel) const final {
        throw relational_algebra::SymbolicRelationError("No resolver provided for query containing symbolic relations.");
      }
    };
  }

  std::unique_ptr<IResultSet>
  MySQLConnection::execute(const ast::IQuery& query) {
    return this->execute(query, DummyResolveSymbolicRelation());
  }

  std::unique_ptr<IResultSet>
  MySQLConnection::execute(const ast::IQuery& query, const relational_algebra::IResolveSymbolicRelation& rel) {
    std::string sql = to_sql(query, rel);
    return execute(std::move(sql));
  }

  std::string
  MySQLConnection::to_sql(const ast::IQuery& query, const relational_algebra::IResolveSymbolicRelation& rel) {
    MySQLQueryRenderer renderer(*this, rel);
    return query.to_sql(renderer);
  }

  std::string
  MySQLConnection::to_sql(const ast::IQuery& query) {
    DummyResolveSymbolicRelation dummy;
    MySQLQueryRenderer renderer(*this, dummy);
    return query.to_sql(renderer);
  }

  std::string
  MySQLConnection::sanitize(std::string input) {
    const size_t max_len = input.size() * 2 + 1; // This size is expected by libmysqlclient.
    char buffer[max_len] = {0};
    size_t len = mysql_real_escape_string(priv->conn, buffer, input.c_str(), input.size());
    if (len) {
      return std::string(buffer, len);
    } else {
      return "<UNKNOWN ERROR>";
    }
  }

  std::unique_ptr<MySQLConnection>
  MySQLConnection::connect(std::string connstr, std::string* out_error) {
    MYSQL* conn = mysql_init( NULL );
    if (conn == nullptr) {
      if (out_error) *out_error = "Unknown error.";
      return nullptr;
    }

    //URI:"mysql://username:password@host/dbname"
    auto maybe_uri = URI::parse(connstr);
#if 1
    MYSQL* MySQLConRet = mysql_real_connect( conn,
                            maybe_uri->host.c_str(),
                            maybe_uri->username.c_str(),
                            maybe_uri->password.c_str(),
                            maybe_uri->path.c_str(), 0, NULL, 0 );
#else
    MYSQL* MySQLConRet = mysql_real_connect( conn,
                            "localhost",
                            "wayward",
                            "111111",
                            "wayward_examples_blog", 0, NULL, 0 );
#endif
    if (MySQLConRet == nullptr) {
      if (out_error) *out_error = mysql_error(conn);
      mysql_close(conn);
      return nullptr;
    }
    auto p = new MySQLConnection;
    p->priv->conn = conn;
    p->priv->host = maybe_uri->host;
    p->priv->user = maybe_uri->username;
    p->priv->passwd = maybe_uri->password;
    p->priv->db = maybe_uri->path;
    return std::unique_ptr<MySQLConnection>(p);
  }
}
