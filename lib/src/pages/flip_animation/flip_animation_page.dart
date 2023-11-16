import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/src/utils/assets.dart';

class FlipAnimationPage extends StatelessWidget {
  const FlipAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flipping Card')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: FlipCardWidget(
          front: Image.asset(AppAsset.front),
          back: Image.asset(AppAsset.back),
        ),
      ),
    );
  }
}

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key, required this.front, required this.back});

  final Image front;
  final Image back;

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  bool isFront = true;
  double dragPosition = 0;

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition -= details.delta.dx;
          dragPosition %= 360;

          setImageSide();
        });
      },
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: isFront
            ? widget.front
            : Transform(
                transform: Matrix4.identity()..rotateX(pi),
                alignment: Alignment.center,
                child: widget.back,
              ),
      ),
    );
  }

  void setImageSide() {
    if (dragPosition <= 90 || dragPosition > 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
