cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project (persistence)
set(SRC_DIR ${WAYWARD_ROOT_DIR}/persistence)

find_library(LIBPQ_LIBRARY pq)
#find_package(PostgreSQL REQUIRED)

set(persistence_SOURCES
  ${SRC_DIR}/connection_provider.cpp
  ${SRC_DIR}/connection_retainer.cpp
  ${SRC_DIR}/adapter.cpp
  ${SRC_DIR}/data_store.cpp
  ${SRC_DIR}/connection_pool.cpp
  ${SRC_DIR}/p.cpp
  ${SRC_DIR}/adapters/postgresql/connection.cpp
  ${SRC_DIR}/adapters/postgresql/renderers.cpp
  ${SRC_DIR}/primary_key.cpp
  ${SRC_DIR}/relational_algebra.cpp
  ${SRC_DIR}/insert.cpp
  ${SRC_DIR}/property.cpp
  ${SRC_DIR}/data_as_literal.cpp
  ${SRC_DIR}/projection.cpp
  ${SRC_DIR}/column.cpp
  ${SRC_DIR}/assign_attributes.cpp
  )

set (persistence_HEADERS
  ${SRC_DIR}/adapters/postgresql/connection.hpp
  ${SRC_DIR}/adapters/postgresql/renderers.hpp
  ${SRC_DIR}/adapter.hpp
  ${SRC_DIR}/assign_attributes.hpp
  ${SRC_DIR}/association.hpp
  ${SRC_DIR}/ast.hpp
  ${SRC_DIR}/belongs_to.hpp
  ${SRC_DIR}/column.hpp
  ${SRC_DIR}/column_abilities.hpp
  ${SRC_DIR}/column_traits.hpp
  ${SRC_DIR}/connection.hpp
  ${SRC_DIR}/connection_pool.hpp
  ${SRC_DIR}/connection_provider.hpp
  ${SRC_DIR}/connection_retainer.hpp
  ${SRC_DIR}/context.hpp
  ${SRC_DIR}/create.hpp
  ${SRC_DIR}/data_as_literal.hpp
  ${SRC_DIR}/data_store.hpp
  ${SRC_DIR}/datetime.hpp
  ${SRC_DIR}/destroy.hpp
  ${SRC_DIR}/has_many.hpp
  ${SRC_DIR}/has_one.hpp
  ${SRC_DIR}/insert.hpp
  ${SRC_DIR}/p.hpp
  ${SRC_DIR}/persistence_macro.hpp
  ${SRC_DIR}/primary_key.hpp
  ${SRC_DIR}/projection.hpp
  ${SRC_DIR}/projection_as_structured_data.hpp
  ${SRC_DIR}/property.hpp
  ${SRC_DIR}/record.hpp
  ${SRC_DIR}/record_as_structured_data.hpp
  ${SRC_DIR}/record_ptr.hpp
  ${SRC_DIR}/record_type.hpp
  ${SRC_DIR}/record_type_builder.hpp
  ${SRC_DIR}/relational_algebra.hpp
  ${SRC_DIR}/result_set.hpp
  ${SRC_DIR}/validation_errors.hpp
  )

set (WAYWARD_LIBRARIES
    wayward
    )
#add_library(persistence STATIC ${persistence_SOURCES} ${persistence_HEADERS})
add_library(persistence SHARED ${persistence_SOURCES} ${persistence_HEADERS})

target_include_directories(persistence PUBLIC ${WAYWARD_ROOT_DIR} ${SRC_DIR} /usr/include/postgresql)
target_link_libraries(persistence PRIVATE ${WAYWARD_LIBRARIES} ${LIBPQ_LIBRARY})
