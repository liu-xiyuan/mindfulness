# Install script for directory: D:/DeveloperTools/Projects/Flutter/mindfulness/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/build/x64-Debug/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/build/x64-Debug/runner/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/mindfulness.exe")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug" TYPE EXECUTABLE FILES "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/build/x64-Debug/runner/mindfulness.exe")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data/icudtl.dat")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data" TYPE FILE FILES "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/flutter/ephemeral/icudtl.dat")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/flutter_windows.dll")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug" TYPE FILE FILES "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/flutter/ephemeral/flutter_windows.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data/flutter_assets")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data/flutter_assets")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data" TYPE DIRECTORY FILES "D:/DeveloperTools/Projects/Flutter/mindfulness/build//flutter_assets")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee]|[Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/install/x64-Debug/data" TYPE FILE FILES "D:/DeveloperTools/Projects/Flutter/mindfulness/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/DeveloperTools/Projects/Flutter/mindfulness/windows/out/build/x64-Debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
