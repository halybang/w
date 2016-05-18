cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project (AllProjects)

set(WAYWARD_ROOT_DIR ${CMAKE_CURRENT_LIST_DIR})

if (UNIX AND NOT APPLE OR MINGW)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -Wall -Wextra")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -fPIC -Wall -Wextra")
elseif(APPLE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -stdlib=libc++ -Wall -Wextra")
endif()

set(EXECUTABLE_OUTPUT_PATH  ${PROJECT_BINARY_DIR}/bin CACHE PATH "Place where executables are stored")
set(LIBRARY_OUTPUT_PATH  ${PROJECT_BINARY_DIR}/libs CACHE PATH "Place where libs are stored")

find_package(OpenSSL REQUIRED)
find_package(Threads REQUIRED)

find_library(LIBEVENT_LIBRARY event)
find_library(LIBEVENT_PTHREADS_LIBRARY event_pthreads)
find_library(LIBEVENT_OPENSSL_LIBRARY event_openssl)
find_library(LIBEVENT_EXTRA_LIBRARY event_extra)

set (LIBEVENT_LIBRARIES
    ${LIBEVENT_LIBRARY}
    ${LIBEVENT_PTHREADS_LIBRARY}
    ${LIBEVENT_OPENSSL_LIBRARY}
    ${LIBEVENT_EXTRA_LIBRARY}
    )

add_subdirectory(${PROJECT_SOURCE_DIR}/wayward)
add_subdirectory(${PROJECT_SOURCE_DIR}/persistence)
add_subdirectory(${PROJECT_SOURCE_DIR}/w_util)
add_subdirectory(${PROJECT_SOURCE_DIR}/tests)
add_subdirectory(${PROJECT_SOURCE_DIR}/examples/blog)
