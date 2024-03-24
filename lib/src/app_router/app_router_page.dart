import 'dart:async';

import 'package:approuter/app_router.dart';
import 'package:flutter/material.dart';

extension BeamerExtensions on BuildContext {
  Future<R?> pushPage<R>(
    PAbstractPage<PagePath, R> page, {
    Object? data,
    TransitionDelegate? transitionDelegate,
    bool beamBackOnPop = false,
    bool popBeamLocationOnPop = false,
    bool stacked = true,
    bool replaceRouteInformation = false,
  }) {
    var delegate = Router.of(this).routerDelegate as PageStackRouterDelegate;
    return delegate.pageStack.push<R>(page);
  }

  Future showDialog<T>({
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

    var delegate = Router.of(this).routerDelegate as PageStackRouterDelegate;

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

  Future<R?> pushReplacmentPage<R>(
    PAbstractPage<PagePath, R> page, {
    Object? data,
    TransitionDelegate? transitionDelegate,
    bool beamBackOnPop = false,
    bool popBeamLocationOnPop = false,
    bool stacked = true,
    bool replaceRouteInformation = false,
  }) {
    var delegate = Router.of(this).routerDelegate as PageStackRouterDelegate;
    return delegate.pageStack.pushReplacmentPage<R>(page);
  }

  void popPage([dynamic data]) {
    var delegate = Router.of(this).routerDelegate as PageStackRouterDelegate;
    delegate.pageStack.pop(this, data);
  }

  Future<R?> pushAndRemoveUntil<R>(
    PAbstractPage<PagePath, R> page,
    AppRoutePredicate routePredicate, {
    Object? data,
    TransitionDelegate? transitionDelegate,
    bool beamBackOnPop = false,
    bool popBeamLocationOnPop = false,
    bool stacked = true,
    bool replaceRouteInformation = false,
  }) {
    var delegate = Router.of(this).routerDelegate as PageStackRouterDelegate;
    return delegate.pageStack.pushAndRemoveUntil(page, routePredicate);
  }
}
