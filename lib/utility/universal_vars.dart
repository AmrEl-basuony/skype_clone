import 'package:flutter/material.dart';

class UniversalVariables {
  static const Color blueColor = Color(0xFF023DFF);
  static const Color blackColor = Color(0xff19191b);
  static const Color greyColor = Color(0xff8f8f8f);
  static const Color transparentGreyColor = Color(0x88FFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color userCircleBackground = Color(0xff2b2b33);
  static const Color onlineDotColor = Color(0xff46dc64);
  static const Color lightBlueColor = Color(0xff0077d7);
  static const Color separatorColor = Color(0xff272c35);

  static const Color gradientColorStart = Color(0xFF00CFF3);
  static const Color gradientColorEnd = Color(0xFF0160DC);

  static const Color senderColor = Color(0xff2b343b);
  static const Color receiverColor = Color(0xff1e2225);

  static const Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
