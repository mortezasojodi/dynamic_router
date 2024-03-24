import 'package:approuter/app_router.dart';
import 'package:approuter/src/models/binding.dart';
import 'package:flutter/material.dart';

typedef PageBuilder<T> = PAbstractPage<PagePath, T> Function();

class AppPageRouter {
  // Future<T?>? pushAndRemoveUntil<T>(Widget widget,
  //     {BuildContext? context, bool Function(Route<dynamic>)? predicate}) {
  //   return Get.offUntil(MaterialPageRoute(builder: (ctx) => widget),
  //       predicate ?? (route) => false);
  // }

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

  // static Future<T?> pushNamedCross<T>(String pagename,
  //     {required BuildContext context,
  //     Map<String, String> pathParameters = const <String, String>{},
  //     Map<String, dynamic> queryParameters = const <String, dynamic>{},
  //     Object? extra,
  //     double? width,
  //     double? height,
  //     required Widget page,
  //     Bindings? bindings}) {
  //   if (bindings != null) {
  //     bindings.dependencies();
  //   }

  //   if (AppConstants.isLargView) {
  //     return openWebDilog(bindings,
  //         context: context,
  //         child: page,
  //         width: width ?? AppConstants.webWidth,
  //         heigh: height ?? AppConstants.webHeight,
  //         arguments: extra);
  //   } else {
  //     return context.pushNamed(pagename,
  //         queryParameters: queryParameters,
  //         pathParameters: pathParameters,
  //         extra: extra);
  //   }
  // }

  // static Future<T?> pushCrosss<T>(
  //   String location, {
  //   required BuildContext context,
  //   required Widget page,
  //   Object? extra,
  //   Bindings? bindings,
  //   double? width,
  //   double? height,
  // }) {
  //   if (AppConstants.isLargView) {
  //     return openWebDilog(bindings,
  //         context: context,
  //         child: page,
  //         width: width ?? AppConstants.webWidth,
  //         heigh: height ?? AppConstants.webHeight,
  //         arguments: extra);
  //   } else {
  //     return context.push(location, extra: extra);
  //   }
  // }

  // static pushCrossPage<T>(
  //   PAbstractPage<PagePath, dynamic> location, {
  //   required BuildContext context,
  //   required Widget page,
  //   Object? extra,
  //   Bindings? bindings,
  //   double? width,
  //   double? height,
  // }) {
  //   if (AppConstants.isLargView) {
  //     return openWebDilog(bindings,
  //         context: context,
  //         child: page,
  //         width: width ?? AppConstants.webWidth,
  //         heigh: height ?? AppConstants.webHeight,
  //         arguments: extra);
  //   } else {
  //     return context.pushPage(
  //       location,
  //     );
  //   }
  // }

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

  static void popsheet<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.of(context).pop();
  }

// Future<T?> openWebDilog<T>(Bindings? dependecy,
//     {required Widget child,
//     required BuildContext context,
//     double? width,
//     double? heigh,
//     Color color = Colors.black,
//     AlignmentGeometry? alignment,
//     bool barrierDismissible = true,
//     Object? arguments,
//     Color? barrierColor}) {
//   dependecy?.dependencies();
//   Dialog customDialog = Dialog(
//     backgroundColor: Colors.transparent,
//     surfaceTintColor: Colors.transparent,
//     elevation: 0,
//     alignment: alignment,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//     child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: color,
//         ),
//         width: width ?? AppConstants.webWidth,
//         height: heigh ?? AppConstants.webHeight,
//         child: child),
//   );

//   return showDialog(
//     context: context,
//     routeSettings: RouteSettings(arguments: arguments),
//     builder: (BuildContext context) => customDialog,
//     barrierColor: barrierColor ?? Colors.black.withOpacity(.1),
//     barrierDismissible: barrierDismissible,
//   );
}
