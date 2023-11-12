import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimationPage extends StatefulWidget {
  const ConfettiAnimationPage({super.key});

  @override
  State<ConfettiAnimationPage> createState() => _ConfettiAnimationPageState();
}

class _ConfettiAnimationPageState extends State<ConfettiAnimationPage> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Confetti App'),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text(isPlaying ? 'Stop 🎉' : 'Celebrate 🎉'),
              onPressed: () {
                if (isPlaying) {
                  controller.stop();
                } else {
                  controller.play();
                }
              },
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,

          ///Set direction
          blastDirectionality: BlastDirectionality.explosive, //all
          // blastDirection: -pi / 2, //up
          // blastDirection: 0, //right
          // blastDirection: pi, / 2 //down
          // blastDirection: pi, //left

          ///Set emission count
          emissionFrequency: 0.0, //0.0 -> 1.0
          numberOfParticles: 20,

          ///Set intensity
          minBlastForce: 1,
          maxBlastForce: 10,

          ///Set speed
          gravity: 1.0, //0.0 -> 1.0,

          ///Set shape
          createParticlePath: (size) {
            final path = Path();

            path.addOval(Rect.fromCircle(center: Offset.zero, radius: 10));
            return path;
          },

          ///Set colors
          colors: const [
            Colors.red,
            Colors.green,
            Colors.yellow,
            Colors.blue,
            Colors.purpleAccent,
          ],
        )
      ],
    );
  }
}
