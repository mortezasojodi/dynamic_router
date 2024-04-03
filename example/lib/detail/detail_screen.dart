import 'package:dynamic_router/approuter.dart';
import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  final int id;
  const HomeDetailScreen({super.key, required this.id});

  pop(BuildContext context) {
    AppRouter.pop(context);
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
              onPressed: () => pop(context),
              child: const Text(
                "pop",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
