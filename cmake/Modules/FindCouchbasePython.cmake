#
#     Copyright 2018 Couchbase, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# Provides CMake functions for installing Python 3 programs. This works
# in conjunction with the targets in tlm/python/CMakeLists.txt which
# install a local Python and build a bespoke Python installer for
# shipping with Couchbase Server.

# Note: This file should eventually replace FindCouchbasePythonInterp.cmake.

IF (NOT DEFINED COUCHBASE_PYTHON_INCLUDED)
  SET (COUCHBASE_PYTHON_INCLUDED 1)

  # Expected output files - might not exist yet

  SET (PYTHON_ROOT "${PROJECT_BINARY_DIR}/tlm/python")

  # Base directory for cbpy install - used by out-of-build programs such
  # as the non-installed wrapper scripts created by PyWrapper(). Note that
  # this directory is actually created by a target in
  # tlm/python/CMakeLists.txt.
  SET (CBPY_PATH lib/python/runtime)
  SET (CBPY_INSTALL "${CMAKE_INSTALL_PREFIX}/${CBPY_PATH}")

  IF (WIN32)
    SET (_localpy "${CBPY_INSTALL}/python3.exe")
  ELSE ()
    SET (_localpy "${CBPY_INSTALL}/bin/python3")
  ENDIF ()
  SET (PYTHON_EXE "${_localpy}" CACHE INTERNAL "Path to python interpreter")

  # Have to remember cwd when this find is INCLUDE()d
  SET (TLM_MODULES_DIR "${CMAKE_CURRENT_LIST_DIR}")

  # Creates a wrapper script from a template, in an OS-specific manner.
  FUNCTION (ConfigureWrapper CODE_REL LIB_REL PY_REL OUTPUT_FILE)
    IF (WIN32)
      SET (_wrapper py-wrapper.bat)
    ELSE ()
      IF (APPLE)
        SET (LIB_PATH_VAR DYLD_LIBRARY_PATH)
      ELSE ()
        SET (LIB_PATH_VAR LD_LIBRARY_PATH)
      ENDIF ()
      SET (_wrapper py-wrapper.sh)
    ENDIF ()

    # Convert any absolute paths to relative
    IF (IS_ABSOLUTE "${CODE_REL}")
      FILE (RELATIVE_PATH CODE_REL "${OUTPUT_FILE}/.." "${CODE_REL}")
    ENDIF ()
    IF (IS_ABSOLUTE "${LIB_REL}")
      FILE (RELATIVE_PATH LIB_REL "${OUTPUT_FILE}/.." "${LIB_REL}")
    ENDIF ()
    IF (IS_ABSOLUTE "${PY_REL}")
      FILE (RELATIVE_PATH PY_REL "${OUTPUT_FILE}/.." "${PY_REL}")
    ENDIF ()

    # Have to use OS-native paths
    FILE (TO_NATIVE_PATH "${CODE_REL}" CODE_REL)
    FILE (TO_NATIVE_PATH "${LIB_REL}" LIB_REL)
    FILE (TO_NATIVE_PATH "${PY_REL}" PY_REL)

    STRING (REGEX REPLACE "-.*" "" CB_VERSION "${PRODUCT_VERSION}")
    CONFIGURE_FILE (
      "${TLM_MODULES_DIR}/${_wrapper}.tmpl"
      "${OUTPUT_FILE}"
      @ONLY
    )
  ENDFUNCTION (ConfigureWrapper)

  # Create the master wrapper script for PyWrapper(), since all installed
  # programs can use the same one (same relative paths from wrapper script
  # to the code, libs, and python)
  IF (WIN32)
    SET (MASTER_WRAPPER "${PYTHON_ROOT}/py-wrapper.bat")
    ConfigureWrapper (../lib/python ../bin ../${CBPY_PATH}
      "${MASTER_WRAPPER}")
  ELSE ()
    SET (MASTER_WRAPPER "${PYTHON_ROOT}/py-wrapper.sh")
    ConfigureWrapper (../lib/python ../lib ../${CBPY_PATH}
      "${MASTER_WRAPPER}")
  ENDIF ()

  INCLUDE (ParseArguments)

  # Installs Python scripts into lib/python, and creates a wrapper in bin/
  # for executing them with the bundled Anaconda Python installation.
  #
  # Required arguments:
  #
  # SCRIPTS - name(s) of python script(s)
  #
  # Optional arguments:
  #
  # BUILD_DIR - absolute path to directory in build tree to also create a
  #   wrapper script in. If specified, a custom wrapper will be created for
  #   each named script. This script will launch Python 3 using the locally-
  #   installed cbpy installation in $BUILD_DIR/tlm/python/cbpy, created
  #   by targets in tlm/python/CMakeLists.txt.

  MACRO (PyWrapper)
    PARSE_ARGUMENTS (Py "SCRIPTS" "BUILD_DIR" "" ${ARGN})

    IF (NOT Py_SCRIPTS)
      MESSAGE (FATAL_ERROR "SCRIPTS is required!")
    ENDIF ()

    # Install the scripts themselves into lib/python
    INSTALL (PROGRAMS ${Py_SCRIPTS} DESTINATION lib/python)

    # Create and install wrapper script for each program
    FOREACH (_script ${Py_SCRIPTS})
      GET_FILENAME_COMPONENT (_scriptname "${_script}" NAME)
      IF (WIN32)
        SET (_scriptname "${_scriptname}.bat")
      ENDIF ()

      INSTALL (PROGRAMS "${MASTER_WRAPPER}"
        DESTINATION bin
        RENAME "${_scriptname}")

      IF (Py_BUILD_DIR)
        GET_FILENAME_COMPONENT (_scriptdir "${_script}/.." ABSOLUTE)

        ConfigureWrapper (
          "${_scriptdir}"
          "${CMAKE_INSTALL_PREFIX}/lib"
          "${CBPY_INSTALL}"
          "${Py_BUILD_DIR}/${_scriptname}"
        )
      ENDIF ()
    ENDFOREACH ()

  ENDMACRO (PyWrapper)

ENDIF (NOT DEFINED COUCHBASE_PYTHON_INCLUDED)