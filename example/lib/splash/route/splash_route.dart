import 'package:approuter/app_router.dart';
import 'package:approuter_example/routes/app_routes.dart';
import 'package:approuter_example/splash/route/splash_path.dart';
import 'package:approuter_example/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashRoute extends StatelessMaterialPage {
  static const classFactoryKey = Approutes.splashRoute;

  SplashRoute()
      : super(
          key: const ValueKey(classFactoryKey),
          child: const SplashScreen(),
          factoryKey: classFactoryKey,
          path: const SplashPath(),
        );
}
