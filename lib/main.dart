import 'package:flutter/material.dart';
import 'package:flutter_animations/swiper.dart';

import 'animated_confetti.dart';
import 'animated_container.dart';
import 'animated_rive.dart';
import 'animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const  SwiperScreen ( ),
    );
  }
}

