import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router/src/models/binding.dart';
import 'package:flutter/material.dart';

typedef PageBuilder<T> = PAbstractPage<PagePath, T> Function();

class AppPageRouter {
  static Future<dynamic> pushPage(
    PAbstractPage<PagePath, dynamic> page, {
    required BuildContext context,
  }) {
    return context.pushPage(page);
  }

  static Future<dynamic> pushReplacmentPage(
    PAbstractPage<PagePath, dynamic> page, {
    required BuildContext context,
  }) {
    return context.pushReplacmentPage(page);
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

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.popPage(result);
  }

  //TODO will implement on next version
  static void popsheet<T extends Object?>(BuildContext context, [T? result]) {
    context.popPage(result);
  }
}
