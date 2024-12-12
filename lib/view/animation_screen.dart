import 'package:flower_animation/view/painter.dart';
import 'package:flutter/material.dart';

class FlowerAnimationScreen extends StatefulWidget {
  const FlowerAnimationScreen({super.key});

  @override
  FlowerAnimationScreenState createState() => FlowerAnimationScreenState();
}

class FlowerAnimationScreenState extends State<FlowerAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Total animation time
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: false); // Loop the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: FlowerPainter(_animation.value),
              size: const Size(300, 300),
            );
          },
        ),
      ),
    );
  }
}
