cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project (blog_example)
set(SRC_DIR ${WAYWARD_ROOT_DIR}/examples/blog)

set(blog_example_HEADERS
    ${SRC_DIR}/models.hpp
    )

set(blog_example_SOURCES
    ${SRC_DIR}/blog.cpp
    )

set (WAYWARD_LIBRARIES
    wayward
    persistence
    )

#set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -lpthread -lpq")
add_executable(blog_example ${blog_example_SOURCES} ${blog_example_HEADERS})

target_include_directories(blog_example PRIVATE ${SRC_DIR})
target_link_libraries(blog_example ${WAYWARD_LIBRARIES})

