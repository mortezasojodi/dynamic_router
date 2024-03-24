#include "include/approuter/approuter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "approuter_plugin.h"

void ApprouterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  approuter::ApprouterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
