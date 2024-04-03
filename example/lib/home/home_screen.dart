import 'package:approuter_example/detail/route/home_route.dart';
import 'package:dynamic_router/approuter.dart';
import 'package:flutter/material.dart';

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
