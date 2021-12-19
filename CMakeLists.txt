cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

set(DEPS_BINARY_DIR ${CMAKE_BINARY_DIR}/deps)
execute_process(
    COMMAND ${CMAKE_COMMAND} 
    -S ${CMAKE_SOURCE_DIR}/deps 
    -B ${DEPS_BINARY_DIR}
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
)

execute_process(
    COMMAND ${CMAKE_COMMAND}
    --build ${DEPS_BINARY_DIR}
    --config ${CMAKE_BUILD_TYPE}
)

list(APPEND CMAKE_PREFIX_PATH 
    ${DEPS_BINARY_DIR}/deps/install/gflags
    ${DEPS_BINARY_DIR}/deps/install/glog
)

find_package(gflags REQUIRED NO_MODULE)
find_package(glog REQUIRED NO_MODULE)

add_executable(main main.cc)
target_link_libraries(main 
    PRIVATE gflags
    PRIVATE glog::glog
)