import 'package:dynamic_router/approuter.dart';
import 'package:flutter/material.dart';

typedef PageBuilder<T> = PAbstractPage<PagePath, T> Function();

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

  static pushCrossPage<T>(PAbstractPage<PagePath, dynamic> page,
      {required BuildContext context,
      Bindings? bindings,
      required Widget widget,
      double? width = 400,
      double? height = 650,
      required bool isLarge}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    if (isLarge) {
      return showDialog(
        context: context,
        child: widget,
      );
    } else {
      return context.pushPage(
        page,
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
    Bindings? bindings,
  }) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.pushAndRemoveUntil(page, routePredicate);
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.popPage(result);
  }

  static void popsheet<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context);
  }

  static Future showDialog(
      {required Widget child,
      required BuildContext context,
      Bindings? bindings,
      bool barrierDismissible = true,
      Offset? anchorPoint,
      String? barrierLabel,
      TraversalEdgeBehavior? traversalEdgeBehavior,
      bool useSafeArea = true,
      Color? barrierColor}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.showDialog(
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      traversalEdgeBehavior: traversalEdgeBehavior,
      useSafeArea: useSafeArea,
      context: context,
      builder: (BuildContext context) => child,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.4),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future showDialogWithRoute(
      {required PAbstractMaterialPage<PagePath, dynamic> child,
      required BuildContext context,
      Bindings? bindings,
      bool barrierDismissible = true,
      Offset? anchorPoint,
      String? barrierLabel,
      TraversalEdgeBehavior? traversalEdgeBehavior,
      bool useSafeArea = true,
      Color? barrierColor}) {
    if (bindings != null) {
      bindings.dependencies();
    }
    return context.showDialog(
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      traversalEdgeBehavior: traversalEdgeBehavior,
      useSafeArea: useSafeArea,
      context: context,
      builder: (BuildContext context) => child.child,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.4),
      barrierDismissible: barrierDismissible,
    );
  }
}
