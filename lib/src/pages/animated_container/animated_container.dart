import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  final random = Random();
  double boxHeight = 100;
  double boxWidth = 100;
  Color boxColor = Colors.deepPurple;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  void _changeBoxSize() {
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
      boxHeight = random.nextInt(400).toDouble();
    });
  }

  void _changeBoxColor() {
    setState(() {
      boxColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeRadius() {
    setState(() {
      _borderRadius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: boxHeight,
          width: boxWidth,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          switch (value) {
            case 1:
              _changeBoxColor();
              break;
            case 2:
              _changeRadius();
              break;
            default:
              _changeBoxSize();
          }
        },
        items: const [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.palette_rounded)),
          BottomNavigationBarItem(
              label: '', icon: Icon(Icons.interests_rounded)),
          BottomNavigationBarItem(
              label: '', icon: Icon(Icons.aspect_ratio_rounded)),
        ],
      ),
    );
  }
}
