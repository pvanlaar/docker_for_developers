# wrapper function for FetchContent
function(fetch_external_project)
    # parsing of named arguments. They are all required
    set(oneValueArgs NAME URL TAG CMAKE_ARGS)
    cmake_parse_arguments(FETCH "" "${oneValueArgs}" "" ${ARGN})

    # when required arguments are missing then error is thrown.
    foreach (required_parameter ${oneValueArgs})
        if (NOT FETCH_${required_parameter})
            message(SEND_ERROR "\nRequired parameter ${required_parameter} is ommitted in call to fetch_external_project\n")
        endif()
    endforeach()

    include(FetchContent)
    FetchContent_Declare(
        ${FETCH_NAME}
        GIT_REPOSITORY ${FETCH_URL}
        GIT_TAG        ${FETCH_TAG}
        CMAKE_ARGS ${CMAKE_ARGS}
    )
    FetchContent_MakeAvailable(${FETCH_NAME})

    message(STATUS "Fetched ${FETCH_NAME} version ${${FETCH_NAME}_FIND_VERSION}")
endfunction()