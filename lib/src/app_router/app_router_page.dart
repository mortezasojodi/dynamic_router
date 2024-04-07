import 'dart:async';

import 'package:dynamic_router/approuter.dart';
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
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
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

  Future showDialogRoute<R>({
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
    var page = RoutePage(
        child: Semantics(
          scopesRoute: true,
          explicitChildNodes: true,
          child: DisplayFeatureSubScreen(
            anchorPoint: anchorPoint,
            child: child,
          ),
        ),
        classFactoryKey: child.hashCode.toString());

    return delegate.pageStack.push(page);
    // return delegate.pageStack.pushOverLay(
    //     IndexedData<OverlayEntry>(
    //         id: child.key.toString(),
    //         rootOverlay: true,
    //         data: overlayEntry,
    //         completer: Completer()),
    //     context);
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
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    return delegate.pageStack.pushReplacmentPage<R>(page);
  }

  void popPage([dynamic data]) {
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
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
    var delegate = Router.of(this).routerDelegate as DynamicRouterDelegate;
    return delegate.pageStack.pushAndRemoveUntil(page, routePredicate);
  }
}

class RoutePage extends StatelessMaterialPage {
  RoutePage({
    required Widget child,
    required String classFactoryKey,
  }) : super(
          key: ValueKey(classFactoryKey),
          child: child,
          factoryKey: classFactoryKey,
        );
}
