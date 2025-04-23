import 'package:daily_track/features/stats/data/model/day_progress.dart';

class RoutineProgress {
  final String routineTitle;
  final List<DayProgress> daysProgresses;

  RoutineProgress({required this.routineTitle,required this.daysProgresses});
}
