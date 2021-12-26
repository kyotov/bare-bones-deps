cmake_minimum_required(VERSION 3.20)
project(deps)

include(kydep.cmake)

# definitions
include(glog)
include(gflags)

# message(STATUS "${KYDEPS_CONTEXT}")