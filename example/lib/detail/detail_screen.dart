import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/inner_detail/route/inner_detail_route.dart';
import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  final int id;
  const HomeDetailScreen({super.key, required this.id});

  toInnerDetail(BuildContext context) {
    AppRouter.pushPage(InnerDetailRoute(), context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("id : $id"),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => toInnerDetail(context),
              child: const Text(
                "to inner Detail",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
