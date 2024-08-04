import 'package:dynamic_router/approuter.dart';
import 'package:flutter/widgets.dart';

class AppRouteWidgetBuilder extends StatelessWidget {
  final PAbstractMaterialPage<PagePath, dynamic> child;
  const AppRouteWidgetBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child.child;
  }
}
