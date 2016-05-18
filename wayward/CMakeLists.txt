cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project (wayward)
set(SRC_DIR ${WAYWARD_ROOT_DIR}/wayward)

set(DL_LIBRARY)
if (UNIX)
  set(DL_LIBRARY -ldl)
endif()

find_library(LIBEVHTP_LIBRARY evhtp)
find_library(LIBUNWIND_LIBRARY unwind)

set(wayward_support_HEADERS
  ${SRC_DIR}/support/uri.hpp
  ${SRC_DIR}/support/types.hpp
  ${SRC_DIR}/support/type_info.hpp
  ${SRC_DIR}/support/type.hpp
  ${SRC_DIR}/support/thread_local.hpp
  ${SRC_DIR}/support/teamwork.hpp
  ${SRC_DIR}/support/string.hpp
  ${SRC_DIR}/support/result.hpp
  ${SRC_DIR}/support/plugin.hpp
  ${SRC_DIR}/support/options.hpp
  ${SRC_DIR}/support/monad.hpp
  ${SRC_DIR}/support/meta.hpp
  ${SRC_DIR}/support/maybe.hpp
  ${SRC_DIR}/support/logger.hpp
  ${SRC_DIR}/support/json.hpp
  ${SRC_DIR}/support/intrusive_list.hpp
  ${SRC_DIR}/support/http.hpp
  ${SRC_DIR}/support/format.hpp
  ${SRC_DIR}/support/fiber.hpp
  ${SRC_DIR}/support/event_loop.hpp
  ${SRC_DIR}/support/error.hpp
  ${SRC_DIR}/support/either.hpp
  ${SRC_DIR}/support/datetime.hpp
  ${SRC_DIR}/support/data_visitor.hpp
  ${SRC_DIR}/support/data_franca.hpp
  ${SRC_DIR}/support/command_line_options.hpp
  ${SRC_DIR}/support/cloning_ptr.hpp
  ${SRC_DIR}/support/bitflags.hpp
  ${SRC_DIR}/support/benchmark.hpp
  ${SRC_DIR}/support/any.hpp
  ${SRC_DIR}/support/data_franca/adapter.hpp
  ${SRC_DIR}/support/data_franca/adapters.hpp
  ${SRC_DIR}/support/data_franca/mutator.hpp
#  ${SRC_DIR}/support/data_franca/node.hpp
  ${SRC_DIR}/support/data_franca/object.hpp
  ${SRC_DIR}/support/data_franca/reader.hpp
  ${SRC_DIR}/support/data_franca/spectator.hpp
  ${SRC_DIR}/support/data_franca/types.hpp
  ${SRC_DIR}/support/data_franca/writer.hpp
  ${SRC_DIR}/support/datetime/clock.hpp
  ${SRC_DIR}/support/datetime/datetime.hpp
  ${SRC_DIR}/support/datetime/duration_units.hpp
  ${SRC_DIR}/support/datetime/interval.hpp
  ${SRC_DIR}/support/datetime/timezone.hpp
  ${SRC_DIR}/support/datetime/type.hpp
  )

set(wayward_support_SOURCES
  ${SRC_DIR}/support/any.cpp
  ${SRC_DIR}/support/benchmark.cpp
  ${SRC_DIR}/support/format.cpp
  ${SRC_DIR}/support/uri.cpp
  ${SRC_DIR}/support/json.cpp
  ${SRC_DIR}/support/datetime/datetime.cpp
  ${SRC_DIR}/support/datetime/clock.cpp
  ${SRC_DIR}/support/datetime/interval.cpp
  ${SRC_DIR}/support/datetime/type.cpp
  ${SRC_DIR}/support/logger.cpp
  ${SRC_DIR}/support/error.cpp
  ${SRC_DIR}/support/command_line_options.cpp
  ${SRC_DIR}/support/fiber.cpp
  ${SRC_DIR}/support/event_loop.cpp
  ${SRC_DIR}/support/http.cpp
  ${SRC_DIR}/support/teamwork.cpp
  ${SRC_DIR}/support/plugin.cpp
  ${SRC_DIR}/support/data_franca/spectator.cpp
  ${SRC_DIR}/support/data_franca/mutator.cpp
  ${SRC_DIR}/support/data_franca/object.cpp
  ${SRC_DIR}/support/string.cpp
  ${SRC_DIR}/support/types.cpp
  ${SRC_DIR}/../3rdparty/libevhtp/evhtp.c
  ${SRC_DIR}/../3rdparty/libevhtp/htparse.c
  ${SRC_DIR}/../3rdparty/libevhtp/evthr.c
  )


set(wayward_HEADERS
  ${SRC_DIR}/content_type.hpp
  ${SRC_DIR}/respond_to.hpp
  ${SRC_DIR}/routes.hpp
  ${SRC_DIR}/session.hpp
  ${SRC_DIR}/template_engine.hpp
  ${SRC_DIR}/w.hpp
  )


set(wayward_SOURCES
  ${SRC_DIR}/app.cpp
  ${SRC_DIR}/render.cpp
  ${SRC_DIR}/log.cpp
  ${SRC_DIR}/template_engine.cpp
  ${SRC_DIR}/respond_to.cpp
  ${SRC_DIR}/content_type.cpp
  )


#add_library(wayward STATIC ${wayward_support_SOURCES} ${wayward_support_HEADERS} ${wayward_SOURCES} ${wayward_HEADERS})
add_library(wayward SHARED ${wayward_support_SOURCES} ${wayward_support_HEADERS} ${wayward_SOURCES} ${wayward_HEADERS})

target_include_directories(wayward PUBLIC ${WAYWARD_ROOT_DIR} ${SRC_DIR} ${SRC_DIR}/../3rdparty/libevhtp)
target_link_libraries(wayward PRIVATE ${LIBEVHTP_LIBRARY} ${LIBEVENT_LIBRARIES} ${LIBUNWIND_LIBRARY} ${OPENSSL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${DL_LIBRARY})

