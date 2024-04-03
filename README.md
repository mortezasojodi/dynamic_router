# dynamic_router

A router package for Flutter based on Navigation Api.

```dart
import 'package:approuter_example/detail/route/home_route.dart';
import 'package:approuter_example/home/route/home_route.dart';
import 'package:dynamic_router/approuter.dart';
import 'package:approuter_example/splash/route/splash_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late PPageStack<PagePath> pageStack;
  // late DynamicRouterDelegate routerDelegate;
  @override
  void initState() {
    // pageStack = ...
    // routerDelegate = ...
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: DynamicRouter.routerConfig(
        homePage: SplashRoute(),
        // delegate: routerDelegate
        // backButtonDispatcher:  PageStackBackButtonDispatcher(pageStack),
      ),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white)),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  routeToHome(BuildContext context) {
    AppRouter.pushAndRemoveUntil(HomeRoute(), (s) => false, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () => routeToHome(context),
          child: const Text(
            "to Home",
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  routeToDetail(BuildContext context, {required int id}) {
    AppRouter.pushPage(HomeDetailRoute(id: id), context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () => routeToDetail(context, id: 1),
          child: const Text(
            "to Detail",
          ),
        ),
      ),
    );
  }
}
```
