cmake_minimum_required(VERSION 3.20.0)
project(SimpleCalculator VERSION 0.0.1 LANGUAGES CXX)

# Setting C++ Version to 2020
set(CMAKE_CXX_STANDARD 20)

# Set the path to your C++ source files
set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/SimpleCalculator.cpp
)

# Set the path to your header files
set(HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/SimpleCalculator.hpp
)

# Create the dynamic library
add_library(${PROJECT_NAME} SHARED ${SOURCES} ${HEADERS})

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

# Set the install name for the dynamic library
set_target_properties(${PROJECT_NAME} PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_NAME_DIR "@rpath"
)

# Optionally, set additional compiler flags if needed
# target_compile_options(Calculator PRIVATE ...)

# Optionally, set additional include directories if needed
# target_include_directories(Calculator PRIVATE ...)

# Optionally, link against additional libraries if needed
# target_link_libraries(Calculator PRIVATE ...)

# Set the installation path for the dynamic library
install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION lib
)