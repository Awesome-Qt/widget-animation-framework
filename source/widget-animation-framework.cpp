#include <string>

#include "widget-animation-framework/widget-animation-framework.hpp"

exported_class::exported_class()
    : m_name {"widget-animation-framework"}
{
}

auto exported_class::name() const -> const char*
{
  return m_name.c_str();
}
