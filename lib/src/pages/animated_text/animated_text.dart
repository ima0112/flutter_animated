import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({super.key});

  @override
  State<AnimatedTextPage> createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage> {
  bool value = true;

  @override
  void initState() {
    value = Random().nextBool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Text')),
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.redAccent,
          child: value ? buildWavyAnimation() : buildColorizeAnimation(),
        ),
      ),
    );
  }

  Widget buildWavyAnimation() {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [WavyAnimatedText('Hello World')],
        repeatForever: true,
      ),
    );
  }

  Widget buildColorizeAnimation() {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'APPLE',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'SAMSUNG',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}
