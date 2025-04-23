import 'package:daily_track/core/database/my_database.dart';
import 'package:daily_track/features/stats/data/model/routine_progress.dart';
import 'package:daily_track/features/stats/data/model/task_progress.dart';

sealed class StatsState {}

class LoadingState extends StatsState {}

class LoadedState extends StatsState {
  final List<RoutineProgress> routineProgress;
  final Map<String, List<TaskProgress>> topTasks;
  final Map<String, int> streaks;

  LoadedState({
    required this.routineProgress,
    required this.streaks,
    required this.topTasks,
  });
}
