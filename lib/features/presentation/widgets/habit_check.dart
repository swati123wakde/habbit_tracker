import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Tappable done / not-done toggle (✅ / ⬜) with a gradient fill when done.
class HabitCheck extends StatelessWidget {
  const HabitCheck({
    super.key,
    required this.isDone,
    required this.onTap,
    this.size = 34,
  });

  final bool isDone;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      checked: isDone,
      label: isDone ? 'Mark as not done' : 'Mark as done',
      child: InkResponse(
        onTap: onTap,
        radius: size * 0.9,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.32),
            gradient: isDone ? AppColors.primaryGradient : null,
            color: isDone ? null : AppColors.surfaceRaised,
            border: Border.all(
              color: isDone ? Colors.transparent : AppColors.primaryMuted,
              width: 1.6,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: isDone
                ? Icon(
              Icons.check_rounded,
              key: const ValueKey('done'),
              size: size * 0.6,
              color: Colors.white,
            )
                : const SizedBox.shrink(key: ValueKey('todo')),
          ),
        ),
      ),
    );
  }
}
