// ignore_for_file: unused_element

import 'package:flutter/material.dart';


extension  on BuildContext {
  double get getHeight => MediaQuery.of(this).size.height;
  double get getWidth => MediaQuery.of(this).size.width;
}