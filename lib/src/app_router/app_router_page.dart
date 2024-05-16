import 'dart:async';

import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router/src/route/dialog_route.dart';
import 'package:flutter/material.dart';

extension DynamicRouterExtensions on BuildContext {
  Future<R?> pushPage<R>(PAbstractPage<PagePath, R> page) {
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    return delegate.pageStack.push<R>(page);
  }

  Future showDialogOverlay<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool rootOverlay = true,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;

    Widget child = builder(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          ModalBarrier(
            color: barrierColor,
            onDismiss: () {
              popPage();
            },
          ),
          builder(context),
        ],
      ),
    );

    return delegate.pageStack.pushOverLay(
        IndexedData<OverlayEntry>(
            id: child.key.toString(),
            rootOverlay: true,
            data: overlayEntry,
            completer: Completer()),
        context);
  }

  Future showDialog<R>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;

    Widget child = builder(context);
    var page = RoutePageDialog(
        anchorPoint: anchorPoint,
        barrierDismissible: barrierDismissible,
        useSafeArea: useSafeArea,
        barrierLabel: barrierLabel,
        barrierColor: barrierColor,
        child: child,
        classFactoryKey: child.hashCode.toString());

    return delegate.pageStack.push(page);
  }

  Future<R?> pushReplacmentPage<R>(
    PAbstractPage<PagePath, R> page,
  ) {
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    return delegate.pageStack.pushReplacmentPage<R>(page);
  }

  void popPage([dynamic data]) {
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    delegate.pageStack.pop(this, data);
  }

  Future<R?> pushAndRemoveUntil<R>(
    PAbstractPage<PagePath, R> page,
    AppRoutePredicate routePredicate,
  ) {
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    return delegate.pageStack.pushAndRemoveUntil(page, routePredicate);
  }
}
