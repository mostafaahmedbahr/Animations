import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedRiveWidget extends StatelessWidget {
  const AnimatedRiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: RiveAnimation.network(
        'https://cdn.rive.app/animations/vehicles.riv',
      ),
    );
  }
}
