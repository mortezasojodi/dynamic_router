import 'package:approuter/app_router.dart';
import 'package:approuter_example/splash/route/splash_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PPageStack<PagePath> pageStack;
  late PageStackRouterDelegate routerDelegate;
  @override
  void initState() {
    pageStack = PageStack(
      bottomPage: SplashRoute(),
    );
    routerDelegate = PageStackRouterDelegate(
      pageStack,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: routerDelegate,
      backButtonDispatcher: PageStackBackButtonDispatcher(pageStack),
      routeInformationParser: const PageStackRouteInformationParser(),
    );
  }
}
