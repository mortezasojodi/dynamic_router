import 'package:dynamic_router/src/pages/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutePageDialog<T> extends PAbstractMaterialPageDialog {
  final Widget child;
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  RoutePageDialog({
    this.anchorPoint,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    required this.child,
    required String classFactoryKey,
  }) : super(
          key: ValueKey(classFactoryKey),
          factoryKey: classFactoryKey,
        );
  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          child: child,
        ),
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}

// class DialogPage<T> extends Page<T> {
//   final Offset? anchorPoint;
//   final Color? barrierColor;
//   final bool barrierDismissible;
//   final String? barrierLabel;
//   final bool useSafeArea;
//   final CapturedThemes? themes;
//   final WidgetBuilder builder;

//   const DialogPage({
//     required this.builder,
//     this.anchorPoint,
//     this.barrierColor,
//     this.barrierDismissible = true,
//     this.barrierLabel,
//     this.useSafeArea = true,
//     this.themes,
//     super.key,
//     super.name,
//     super.arguments,
//     super.restorationId,
//   });

//   @override
//   Route<T> createRoute(BuildContext context) => DialogRoute<T>(
//         context: context,
//         settings: this,
//         builder: (context) => Dialog(
//           child: builder(context),
//         ),
//         anchorPoint: anchorPoint,
//         barrierColor: barrierColor ?? Colors.black.withOpacity(.4),
//         barrierDismissible: barrierDismissible,
//         barrierLabel: barrierLabel,
//         useSafeArea: useSafeArea,
//         themes: themes,
//       );
// }
