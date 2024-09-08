cmake_minimum_required(VERSION 3.02.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)
set(CMAKE_PREFIX_PATH "/opt/ros/noetic;/home/dinhson/amr_ws/devel;/home/dinhson/Qt/6.7.2/gcc_64/lib/cmake/Qt6")
# set(CMAKE_MODULE_PATH "/home/dinhson/Qt/6.7.2/gcc_64/bin")
list(APPEND QML_IMPORT_PATH "/home/dinhson/Qt/6.7.2/gcc_64/qml")
project(hmi_agf LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

include_directories(/home/dinhson/yaml-cpp/include/yaml-cpp)
include_directories(/home/dinhson/Qt/6.7.2/gcc_64/qml)
link_directories(/home/dinhson/yaml-cpp/build)
link_directories(/home/dinhson/Qt/6.7.2/gcc_64/lib)
link_directories(/home/dinhson/Qt/6.7.2/gcc_64/qml)
link_directories(/usr/local/include/mongocxx/v_noabi)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  std_stamped_msgs
  message_generation
  std_srvs
  
  
)

find_package(bsoncxx CONFIG REQUIRED)
find_package(mongocxx CONFIG REQUIRED)
find_package(yaml-cpp REQUIRED)
message(STATUS "yaml-cpp found at: ${yaml-cpp_DIR}")
find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick Linguist QuickControls2)
# find_package(Qt6 REQUIRED COMPONENTS VirtualKeyboard)
# qt6_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} simplequick.ts)
# configure_file(${QM_FILES} ${CMAKE_SOURCE_DIR} COPYONLY)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()



generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
)

catkin_package(
  INCLUDE_DIRS ${catkin_INCLUDE_DIRS} 

  LIBRARIES hmi_agf
  CATKIN_DEPENDS roscpp std_msgs std_stamped_msgs message_runtime std_srvs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  
)

qt6_add_resources( qml.qrc  )
qt6_add_executable(hmi_agf  
    src/main.cpp 
    src/backend.cpp 
    src/include/backend.h 
    src/include/model_queue.h 
    src/include/model_buffer.h 
    src/include/model_pallet.h 
    src/include/json.hpp
    qml.qrc
    src/include/config_manager.h
    ${PROJECT_SOURCES}
    # ${QM_FILES}
)

qt6_add_translations(hmi_agf)

target_link_libraries(hmi_agf PRIVATE
    ${catkin_LIBRARIES}
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Linguist
    Qt6::QuickControls2
    yaml-cpp
    mongocxx
    bsoncxx
)
target_include_directories(hmi_agf PUBLIC "/usr/local/include/mongocxx/v_noabi;/usr/local/include/bsoncxx/v_noabi;/usr/local/lib;/usr/include/boost;/usr/local/include/bsoncxx/v_noabi/bsoncxx/third_party/mnmlstc;/usr/local/include/bsoncxx/v_noabi/bsoncxx/third_party/mnmlstc/core;/home/dinhson/yaml-cpp-yaml-cpp-0.6.3/include/yaml-cpp"
                        )
qt6_add_resources(hmi_agf "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf

)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

if (BUILD_QDS_COMPONENTS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
# include(${CMAKE_CURRENT_SOURCE_DIR}/simplequick.qm)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

install(TARGETS hmi_agf
    BUNDLE DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
install(TARGETS hmi_agf
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
# make IDEs aware of the QML import path
set(QML_IMPORT_PATH ${PROJECT_BINARY_DIR}/qml CACHE PATH
    "Path to the custom QML components defined by the project")
