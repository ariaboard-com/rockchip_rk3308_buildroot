# vim: syntax=cmake
cmake_minimum_required(VERSION 2.8.11)

find_package(PkgConfig)

pkg_check_modules(LIBDRM REQUIRED libdrm)

include_directories(.)
include_directories(${LIBDRM_INCLUDE_DIRS})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

link_libraries("libdrm.so")
link_libraries("libjpeg.so")
link_libraries("libpthread.so")
ADD_DEFINITIONS(-fpermissive)
set(BOOT_SET_H
	drm_common.h
    bootanimation.h
)
add_executable(modeset
    bootanimation.cpp
	drm_common.cpp
    modeset.cpp
    )

INSTALL(TARGETS modeset RUNTIME DESTINATION bin)
