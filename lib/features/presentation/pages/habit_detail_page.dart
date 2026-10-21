import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/habit_detail.dart';
import '../bloc/detail/habit_detail_bloc.dart';
import '../widgets/streak_week.dart';

class HabitDetailPage extends StatelessWidget {
  const HabitDetailPage({super.key});

  Future<void> _confirmDelete(BuildContext context) async {
    final bloc = context.read<HabitDetailBloc>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceRaised,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Delete habit?'),
        content: const Text(
          'This removes the habit and all of its history.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      bloc.add(const HabitDetailEvent.deleteRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HabitDetailBloc, HabitDetailState>(
      listenWhen: (prev, curr) =>
      (curr.status == HabitDetailStatus.deleted &&
          prev.status != HabitDetailStatus.deleted) ||
          (curr.actionError != null && prev.actionError != curr.actionError),
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        if (state.status == HabitDetailStatus.deleted) {
          messenger.showSnackBar(
            const SnackBar(content: Text('Habit deleted')),
          );
          context.pop();
        } else if (state.actionError != null) {
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.actionError!)));
        }
      },
      builder: (context, state) {
        final detail = state.detail;
        return GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              actions: [
                if (detail != null)
                  IconButton(
                    tooltip: 'Delete habit',
                    onPressed:
                    state.isDeleting ? null : () => _confirmDelete(context),
                    icon: state.isDeleting
                        ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Icon(Icons.delete_outline_rounded),
                  ),
                const SizedBox(width: 8),
              ],
            ),
            body: SafeArea(
              child: switch (state.status) {
                HabitDetailStatus.failure => ErrorView(
                  message: state.errorMessage ?? 'Could not load habit.',
                  onRetry: state.habitId == null
                      ? null
                      : () => context
                      .read<HabitDetailBloc>()
                      .add(HabitDetailEvent.started(state.habitId!)),
                ),
                _ when detail == null => const LoadingView(),
                _ => _DetailContent(
                  detail: detail!,
                  today: state.today ?? DateTime.now(),
                  isUpdating: state.isUpdating,
                ),
              },
            ),
          ),
        );
      },
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.detail,
    required this.today,
    required this.isUpdating,
  });

  final HabitDetail detail;
  final DateTime today;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final habit = detail.habit;
    final done = detail.isDoneToday;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        // Hero card
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: AppColors.heroGradient,
            borderRadius: BorderRadius.circular(28),
            border:
            Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.stars_rounded,
                        size: 16, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      '${habit.points} points',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(
                habit.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                habit.description.isEmpty
                    ? 'No description'
                    : habit.description,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.45,
                  color: habit.description.isEmpty
                      ? AppColors.textMuted
                      : AppColors.textSecondary,
                  fontStyle: habit.description.isEmpty
                      ? FontStyle.italic
                      : FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Stats
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.local_fire_department_rounded,
                value: '${detail.currentStreak}',
                label: 'day streak',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.calendar_today_rounded,
                value: '${detail.completedDays}/${detail.history.length}',
                label: 'last 7 days',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.stars_rounded,
                value: '${detail.pointsEarned}',
                label: 'pts earned',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // 7-day streak
        Container(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last 7 days',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                _streakMessage(detail),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 18),
              StreakWeek(days: detail.history, today: today),
            ],
          ),
        ),
        const SizedBox(height: 28),

        GradientButton(
          label: done ? 'Mark today as not done' : 'Mark today as done',
          icon: done ? Icons.undo_rounded : Icons.check_rounded,
          outlined: done,
          isLoading: isUpdating,
          onPressed: () => context
              .read<HabitDetailBloc>()
              .add(const HabitDetailEvent.todayToggled()),
        ),
        if (done) ...[
          const SizedBox(height: 12),
          Center(
            child: Text(
              'Nice! +${habit.points} points earned today',
              style: const TextStyle(color: AppColors.accent, fontSize: 13),
            ),
          ),
        ],
      ],
    );
  }

  String _streakMessage(HabitDetail d) {
    if (d.completedDays == d.history.length) return 'Perfect week — keep it up!';
    if (d.currentStreak >= 3) return "You're on fire. Don't break the chain!";
    if (d.completedDays == 0) return 'Start today and build your streak.';
    return 'Completed ${d.completedDays} of the last ${d.history.length} days.';
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.accent, size: 22),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
