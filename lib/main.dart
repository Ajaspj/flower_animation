import 'package:flower_animation/view/animation_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlowerAnimationApp());

class FlowerAnimationApp extends StatelessWidget {
  const FlowerAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowerAnimationScreen(),
    );
  }
}
