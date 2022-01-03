cmake_minimum_required(VERSION 3.20)
project(external_package_experiment)

add_subdirectory(mode-1/kydeps)

find_package(gflags REQUIRED CONFIG)
find_package(glog REQUIRED CONFIG)
find_package(GTest REQUIRED CONFIG)

add_executable(tests test.cc)
target_link_libraries(
    tests
    PRIVATE gflags
    PRIVATE glog::glog
    PRIVATE GTest::gtest
    PRIVATE GTest::gtest_main)

include(CTest)
include(GoogleTest)
gtest_discover_tests(tests)

# cmake-format: off
# foreach(kydep ${KYDEPS})
#     set(archive "${kydep}-${${kydep}_HASH}.zip")
#     file(ARCHIVE_CREATE #
#          OUTPUT "${archive}" #
#          PATHS "${${kydep}_INSTALL_DIR}" #
#     )
#     file(SHA256 "${archive}" hash)
#     message(STATUS "created package[${archive}]=${hash}")
# endforeach()
# cmake-format: on
