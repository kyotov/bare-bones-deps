cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

# kydep bootstrap
include(FetchContent)
FetchContent_Declare(kydep_bootstrap
    GIT_REPOSITORY https://github.com/kyotov/kydep-bootstrap.git
    GIT_TAG main # this should really be a hash in each real project
)
FetchContent_MakeAvailable(kydep_bootstrap)

# use custom CMakeLists.txt for deps
# KyDeps("${CMAKE_SOURCE_DIR}/deps" glog gflags)

# use the default CMakeLists.txt for deps
KyDeps("" glog gflags)

# not sure if we want to "automate" the below...
find_package(gflags REQUIRED NO_MODULE)
find_package(glog REQUIRED NO_MODULE)

# a simple executable that uses both
add_executable(main main.cc)
target_link_libraries(main 
    PRIVATE gflags
    PRIVATE glog::glog
)