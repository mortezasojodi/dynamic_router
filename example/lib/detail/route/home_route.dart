import 'package:approuter_example/detail/detail_screen.dart';
import 'package:approuter_example/detail/route/home_path.dart';
import 'package:dynamic_router/approuter.dart';
import 'package:approuter_example/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeDetailRoute extends StatelessMaterialPage {
  static const classFactoryKey = Approutes.homeDetailRoute;

  HomeDetailRoute({required int id})
      : super(
          key: const ValueKey(classFactoryKey),
          child: HomeDetailScreen(
            id: id,
          ),
          factoryKey: classFactoryKey,
          path: const HomeDetailPath(),
        );
}
