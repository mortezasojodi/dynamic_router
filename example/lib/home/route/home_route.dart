import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/home/home_screen.dart';
import 'package:dynamic_router_example/home/route/home_path.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';

import 'package:flutter/material.dart';

class HomeRoute extends StatelessMaterialPage {
  static const classFactoryKey = Approutes.homeRoute;

  HomeRoute()
      : super(
          key: const ValueKey(classFactoryKey),
          child: const HomeScreen(),
          factoryKey: classFactoryKey,
          path: const HomePath(),
        );
}
