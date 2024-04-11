import 'package:dynamic_router/approuter.dart';
import 'package:flutter/material.dart';

class InnerDetaiPage extends StatelessWidget {
  const InnerDetaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => AppRouter.pop(context),
              child: const Text(
                "pop",
              ),
            ),
          ),
          const Center(
            child: Text("innerDetail"),
          ),
        ],
      ),
    );
  }
}
