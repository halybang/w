cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project (w_util)
set(SRC_DIR ${WAYWARD_ROOT_DIR}/w_util)

set(w_util_HEADERS
    ${SRC_DIR}/recompiler.hpp
    )

set(w_util_SOURCES
    ${SRC_DIR}/server.cpp
    ${SRC_DIR}/recompiler.cpp
    ${SRC_DIR}/main.cpp
    ${SRC_DIR}/init.cpp
    )

set (WAYWARD_LIBRARIES
    wayward
    persistence
    )

add_executable(w_util ${w_util_SOURCES} ${w_util_HEADERS})

target_include_directories(w_util PRIVATE ${SRC_DIR})
target_link_libraries(w_util ${WAYWARD_LIBRARIES} ${LIBEVENT_LIBRARIES})
