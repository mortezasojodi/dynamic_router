import 'package:dynamic_router/approuter.dart';
import 'package:approuter_example/home/route/home_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      AppRouter.pushPage(HomeRoute(), context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Text(
        "Splash",
      ),
    );
  }
}
