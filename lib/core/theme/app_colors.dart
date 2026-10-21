import 'package:flutter/material.dart';

/// Dark, matte-purple palette. Low-saturation purples keep the "matte" feel;
/// gradients add depth on hero surfaces and primary actions.
abstract final class AppColors {
  // Surfaces
  static const background = Color(0xFF0E0A14);
  static const surface = Color(0xFF17121F);
  static const surfaceRaised = Color(0xFF211A2D);
  static const outline = Color(0xFF2E2540);

  // Matte purples
  static const primary = Color(0xFF8B6CC9);
  static const primaryMuted = Color(0xFF6B4FA3);
  static const primaryDeep = Color(0xFF3E2A63);
  static const accent = Color(0xFFB9A0EC);

  // Text
  static const textPrimary = Color(0xFFEDE8F5);
  static const textSecondary = Color(0xFFA79DB8);
  static const textMuted = Color(0xFF6E6580);

  static const error = Color(0xFFE57A9A);

  // Gradients
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF9273D0), Color(0xFF5A3D92)],
  );

  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4E3479), Color(0xFF2C1E45), Color(0xFF1B1329)],
    stops: [0.0, 0.55, 1.0],
  );

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1C1329), Color(0xFF0E0A14)],
    stops: [0.0, 0.45],
  );

  static final LinearGradient doneTileGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primaryDeep.withValues(alpha: 0.75), surface],
  );

  static const idleTileGradient = LinearGradient(
    colors: [surface, surface],
  );

  static const ringGradient = SweepGradient(
    colors: [Color(0xFF6B4FA3), Color(0xFFB9A0EC), Color(0xFF8B6CC9), Color(0xFF6B4FA3)],
  );
}
