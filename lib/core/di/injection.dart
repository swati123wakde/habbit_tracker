import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../features/data/datasources/habit_remote_data_source.dart';
import '../../features/data/repositories/habit_repository_impl.dart';
import '../../features/domain/repositories/habit_repository.dart';
import '../../features/domain/usecases/add_habit.dart';
import '../../features/domain/usecases/delete_habit.dart';
import '../../features/domain/usecases/set_habit_completion.dart';
import '../../features/domain/usecases/watch_habit_detail.dart';
import '../../features/domain/usecases/watch_habits_for_day.dart';
import '../../features/presentation/bloc/add_habit/add_habit_cubit.dart';
import '../../features/presentation/bloc/detail/habit_detail_bloc.dart';
import '../../features/presentation/bloc/today/today_habits_bloc.dart';

final sl = GetIt.instance;

/// Composition root: the only place that knows about concrete classes.
void configureDependencies() {
  // External
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data
  sl
    ..registerLazySingleton<HabitRemoteDataSource>(
          () => HabitRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<HabitRepository>(() => HabitRepositoryImpl(sl()));

  // Domain
  sl
    ..registerLazySingleton(() => WatchHabitsForDay(sl()))
    ..registerLazySingleton(() => WatchHabitDetail(sl()))
    ..registerLazySingleton(() => AddHabit(sl()))
    ..registerLazySingleton(() => SetHabitCompletion(sl()))
    ..registerLazySingleton(() => DeleteHabit(sl()));

  // Presentation (new instance per screen)
  sl
    ..registerFactory(
          () => TodayHabitsBloc(
        watchHabitsForDay: sl(),
        setHabitCompletion: sl(),
      ),
    )
    ..registerFactory(() => AddHabitCubit(addHabit: sl()))
    ..registerFactory(
          () => HabitDetailBloc(
        watchHabitDetail: sl(),
        setHabitCompletion: sl(),
        deleteHabit: sl(),
      ),
    );
}
