import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PointsBadge extends StatelessWidget {
  const PointsBadge({super.key, required this.points, this.earned = false});

  final int points;
  final bool earned;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        gradient: earned ? AppColors.primaryGradient : null,
        color: earned ? null : AppColors.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: earned ? null : Border.all(color: AppColors.outline),
      ),
      child: Text(
        '${earned ? '+' : ''}$points pts',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: earned ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}
