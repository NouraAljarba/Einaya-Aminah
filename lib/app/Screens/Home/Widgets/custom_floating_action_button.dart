import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final Function() onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 80.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: -1.0,
                  ),
                ]
              : [], // Apply shadow when pressed
        ),
        child: const Material(
          color: Colors.transparent,
          child: Center(
            child: Icon(
              Icons.question_answer,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
