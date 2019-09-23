CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(APP)

INCLUDE_DIRECTORIES(inc)

AUX_SOURCE_DIRECTORY(src SRC)
ADD_LIBRARY(util ${SRC})

TARGET_LINK_LIBRARIES(util pthread os m rt)

FIND_PATH(JANSSON_INCLUDE_EXIST jansson.h /usr/include/ /usr/local/include/)
IF (JANSSON_INCLUDE_EXIST)
    ADD_DEFINITIONS(-DUSE_LIBICONV)
    FIND_PATH(JANSSON_LIBRARY_A_EXIST libjansson.a /usr/lib/ /usr/local/lib/ /lib64 /usr/lib/x86_64-linux-gnu/)
    FIND_PATH(JANSSON_LIBRARY_SO_EXIST libjansson.so /usr/lib/ /usr/local/lib/ /lib64 /usr/lib/x86_64-linux-gnu/)

    IF (JANSSON_LIBRARY_A_EXIST OR JANSSON_LIBRARY_SO_EXIST)
        MESSAGE(STATUS "Use the installed jansson library")
        TARGET_LINK_LIBRARIES(util jansson)
    ELSE ()
        MESSAGE(STATUS "Use the jansson functions in GLIBC")
    ENDIF ()
ELSE ()
    MESSAGE(STATUS "Failed to find jansson, please install")
ENDIF ()