import 'package:dynamic_router/approuter.dart';
import 'package:flutter/material.dart';

class DynamicRouter {
  DynamicRouterDelegate? _delegate;
  PageStackRouteInformationParser? _provider;
  // static RouteInformationParser? _infoProvider;
  BackButtonDispatcher? _backButtonDispatcher;
  PPageStack<PagePath>? _pageStack;

  RouterConfig<Object> routerConfig({
    String initialPath = '',
    DynamicRouterDelegate? delegate,
    PageStack? pageStack,
    BackButtonDispatcher? backButtonDispatcher,
    required PAbstractPage<PagePath, dynamic> homePage,
    final GlobalKey<NavigatorState>? navigatorkey,
    String notFoundPath = '404',
    List<NavigatorObserver> observers = const [],
    // List<RouteMiddleware> middlewares = const [],
  }) {
    _pageStack ??= pageStack ??
        PageStack(
          bottomPage: homePage,
        );

    _delegate ??=
        delegate ?? DynamicRouterDelegate(_pageStack!, navkey: navigatorkey);

    _backButtonDispatcher ??=
        backButtonDispatcher ?? PageStackBackButtonDispatcher(_pageStack!);
    // defaultRouteBuilder = routeBuilder ?? materialRouteBuilder;

    // _provider ??= RouteflyInformationParser(
    //   RouteAggregate(
    //     routes: routes,
    //     notFoundPath: notFoundPath,
    //   ),
    //   middlewares,
    // );

    // _infoProvider ??= PlatformRouteInformationProvider(
    //   initialRouteInformation: RouteInformation(
    //     uri: Uri.parse(initialPath),
    //     state: RouteRequest(
    //       arguments: null,
    //       type: RouteType.navigate,
    //       rootNavigator: false,
    //     ),
    //   ),
    // );

    // _delegate ??= RouteflyRouterDelegate([
    //   HeroController(),
    //   ...observers,
    // ]);

    return RouterConfig(
        routerDelegate: _delegate!,
        routeInformationParser: _provider,
        // routeInformationProvider: _infoProvider,
        backButtonDispatcher: _backButtonDispatcher);
  }
}
