
FUNCTION(configure_build NAME BUILD PLATFORM)

    SET(BUILD_STRING "${NAME}:")

    IF(BUILD MATCHES 1)
        ADD_DEFINITIONS(-D_LIBCHAOS_BUILD_DEBUG)
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
        SET(BUILD_STRING "${BUILD_STRING} Debug")
    ELSEIF(BUILD MATCHES 2)
        ADD_DEFINITIONS(-D_LIBCHAOS_BUILD_RELEASE)
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
        SET(BUILD_STRING "${BUILD_STRING} Release")
    ELSE()
        ADD_DEFINITIONS(-D_LIBCHAOS_BUILD_NORMAL)
        SET(BUILD_STRING "${BUILD_STRING} Normal")
    ENDIF()

    IF(PLATFORM MATCHES 1)
        ADD_DEFINITIONS(-D_LIBCHAOS_PLATFORM_LINUX -D_LIBCHAOS_COMPILER_GCC)
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -rdynamic")
        SET(BUILD_STRING "${BUILD_STRING}, Unix")
    ELSEIF(PLATFORM MATCHES 2)
        ADD_DEFINITIONS(-D_LIBCHAOS_PLATFORM_WINDOWS -D_LIBCHAOS_COMPILER_MINGW)
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mwin32 -mwindows")
        SET(BUILD_STRING "${BUILD_STRING}, Windows")
    ELSE()
        MESSAGE(ERROR "Unknown Platform")
    ENDIF()

    SET(BUILD_STRING "${BUILD_STRING}" PARENT_SCOPE)

    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wno-unused-parameter -ansi -std=c++11" PARENT_SCOPE)

ENDFUNCTION(configure_build)
