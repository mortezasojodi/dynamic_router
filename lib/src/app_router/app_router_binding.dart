import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router/src/models/binding.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Future<dynamic> pushPage(PAbstractPage<PagePath, dynamic> page,
      {required BuildContext context, Bindings? bindings}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.pushPage(page);
  }

  static Future<dynamic> pushReplacmentPage(
      PAbstractPage<PagePath, dynamic> page,
      {required BuildContext context,
      Bindings? bindings}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.pushReplacmentPage(page);
  }

  static pushCrossPage<T>(PAbstractPage<PagePath, dynamic> location,
      {required BuildContext context,
      required Widget page,
      Object? extra,
      Bindings? bindings,
      double? width = 400,
      double? height = 650,
      required bool isLarge}) {
    if (isLarge) {
      return openWebDilog(bindings,
          context: context,
          child: page,
          width: width,
          height: height,
          arguments: extra);
    } else {
      return context.pushPage(
        location,
      );
    }
  }

  static Future<dynamic> pushPageLazy(PageBuilder<dynamic> page,
      {required BuildContext context, Bindings? bindings}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.pushPage(page());
  }

  static Future<dynamic> pushAndRemoveUntil<T>(
    PAbstractPage<PagePath, dynamic> page,
    AppRoutePredicate routePredicate, {
    required BuildContext context,
  }) {
    return context.pushAndRemoveUntil(page, routePredicate);
  }

  static _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.popPage(result);
  }

  static void popoverlay<T extends Object?>(BuildContext context, [T? result]) {
    context.popPage(result);
  }

  static void popsheet<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.of(context).pop();
  }

  static Future showDilog(
      {required Widget child,
      required BuildContext context,
      Bindings? dependecy,
      bool barrierDismissible = true,
      Object? arguments,
      double? width = 300,
      double? height = 146,
      AlignmentGeometry? alignment,
      Color? barrierColor}) {
    Dialog customDialog = Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      alignment: alignment,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: child),
    );
    return context.showDialog(
      context: context,
      routeSettings: RouteSettings(arguments: arguments),
      builder: (BuildContext context) => customDialog,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.4),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future showDialogRoute(
      {required Widget child,
      required BuildContext context,
      Bindings? dependecy,
      bool barrierDismissible = true,
      Object? arguments,
      double? width = 300,
      double? height = 146,
      AlignmentGeometry? alignment,
      Color? barrierColor}) {
    Dialog customDialog = Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      alignment: alignment,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: child),
    );
    if (dependecy != null) {
      dependecy.dependencies();
    }

    return context.showDialogRoute(
      context: context,
      routeSettings: RouteSettings(arguments: arguments),
      builder: (BuildContext context) => customDialog,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.4),
      barrierDismissible: barrierDismissible,
    );
  }
}

Future openWebDilog(Bindings? dependecy,
    {required Widget child,
    required BuildContext context,
    double? width = 400,
    double? height = 650,
    Color color = Colors.black,
    AlignmentGeometry? alignment,
    bool barrierDismissible = true,
    Object? arguments,
    Color? barrierColor}) {
  dependecy?.dependencies();
  Dialog customDialog = Dialog(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    alignment: alignment,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        width: width,
        height: height,
        child: child),
  );

  return context.showDialog(
    context: context,
    routeSettings: RouteSettings(arguments: arguments),
    builder: (BuildContext context) => customDialog,
    barrierColor: barrierColor ?? Colors.black.withOpacity(.1),
    barrierDismissible: barrierDismissible,
  );
}
