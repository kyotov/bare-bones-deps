cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

# ==============================================================================
# STEP 1: declare which dependencies we want
set(KYDEPS gflags glog GTest)

# ==============================================================================
# STEP 2: invoke kydeps to include them (and potentially build them)
#
# NOTE: There are three different modes supported for step 2.
#
# ------------------------------------------------------------------------------
# Mode 1: To use a local CMakeLists.txt in a directory of the root repo,
#         without consuming any provided definitions directly, 
#         uncomment the following line:
#
add_subdirectory(kydeps-nodefs)
# ------------------------------------------------------------------------------
# Mode 2: To use a git submodule to import provided definitions,
#         uncomment the following line:
#
# add_subdirectory(kydeps)
# ------------------------------------------------------------------------------
# Mode 3: To use FetchContent to import provided definitons,
#         uncomment the following lines:
#
# include(FetchContent)
# FetchContent_Declare(kydeps
#     GIT_REPOSITORY https://github.com/kyotov/kydep-definitions.git
#     GIT_TAG v1.0
# )
# FetchContent_MakeAvailable(kydeps)

# ==============================================================================
# STEP 3: consume the necessary dependencies
find_package(gflags REQUIRED CONFIG)
find_package(glog REQUIRED CONFIG)
find_package(GTest REQUIRED CONFIG)

# ==============================================================================
# STEP 4: continue business as usual (using the consumed dependencies)

add_executable(tests test.cc)
target_link_libraries(tests
    PRIVATE gflags
    PRIVATE glog::glog
    PRIVATE GTest::gtest
    PRIVATE GTest::gtest_main
)

include(CTest)
include(GoogleTest)
gtest_discover_tests(tests)