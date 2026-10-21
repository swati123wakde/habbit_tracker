import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/presentation/bloc/add_habit/add_habit_cubit.dart';
import '../../features/presentation/bloc/detail/habit_detail_bloc.dart';
import '../../features/presentation/bloc/today/today_habits_bloc.dart';
import '../../features/presentation/pages/add_habit_page.dart';
import '../../features/presentation/pages/habit_detail_page.dart';
import '../../features/presentation/pages/today_habits_page.dart';
import '../di/injection.dart';

abstract final class AppRoutes {
  static const today = '/';
  static const addHabit = '/add';
  static String habitDetail(String id) => '/habit/$id';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.today,
  routes: [
    GoRoute(
      path: AppRoutes.today,
      name: 'today',
      builder: (context, state) => BlocProvider(
        create: (_) =>
        sl<TodayHabitsBloc>()..add(const TodayHabitsEvent.started()),
        child: const TodayHabitsPage(),
      ),
      routes: [
        GoRoute(
          path: 'add',
          name: 'addHabit',
          builder: (context, state) => BlocProvider(
            create: (_) => sl<AddHabitCubit>(),
            child: const AddHabitPage(),
          ),
        ),
        GoRoute(
          path: 'habit/:id',
          name: 'habitDetail',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return BlocProvider(
              create: (_) =>
              sl<HabitDetailBloc>()..add(HabitDetailEvent.started(id)),
              child: const HabitDetailPage(),
            );
          },
        ),
      ],
    ),
  ],
);
