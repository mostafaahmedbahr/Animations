import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double height = 100.0;
  double width = 100.0;
  Color color = Colors.deepOrange;
  BorderRadius borderRadius = BorderRadius.circular(8);

  changeSize() {
    setState(() {
      height = Random().nextInt(400).toDouble();
      width = Random().nextInt(400).toDouble();
    });
  }

  changeColor() {
    setState(() {
      color = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  changeRadius() {
    setState(() {
      borderRadius = BorderRadius.circular(Random().nextInt(80).toDouble());
    });
  }

  Timer? timer;
  bool isPrinting = false;

  void startPrinting() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      changeSize();
      changeColor();
      changeRadius();
    });
    setState(() {
      isPrinting = true;
    });
  }

  void stopPrinting() {
    timer?.cancel();
    setState(() {
      isPrinting = false;
    });
  }

  @override
  void initState() {
    super.initState();
     startPrinting();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              changeSize();
            },
            icon: const Icon(Icons.palette),
          ),
          IconButton(
            onPressed: () {
              changeColor();
            },
            icon: const Icon(Icons.interests),
          ),
          IconButton(
            onPressed: () {
              changeRadius();
            },
            icon: const Icon(Icons.aspect_ratio),
          ),
        ],
      ),
    );
  }
}
