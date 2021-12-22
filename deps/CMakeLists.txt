cmake_minimum_required(VERSION 3.20)
project(deps)

include(ExternalProject)

################################################################################

macro(KyDep NAME)
    ExternalProject_Add(${NAME}
        PREFIX ${CMAKE_BINARY_DIR}/${NAME}
        
        CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/${NAME}/_

        ${ARGN}
    )

    set(DEPENDS_ON_${NAME}
        CMAKE_ARGS
        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_BINARY_DIR}/${NAME}/_
        DEPENDS ${NAME}
    )
endmacro()

################################################################################

KyDep(gflags
    GIT_REPOSITORY https://github.com/gflags/gflags.git
    GIT_TAG f8a0efe03aa69b3336d8e228b37d4ccb17324b88 # v2.2.0

    CMAKE_ARGS
    -DREGISTER_INSTALL_PREFIX=FALSE
    -DGFLAGS_BUILD_STATIC_LIBS=TRUE
    -DGFLAGS_BUILD_SHARED_LIBS=FALSE
    -DGFLAGS_BUILD_TESTING=FALSE    
)

KyDep(glog
    GIT_REPOSITORY https://github.com/google/glog.git
    GIT_TAG 96a2f23dca4cc7180821ca5f32e526314395d26a # v0.4.0

    CMAKE_ARGS
    -DBUILD_TESTING=FALSE

    ${DEPENDS_ON_gflags}
)
