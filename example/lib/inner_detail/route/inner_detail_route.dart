import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/inner_detail/inner_detail_page.dart';
import 'package:dynamic_router_example/inner_detail/route/inner_detail_path.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';
import 'package:flutter/material.dart';

class InnerDetailRoute extends StatelessMaterialPage {
  static const classFactoryKey = Approutes.innerDetailRoute;

  InnerDetailRoute()
      : super(
          key: const ValueKey(classFactoryKey),
          child: const InnerDetaiPage(),
          factoryKey: classFactoryKey,
          path: const InnerDetailPath(),
        );
}
