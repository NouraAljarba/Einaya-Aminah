import 'package:flutter/material.dart';

class PulsatingCameraIcon extends StatefulWidget {
  const PulsatingCameraIcon({super.key});

  @override
  createState() => _PulsatingCameraIconState();
}

class _PulsatingCameraIconState extends State<PulsatingCameraIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(
        Icons.camera_alt,
        size: 80,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
