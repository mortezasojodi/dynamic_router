import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/detail/detail_screen.dart';
import 'package:dynamic_router_example/detail/route/detail_path.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';
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
