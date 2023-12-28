import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTextWidget extends StatelessWidget {
  const CustomAnimatedTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(text,),
        ],
        isRepeatingAnimation: true,
        onTap: () {},
      ),
    );
  }
}
