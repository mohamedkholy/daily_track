import 'dart:ffi';

import 'package:daily_track/core/database/my_database.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_cubit.dart';
import 'package:daily_track/features/add_routine/repos/add_routine_repo.dart';
import 'package:daily_track/features/home/data/repos/home_repo.dart';
import 'package:daily_track/features/home/logic/home_cubit.dart';
import 'package:daily_track/features/routine/data/repos/routine_repo.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:daily_track/features/stats/data/repos/stats_repo.dart';
import 'package:daily_track/features/stats/logic/states_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<MyDatabase>(() => MyDatabase());
  getIt.registerFactory<AddRoutineRepo>(() => AddRoutineRepo(getIt()));
  getIt.registerFactory<AddRoutineCubit>(() => AddRoutineCubit(getIt()));
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<RoutineRepo>(() => RoutineRepo(getIt()));
  getIt.registerFactory<RoutineCubit>(() => RoutineCubit(getIt()));
  getIt.registerFactory<StatsRepo>(() => StatsRepo(getIt()));
  getIt.registerFactory<StatsCubit>(() => StatsCubit(getIt()));
}
