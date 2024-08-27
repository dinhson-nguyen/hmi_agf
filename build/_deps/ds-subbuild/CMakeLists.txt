# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(ds-populate NONE)

include(ExternalProject)
ExternalProject_Add(ds-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_TAG" "qds-4.4" "GIT_REPOSITORY" "https://code.qt.io/qt-labs/qtquickdesigner-components.git"
                    SOURCE_DIR          "/home/dinhson/amr_ws/src/hmi_agf/build/_deps/ds-src"
                    BINARY_DIR          "/home/dinhson/amr_ws/src/hmi_agf/build/_deps/ds-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
