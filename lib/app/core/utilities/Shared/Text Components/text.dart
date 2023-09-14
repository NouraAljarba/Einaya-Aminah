import 'package:flutter/material.dart';

class AppSizes {
  // HeadLine
  static double headLineSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.08;
  // subHeadLine
  static double subHeadSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;
  // BodyText
  static double bodyTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.06;
  // ButtonText
  static double buttonTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;
}
