# ==============================================================================
# ===== [BEGIN] KyDeps CMakeLists.txt preamble ===== !!! DO NOT EDIT !!! =======
#
cmake_minimum_required(VERSION 3.20)
project(kydeps)
set(CMAKE_MESSAGE_CONTEXT_SHOW ON)
if (CMAKE_SOURCE_DIR STREQUAL kydeps_SOURCE_DIR)
    include(kydep)
else()
    include(FetchContent)
    FetchContent_Declare(kydep_bootstrap
        GIT_REPOSITORY https://github.com/kyotov/kydep-bootstrap.git
        GIT_TAG v2.1
    )
    FetchContent_MakeAvailable(kydep_bootstrap)
endif()
#
# ===== [END] KyDeps CMakeLists.txt preamble ===================================
# ==============================================================================

include("cache.cmake")
set(KYDEPS_CACHE OFF)
set(KYDEPS_BUILD ON)

set(KYDEPS_BUILD_TESTS FALSE)

KyDep(gflags
    GIT_REPOSITORY https://github.com/gflags/gflags.git
    GIT_TAG f8a0efe03aa69b3336d8e228b37d4ccb17324b88 # v2.2.0

    CMAKE_ARGS
    -DREGISTER_INSTALL_PREFIX=FALSE
    -DGFLAGS_BUILD_STATIC_LIBS=TRUE
    -DGFLAGS_BUILD_SHARED_LIBS=FALSE
    -DGFLAGS_BUILD_TESTING=${KYDEPS_BUILD_TESTS}    
)

KyDep(glog
    GIT_REPOSITORY https://github.com/google/glog.git
    GIT_TAG 96a2f23dca4cc7180821ca5f32e526314395d26a # v0.4.0

    CMAKE_ARGS
    -DBUILD_TESTING=${KYDEPS_BUILD_TESTS}

    ${gflags_DEPENDENCY}
)

KyDep(GTest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG e2239ee6043f73722e7aa812a459f54a28552929 # 1.11.0
)
