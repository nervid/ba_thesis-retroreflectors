# Install script for directory: /home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/swig

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder" TYPE MODULE FILES "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig/_backscatter_decoder_swig.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so"
         OLD_RPATH "/home/free_hat/programs/SoC/Altera/16.1/quartus/linux64:/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder/_backscatter_decoder_swig.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder" TYPE FILE FILES "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig/backscatter_decoder_swig.py")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/backscatter_decoder" TYPE FILE FILES
    "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig/backscatter_decoder_swig.pyc"
    "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig/backscatter_decoder_swig.pyo"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/backscatter_decoder/backscatter_decoder/swig" TYPE FILE FILES
    "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/swig/backscatter_decoder_swig.i"
    "/home/free_hat/git/retroreflectors/dsp/grc/blocks/gr-backscatter_decoder/build/swig/backscatter_decoder_swig_doc.i"
    )
endif()
