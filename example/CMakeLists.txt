cmake_minimum_required(VERSION 3.14)

project(widget-animation-frameworkExamples CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)
include(link_qt)

if(PROJECT_IS_TOP_LEVEL)
  find_package(widget-animation-framework REQUIRED)
endif()

add_custom_target(run-examples)

function(add_example NAME)
  add_executable("${NAME}" "${NAME}.cpp")
  target_link_libraries("${NAME}" PRIVATE widget-animation-framework::widget-animation-framework PRIVATE ${QT_LIBRARIES})
  target_compile_features("${NAME}" PRIVATE cxx_std_17)
  add_custom_target("run_${NAME}" COMMAND "${NAME}" VERBATIM)
  add_dependencies("run_${NAME}" "${NAME}")
  add_dependencies(run-examples "run_${NAME}")
endfunction()

add_example(WidgetAnimationFrameworkExample)

add_folders(Example)
