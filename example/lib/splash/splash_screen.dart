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
    // Future.delayed(const Duration(seconds: 1)).then((value) {
    //   AppRouter.pushAndRemoveUntil(HomeRoute(), (s) => false, context: context);
    // });
    super.initState();
  }

  routeToHome() {
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
          onPressed: routeToHome,
          child: const Text(
            "to Home",
          ),
        ),
      ),
    );
  }
}
