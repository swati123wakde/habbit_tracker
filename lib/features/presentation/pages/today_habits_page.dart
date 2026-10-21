import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/state_views.dart';
import '../bloc/today/today_habits_bloc.dart';
import '../widgets/habit_tile.dart';
import '../widgets/progress_header.dart';

class TodayHabitsPage extends StatefulWidget {
  const TodayHabitsPage({super.key});

  @override
  State<TodayHabitsPage> createState() => _TodayHabitsPageState();
}

class _TodayHabitsPageState extends State<TodayHabitsPage> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(
      onResume: () => context
          .read<TodayHabitsBloc>()
          .add(const TodayHabitsEvent.dayCheckRequested()),
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: GradientFab(
          label: 'New habit',
          icon: Icons.add_rounded,
          onPressed: () => context.push(AppRoutes.addHabit),
        ),
        body: SafeArea(
          bottom: false,
          child: BlocConsumer<TodayHabitsBloc, TodayHabitsState>(
            listenWhen: (prev, curr) =>
            curr.actionError != null && prev.actionError != curr.actionError,
            listener: (context, state) => ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.actionError!))),
            builder: (context, state) => switch (state.status) {
              TodayHabitsStatus.initial ||
              TodayHabitsStatus.loading =>
              const LoadingView(),
              TodayHabitsStatus.failure when state.habits.isEmpty => ErrorView(
                message: state.errorMessage ?? 'Could not load habits.',
                onRetry: () => context
                    .read<TodayHabitsBloc>()
                    .add(const TodayHabitsEvent.started()),
              ),
              _ => _TodayContent(state: state),
            },
          ),
        ),
      ),
    );
  }
}

class _TodayContent extends StatelessWidget {
  const _TodayContent({required this.state});

  final TodayHabitsState state;

  @override
  Widget build(BuildContext context) {
    final day = state.day ?? DateTime.now();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, d MMMM').format(day).toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 12,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Today's Habits",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
                ProgressHeader(
                  completed: state.completedCount,
                  total: state.habits.length,
                  earnedPoints: state.earnedPoints,
                  totalPoints: state.totalPoints,
                  progress: state.progress,
                ),
                const SizedBox(height: 28),
                if (state.habits.isNotEmpty)
                  Text(
                    'YOUR HABITS · ${state.habits.length}',
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        if (state.habits.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: MessageView(
              icon: Icons.auto_awesome_rounded,
              title: 'No habits yet',
              message:
              'Create your first habit and start earning points every day.',
              actionLabel: 'Add a habit',
              onAction: () => context.push(AppRoutes.addHabit),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 110),
            sliver: SliverList.separated(
              itemCount: state.habits.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = state.habits[index];
                return HabitTile(
                  key: ValueKey(item.habit.id),
                  item: item,
                  onToggle: () => context
                      .read<TodayHabitsBloc>()
                      .add(TodayHabitsEvent.toggled(item)),
                  onTap: () =>
                      context.push(AppRoutes.habitDetail(item.habit.id)),
                );
              },
            ),
          ),
      ],
    );
  }
}
