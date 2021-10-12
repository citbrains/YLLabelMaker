cmake_minimum_required(VERSION 3.10)
project(LabelMaker)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
find_package(OpenCV)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

if(OpenCV_VERSION VERSION_LESS "4.0")
else()
    add_definitions(-DCV4)
endif(OpenCV_VERSION VERSION_LESS)
find_package(Qt5 COMPONENTS Core REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)
set(QT_USE_QTMAIN true)
set(QT_USE_QTGUI true)
set(QT_USE_QTNETWORK true)
set(QT_USE_QTOPENGL true)
INCLUDE_DIRECTORIES(${QT_USE_FILE})
add_definitions(${QT_DEFINITIONS})
include(labelmaker.cmake)
QT5_WRAP_UI(LABELMAKER_UIS_H ${LABELMAKER_UIS})
QT5_WRAP_CPP(LABELMAKER_MOC_SRCS ${LABELMAKER_MOC_HDRS})

include_directories(${CMAKE_CURRENT_BINARY_DIR} src)
add_executable(LabelMaker
	${LABELMAKER_SRCS}
	${LABELMAKER_UIS_H}
	${LABELMAKER_MOC_SRCS}
)

target_link_libraries(LabelMaker
	Qt5::Widgets
    ${OpenCV_LIBS}
	${QT_LIBRARIES}
	)
