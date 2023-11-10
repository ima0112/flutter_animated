import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

import 'package:flutter_animation/src/utils/assets.dart';

class RiveAnimationPage extends StatefulWidget {
  const RiveAnimationPage({super.key});

  @override
  State<RiveAnimationPage> createState() => _RiveAnimationPageState();
}

class _RiveAnimationPageState extends State<RiveAnimationPage> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;

  @override
  void initState() {
    rootBundle.load(AppAsset.rive).then(
      (value) async {
        try {
          final file = RiveFile.import(value);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'birb');

          if (controller != null) {
            artboard.addController(controller);
            isDance = controller.findSMI('dance');
            isLookUp = controller.findSMI('look up');
          }
          setState(() => riveArtboard = artboard);
        } catch (e) {
          print(e);
        }
      },
    );
    super.initState();
  }

  void toggleDance(bool newValue) {
    setState(() => isDance!.value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rive Animation'),
        centerTitle: true,
      ),
      body: riveArtboard == null
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                children: [
                  Expanded(child: Rive(artboard: riveArtboard!)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Dance'),
                      Switch(
                        value: isDance!.value,
                        onChanged: (value) => toggleDance(value),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  ElevatedButton(
                    onPressed: () => isLookUp?.value = true,
                    child: const Text('Look up'),
                  ),
                ],
              ),
            ),
    );
  }
}
