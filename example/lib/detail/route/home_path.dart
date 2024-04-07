import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeDetailPath extends PagePath {
  static const _location = Approutes.homeDetailRoute;
  static const pagekey = Approutes.homeDetailRoute;

  const HomeDetailPath() : super(key: pagekey);

  @override
  PAbstractMaterialPage? tryParse(RouteInformation ri) {
    return null;
  }

  @override
  String get location => _location;
}
