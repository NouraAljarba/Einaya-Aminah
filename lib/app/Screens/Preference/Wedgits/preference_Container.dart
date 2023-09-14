// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PrefContainer extends StatelessWidget {
  const PrefContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width - 40,
          child: child),
    );
  }
}
