import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/daily_habit.dart';
import 'habit_check.dart';
import 'points_badge.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onTap,
  });

  final DailyHabit item;
  final VoidCallback onToggle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final habit = item.habit;
    final done = item.isDone;
    final radius = BorderRadius.circular(22);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: done ? AppColors.doneTileGradient : AppColors.idleTileGradient,
        border: Border.all(
          color: done
              ? AppColors.primary.withValues(alpha: 0.45)
              : AppColors.outline,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
            child: Row(
              children: [
                HabitCheck(isDone: done, onTap: onToggle),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 220),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: done
                              ? AppColors.textSecondary
                              : AppColors.textPrimary,
                          decoration: done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: AppColors.textMuted,
                        ),
                        child: Text(
                          habit.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (habit.description.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          habit.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                PointsBadge(points: habit.points, earned: done),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
