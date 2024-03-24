import 'package:approuter/app_router.dart';
import 'package:approuter_example/home/home_screen.dart';
import 'package:approuter_example/home/route/home_path.dart';
import 'package:approuter_example/routes/app_routes.dart';
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
