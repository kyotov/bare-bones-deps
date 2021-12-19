cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

# the below is the minimal example i could come up with
# for gflags and glog only.
#
# i have deliberately not refactored boilerplate so we can discuss it
#
# the following two commands can be skipped 
# if you are willing to do the following in the terminal
# from the root of your repo:
#
# > cmake -S deps -B build/deps -D CMAKE_BUILD_TYPE=[Debug|Release]
# > cmake --build build/deps --config [Debug|Release]
#
# the supplied build type / config should match your project's
# 
# if you leave them in here, then you are relying on their builds to be well behaved.

# confifure top level cmake for deps, then build and install all deps
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_SOURCE_DIR}/deps -B ${CMAKE_BINARY_DIR}/deps -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR}/deps --config ${CMAKE_BUILD_TYPE})

# append the install path of all deps...
# there is some magic here that the names picked should match
list(APPEND CMAKE_PREFIX_PATH 
    ${CMAKE_BINARY_DIR}/deps/install/gflags
    ${CMAKE_BINARY_DIR}/deps/install/glog
)

# now you can just "find" them
find_package(gflags REQUIRED NO_MODULE)
find_package(glog REQUIRED NO_MODULE)

# a simple executable that uses both
add_executable(main main.cc)
target_link_libraries(main 
    PRIVATE gflags
    PRIVATE glog::glog
)