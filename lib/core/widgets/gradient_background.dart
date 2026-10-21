import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Paints the app's vertical purple-to-black gradient behind a page.
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: child,
    );
  }
}
