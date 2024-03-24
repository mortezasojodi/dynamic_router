//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <approuter/approuter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) approuter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ApprouterPlugin");
  approuter_plugin_register_with_registrar(approuter_registrar);
}
