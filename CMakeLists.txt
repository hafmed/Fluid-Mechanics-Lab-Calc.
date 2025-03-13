cmake_minimum_required(VERSION 3.16)

project(tp-labo-hyd VERSION 1.8.5 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Charts Core Gui Qml Quick)

qt_standard_project_setup(REQUIRES 6.5)

set(CMAKE_AUTORCC ON)

qt_add_executable(apptp-labo-hyd
    qmltp-labo-hyd.qrc
    imagestp-labo-hyd.qrc
    main.cpp
)
set(ANDROID_PACKAGE_SOURCE_DIR ${PROJECT_SOURCE_DIR}/android CACHE INTERNAL "")


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptp-labo-hyd PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptp-labo-hyd
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE

    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_link_libraries(apptp-labo-hyd PUBLIC
    Qt::Charts
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)

qt_add_qml_module(apptp-labo-hyd
    URI tp-labo-hyd
    VERSION 1.0
    QML_FILES qmltp-labo-hyd.qrc imagestp-labo-hyd.qrc
    SOURCES calculhaf.h calculhaf.cpp
    SOURCES fparser.cc fpoptimizer.cc fpconfig.hh fparser.hh
    SOURCES
)

include(GNUInstallDirs)
install(TARGETS apptp-labo-hyd
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
