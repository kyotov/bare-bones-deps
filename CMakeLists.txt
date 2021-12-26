cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

include(deps/kydeps.cmake)
KyDeps(glog gflags)

find_package(gflags REQUIRED NO_MODULE)
find_package(glog REQUIRED NO_MODULE)

# a simple executable that uses both
add_executable(main main.cc)
target_link_libraries(main 
    PRIVATE gflags
    PRIVATE glog::glog
)