cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

project(normals_estimation)

find_package(PCL 1.3 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable (normals_estimation normals_estimation.cpp)
target_link_libraries (normals_estimation ${PCL_LIBRARIES})
