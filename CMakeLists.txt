cmake_minimum_required(VERSION 3.14)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(prelude)

project(
  widget-animation-framework
  VERSION 0.1.0
  DESCRIPTION "Small extension for animate Qt widgets."
  HOMEPAGE_URL "https://example.com/"
  LANGUAGES CXX
)

include(project-is-top-level)
include(variables)
include(link_qt)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ---- Declare library ----
add_library(
  widget-animation-framework
  source/Animation/Animation.cpp
  source/Animation/CircleFill/CircleFillAnimator.cpp
  source/Animation/CircleFill/CircleFillDecorator.cpp
  source/Animation/Expand/ExpandAnimator.cpp
  source/Animation/Expand/ExpandDecorator.cpp
  source/Animation/SideSlide/SideSlideAnimator.cpp
  source/Animation/SideSlide/SideSlideDecorator.cpp
  source/Animation/Slide/SlideAnimator.cpp
  source/Animation/Slide/SlideForegroundDecorator.cpp
  source/StackedWidgetAnimation/StackedWidgetAnimation.cpp
  source/StackedWidgetAnimation/StackedWidgetFadeIn/StackedWidgetFadeInAnimator.cpp
  source/StackedWidgetAnimation/StackedWidgetFadeIn/StackedWidgetFadeInDecorator.cpp
  source/StackedWidgetAnimation/StackedWidgetSlide/StackedWidgetSlideAnimator.cpp
  source/StackedWidgetAnimation/StackedWidgetSlide/StackedWidgetSlideDecorator.cpp
  source/StackedWidgetAnimation/StackedWidgetSlideOver/StackedWidgetSlideOverAnimator.cpp
  source/StackedWidgetAnimation/StackedWidgetSlideOver/StackedWidgetSlideOverDecorator.cpp
  source/AbstractAnimator.h
  source/Animation/AnimationPrivate.h
  source/Animation/CircleFill/CircleFillAnimator.h
  source/Animation/CircleFill/CircleFillDecorator.h
  source/Animation/Expand/ExpandAnimator.h
  source/Animation/Expand/ExpandDecorator.h
  source/Animation/SideSlide/SideSlideAnimator.h
  source/Animation/SideSlide/SideSlideDecorator.h
  source/Animation/Slide/SlideAnimator.h
  source/Animation/Slide/SlideForegroundDecorator.h
  source/StackedWidgetAnimation/StackedWidgetAnimationPrivate.h
  source/StackedWidgetAnimation/StackedWidgetFadeIn/StackedWidgetFadeInAnimator.h
  source/StackedWidgetAnimation/StackedWidgetFadeIn/StackedWidgetFadeInDecorator.h
  source/StackedWidgetAnimation/StackedWidgetSlide/StackedWidgetSlideAnimator.h
  source/StackedWidgetAnimation/StackedWidgetSlide/StackedWidgetSlideDecorator.h
  source/StackedWidgetAnimation/StackedWidgetSlideOver/StackedWidgetSlideOverAnimator.h
  source/StackedWidgetAnimation/StackedWidgetSlideOver/StackedWidgetSlideOverDecorator.h
)
add_library(widget-animation-framework::widget-animation-framework ALIAS widget-animation-framework)
target_link_libraries(widget-animation-framework PRIVATE ${QT_LIBRARIES})

include(GenerateExportHeader)
generate_export_header(
  widget-animation-framework
  BASE_NAME widget-animation-framework
  EXPORT_FILE_NAME export/widget-animation-framework/widget-animation-framework_export.hpp
  CUSTOM_CONTENT_FROM_VARIABLE pragma_suppress_c4251
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(widget-animation-framework PUBLIC WIDGET_ANIMATION_FRAMEWORK_STATIC_DEFINE)
endif()

set_target_properties(
  widget-animation-framework PROPERTIES
  CXX_VISIBILITY_PRESET hidden
  VISIBILITY_INLINES_HIDDEN YES
  VERSION "${PROJECT_VERSION}"
  SOVERSION "${PROJECT_VERSION_MAJOR}"
  EXPORT_NAME widget-animation-framework
  OUTPUT_NAME widget-animation-framework
)

target_include_directories(
  widget-animation-framework ${warning_guard}
  PUBLIC
  "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_include_directories(
  widget-animation-framework SYSTEM
  PUBLIC
  "$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>"
)

target_compile_features(widget-animation-framework PUBLIC cxx_std_17)

add_subdirectory(example)
