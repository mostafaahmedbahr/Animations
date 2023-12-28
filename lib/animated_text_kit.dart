import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/shared_widgets/custom_animated_text_widget.dart';

class AnimatedTextKitWidget extends StatefulWidget {
  const AnimatedTextKitWidget({super.key,});
  @override
  State<AnimatedTextKitWidget> createState() => _AnimatedTextKitWidgetState();
}

class _AnimatedTextKitWidgetState extends State<AnimatedTextKitWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.red,
          child: Center(
            child:  CustomAnimatedTextWidget(
              text: "mostafa",
            ),
          ),
        ),
      ),
    );
  }
}
