import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AnimatedconfettiScreen extends StatefulWidget {
  const AnimatedconfettiScreen({super.key});

  @override
  State<AnimatedconfettiScreen> createState() => _AnimatedconfettiScreenState();
}

class _AnimatedconfettiScreenState extends State<AnimatedconfettiScreen> {
  late ConfettiController  controllerCenter;
  late ConfettiController  controllerCenterRight;
  late ConfettiController  controllerCenterLeft;
  late ConfettiController  controllerTopCenter;
  late ConfettiController  controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    controllerCenter = ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterRight = ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterLeft = ConfettiController(duration: const Duration(seconds: 10));
    controllerTopCenter = ConfettiController(duration: const Duration(seconds: 10));
    controllerBottomCenter = ConfettiController(duration: const Duration(seconds: 10));
  }


  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    controllerCenterRight.dispose();
    controllerCenterLeft.dispose();
    controllerTopCenter.dispose();
    controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          //CENTER -- Blast
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
              true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  controllerCenter.play();
                },
                child: display('blast\nstars')),
          ),

          //CENTER RIGHT -- Emit left
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: controllerCenterRight,
              blastDirection: pi, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
              strokeWidth: 1,
              strokeColor: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  controllerCenterRight.play();
                },
                child: display('pump left')),
          ),

          //CENTER LEFT - Emit right
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: controllerCenterLeft,
              blastDirection: 0, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  controllerCenterLeft.play();
                },
                child: display('singles')),
          ),

          //TOP CENTER - shoot down
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controllerTopCenter,
              blastDirection: pi / 2,
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 50, // a lot of particles at once
              gravity: 1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TextButton(
                onPressed: () {
                  controllerTopCenter.play();
                },
                child: display('goliath')),
          ),
          //BOTTOM CENTER
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: controllerBottomCenter,
              blastDirection: -pi / 2,
              emissionFrequency: 0.01,
              numberOfParticles: 20,
              maxBlastForce: 100,
              minBlastForce: 80,
              gravity: 0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
                onPressed: () {
                  controllerBottomCenter.play();
                },
                child: display('hard and infrequent')),
          ),
        ],
      ),
    );
  }

  Text display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
