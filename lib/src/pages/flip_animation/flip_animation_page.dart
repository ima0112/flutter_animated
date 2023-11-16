import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/src/utils/assets.dart';

class FlipAnimationPage extends StatelessWidget {
  const FlipAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flipping Card')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
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

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  bool isFront = true;
  bool isFrontStart = true;
  double dragPosition = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controller.addListener(() {
      setState(() {
        dragPosition = animation.value;
        setImageSide();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);

    return GestureDetector(
      onHorizontalDragStart: (details) {
        controller.stop();
        isFrontStart = isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition -= details.delta.dx;
          dragPosition %= 360;

          setImageSide();
        });
      },
      onHorizontalDragEnd: (details) {
        final velocity = details.velocity.pixelsPerSecond.dx.abs();

        if (velocity >= 100) {
          isFront = !isFrontStart;
        }

        final double end = isFront ? (dragPosition > 180 ? 360 : 0) : 180;

        animation = Tween(
          begin: dragPosition,
          end: end,
        ).animate(controller);

        controller.forward(from: 0);
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
