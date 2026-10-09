
import 'package:flutter/material.dart';

class FloatingProfile extends StatefulWidget {
  const FloatingProfile({super.key});

  @override
  State<FloatingProfile> createState() => _FloatingProfileState();
}

class _FloatingProfileState extends State<FloatingProfile>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(
      begin: -12,
      end: 12,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget bubble({
    required double size,
    required Color color,
    required Alignment alignment,
  }) {
    return Align(
      alignment: alignment,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final phase = _controller.value * 2 * 3.14159;

          return Transform.translate(
            offset: Offset(
              8 * (alignment.x == 0 ? 1 : alignment.x) *
                  (1 - 2 * _controller.value),
              12 * (alignment.y == 0 ? 1 : alignment.y) *
                  (1 - 2 * _controller.value),
            ),
            child: child,
          );
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.75),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 340,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          bubble(
            size: 9,
            color: Colors.blue,
            alignment: const Alignment(-0.9, -0.75),
          ),
          bubble(
            size: 8,
            color: Colors.red,
            alignment: const Alignment(0.9, -0.55),
          ),
          bubble(
            size: 10,
            color: Colors.purple,
            alignment: const Alignment(0.95, 0.65),
          ),
          bubble(
            size: 8,
            color: Colors.green,
            alignment: const Alignment(-0.8, 0.8),
          ),

          AnimatedBuilder(
            animation: _floatAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatAnimation.value),
                child: child,
              );
            },
            child: Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withValues(alpha: 0.25),
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_pic.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}