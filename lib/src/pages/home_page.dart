import 'package:flutter/material.dart';
import 'package:flutter_animation/src/router/router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.square_rounded),
            title: const Text('Animated Container'),
            onTap: () {
              context.goNamed(MyRoutes.sample1.name);
            },
          )
        ],
      ),
    );
  }
}