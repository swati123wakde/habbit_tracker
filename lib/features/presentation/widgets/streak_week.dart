import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/day_utils.dart';
import '../../domain/entities/day_status.dart';

/// Seven day dots, oldest → today. Done days are filled with the gradient,
/// consecutive done days are joined by a connector to visualise the streak.
class StreakWeek extends StatelessWidget {
  const StreakWeek({super.key, required this.days, required this.today});

  final List<DayStatus> days;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < days.length; i++) ...[
          Expanded(
            child: _DayDot(
              day: days[i],
              isToday: DayUtils.isSameDay(days[i].date, today),
            ),
          ),
          if (i < days.length - 1)
            _Connector(active: days[i].isDone && days[i + 1].isDone),
        ],
      ],
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Align with the dot's vertical centre (label 14 + gap 8 + 16 - 1.5).
      padding: const EdgeInsets.only(top: 36.5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 4,
        height: 3,
        decoration: BoxDecoration(
          color: active ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _DayDot extends StatelessWidget {
  const _DayDot({required this.day, required this.isToday});

  final DayStatus day;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final done = day.isDone;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 14,
          child: Text(
            isToday ? 'Today' : DateFormat.E().format(day.date),
            style: TextStyle(
              fontSize: 11,
              fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
              color: isToday ? AppColors.accent : AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: done ? AppColors.primaryGradient : null,
            color: done ? null : AppColors.surfaceRaised,
            border: Border.all(
              color: isToday
                  ? AppColors.accent
                  : done
                  ? Colors.transparent
                  : AppColors.outline,
              width: isToday ? 2 : 1,
            ),
            boxShadow: done
                ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 12,
              ),
            ]
                : null,
          ),
          child: Center(
            child: done
                ? const Icon(Icons.check_rounded, size: 17, color: Colors.white)
                : Text(
              '${day.date.day}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
