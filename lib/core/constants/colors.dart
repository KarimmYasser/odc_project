import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App theme colors
  static const Color primary = Color(0xFF2D3C52);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // Icon colors
  static const Color iconPrimary = Color(0xFF8D8D8D);

  // Text colors
  static const Color textPrimary = Color(0xFF292A2E);
  static const Color textSecondary = Color(0xFF7C7D82);
  static const Color hyperText = Color(0xFF1B5EC9);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF5F5F5);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withAlpha(25);
  static const LinearGradient top = LinearGradient(
    colors: [
      Color(0xFFFDA56C),
      Color(0xFFFD6C8A),
    ],
  );
  static const Color mid = Color(0xFFFEB5AE);
  static const Color bot = Color(0xFFFBCCDC);
  static const Color event = Color(0xFFFF9C44);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFF313131);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color softGrey = Color(0xFFBCBDC0);
  static const Color lightGrey = Color(0xFFEAEAEA);
  static const Color white = Color(0xFFFFFFFF);
}
