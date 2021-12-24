# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
Quickfix
-------
Module works only on linux, recommended location is /usr/share/cmake-x.x.x/Modules/

Finds the Foo library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Quickfix::Quickfix``
  The Quickfix library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``Quickfix_FOUND``
  True if the system has the Foo library.
``Quickfix_INCLUDE_DIRS``
  Include directories needed to use Foo.
``Quickfix_LIBRARIES``
  Libraries needed to link to Foo.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``Quickfix_INCLUDE_DIR``
  The path to the quickfix includes
``Quickfix_LIBRARY``
  The path to the runtime dependencies. Quickfix needs only glibc based on what
  is in documentation.

#]=======================================================================]

#Store include path in variable
find_path(Quickfix_INCLUDE_DIR NAME 
    quickfix
    PATHS
    /usr/local/include/
)
message(STATUS "Quickfix include dir: ${Quickfix_INCLUDE_DIR}")

#Store library path in variable
find_library(Quickfix_LIBRARY NAMES quickfix
	PATHS
	/usr/local/lib/
)
message(STATUS "Quickfix lib dir: ${Quickfix_LIBRARY}")
include(FindPackageHandleStandardArgs)
#Fill Quickfix_FOUND variable
find_package_handle_standard_args(Quickfix DEFAULT_MSG
    Quickfix_LIBRARY
    Quickfix_INCLUDE_DIR
)

if(Quickfix_FOUND AND NOT TARGET Quickfix::Quickfix)
  add_library(Quickfix::Quickfix UNKNOWN IMPORTED)
  set_target_properties(Quickfix::Quickfix PROPERTIES
  IMPORTED_LOCATION "${Quickfix_LIBRARY}"
  INTERFACE_INCLUDE_DIRECTORIES "${Quickfix_INCLUDE_DIR}"
  )
endif()

