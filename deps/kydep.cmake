include_guard(GLOBAL)

include(ExternalProject)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/definitions)

macro(KyDep NAME)
    include_guard(GLOBAL)

    set(DIR "${CMAKE_BINARY_DIR}/${NAME}")

    list(APPEND KYDEPS_CONTEXT "${NAME};${ARGN};;;")

    ExternalProject_Add(${NAME}
        PREFIX "${DIR}"
        
        BINARY_DIR "${DIR}/b"
        SOURCE_DIR "${DIR}/s"
        STAMP_DIR "${DIR}/ts"
        TMP_DIR "${DIR}/tmp"
        LOG_DIR "${DIR}/log"

        CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_INSTALL_PREFIX:PATH=${DIR}/i

        ${ARGN}
    )

    set(DEPENDS_ON_${NAME}
        CMAKE_ARGS
        -DCMAKE_PREFIX_PATH:PATH=${DIR}/i
        DEPENDS ${NAME}
    )

    unset(DIR)
endmacro()
