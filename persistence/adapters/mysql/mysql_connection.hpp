#pragma once
#ifndef PERSISTENCE_ADAPTERS_MYSQL_CONNECTION_HPP_INCLUDED
#define PERSISTENCE_ADAPTERS_MYSQL_CONNECTION_HPP_INCLUDED

#include <persistence/connection.hpp>
#include <persistence/adapter.hpp>

#include <wayward/support/error.hpp>

namespace persistence {
  struct MySQLError : wayward::Error {
    MySQLError(const std::string& message) : wayward::Error{message} {}
  };

  struct MySQLAdapter : IAdapter {
    std::unique_ptr<IConnection> connect(std::string connection_string) const final;
  };

  using wayward::ILogger;

  struct MySQLConnection : IConnection {
    virtual ~MySQLConnection();

    // Info
    std::string database() const final;
    std::string user() const final;
    std::string host() const final;
    std::shared_ptr<ILogger> logger() const final;
    void set_logger(std::shared_ptr<ILogger> l) final;

    // Querying
    std::string sanitize(std::string sql_fragment) final;
    std::string to_sql(const ast::IQuery& query) final;
    std::string to_sql(const ast::IQuery& query, const relational_algebra::IResolveSymbolicRelation&) final;
    std::unique_ptr<IResultSet> execute(const ast::IQuery& query) final;
    std::unique_ptr<IResultSet> execute(std::string sql) final;
    std::unique_ptr<IResultSet> execute(const ast::IQuery& query, const relational_algebra::IResolveSymbolicRelation&) final;

    static std::unique_ptr<MySQLConnection>
    connect(std::string connection_string, std::string* out_error = nullptr);
  private:
    MySQLConnection();
    struct MySQLPrivate;
    std::unique_ptr<MySQLPrivate> priv;
  };
}

#endif // PERSISTENCE_ADAPTERS_MYSQL_CONNECTION_HPP_INCLUDED
