import 'package:flutter/material.dart';

extension Navigation on Widget {
  
  push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
      ),
    );
  }

  pop(BuildContext context) => Navigator.pop(context);

  pushAndRemove(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => this,
        ),
        (route) => false);
  }
}
