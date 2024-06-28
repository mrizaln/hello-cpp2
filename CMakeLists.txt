cmake_minimum_required(VERSION 3.24)
project(hello-cpp2 VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_COLOR_DIAGNOSTICS ON)
set(FETCHCONTENT_QUIET FALSE)

include(cmake/prelude.cmake)
include(cmake/mold.cmake)
include(cmake/cppfront.cmake) # emits: cppfront_compile()
include(cmake/fetched-lib.cmake) # emits: secret-string target

set(SOURCES source/main.cpp2)

# cmake-format: off
cppfront_compile(main
  INCLUDE_ALL_STD
  SOURCES         ${SOURCES}
  DEPENDS         secret-string
  COMPILE_FLAGS   -Wall -Wextra -Wconversion

  COMPILE_FLAGS   -fsanitize=address,leak,undefined
  LINK_FLAGS      -fsanitize=address,leak,undefined

  # COMPILE_FLAGS -fsanitize=thread
  # LINK_FLAGS    -fsanitize=thread
)
# cmake-format: on
