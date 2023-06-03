import 'package:flutter/material.dart';

class AppColors {
  static const Color titleActive = Color(0xFF000000);
  static const Color body = Color(0xFF333333);
  static const Color label = Color(0xFF555555);
  static const Color placeholder = Color(0xFF888888);
  static const Color line = Color(0xFF14142B);
  static const Color inputBackground = Color(0xFFF9F9F9);
  static const Color background = Color(0xFFF8F0E7);
  static const Color offWhite = Color(0xFFFCFCFC);
  static const Color primary = Color(0xFFA8715A);
  static const Color secondary = Color(0xFFDD8560);
  static const Color footer = Color(0xFFC4C4C4);
  static const Color border = Color(0xFFDEDEDE);

  static const Color productBlack = Color(0xff0F140D);
  static const Color productOrange = Color(0xffDD8560);
  static const Color productGrey = Color(0xffE1E0DB);

  static LinearGradient myGradient = LinearGradient(
    colors: [
      Colors.black,
      Colors.black.withOpacity(0.6),
      Colors.black.withOpacity(0.1),
      Colors.black.withOpacity(0.05),
      Colors.white.withOpacity(0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
