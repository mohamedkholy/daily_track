import 'package:daily_track/features/stats/data/model/day_progress.dart';
import 'package:daily_track/features/stats/data/model/routine_progress.dart';
import 'package:daily_track/features/stats/data/model/task_progress.dart';
import 'package:daily_track/features/stats/data/repos/stats_repo.dart';
import 'package:daily_track/features/stats/logic/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsCubit extends Cubit<StatsState> {
  final StatsRepo _repo;

  StatsCubit(this._repo) : super(LoadingState());

  Future<void> getData() async {
    final data = await _repo.getRoutinesLastWeekProgress();
    if(data.isEmpty){
      emit(NoRoutinesState());
      return;
    }
    final Map<String, int> streaks = {};
    final list =
        data.entries.map((e) {
          for (int i = 0; i < 8; i++) {
            var date = DateTime.now().subtract(Duration(days: i));
            if (e.value.any(
                  (element) => DateUtils.isSameDay(element.date, date),
                ) ==
                false) {
              e.value.add(DayProgress(date, 0));
            }
          }
          e.value.sort((a, b) => a.date.compareTo(b.date));
          return RoutineProgress(routineTitle: e.key, daysProgresses: e.value);
        }).toList();

    for (var element in list) {
      streaks.putIfAbsent(element.routineTitle, () => 0);
      for (int i = 0; i < element.daysProgresses.length; i++) {
        if (element.daysProgresses[i].progress == 1) {
          streaks[element.routineTitle] = streaks[element.routineTitle]! + 1;
        } else if (i != element.daysProgresses.length - 1) {
          streaks[element.routineTitle] = 0;
        }
      }
    }


    final topTasksList = await Future.wait(
      list.map((r) async => MapEntry(r.routineTitle, await _repo.getRoutineTopTasks(r.routineTitle))),
    );
    final topTasks = Map.fromEntries(topTasksList);


    final lastWeekProgress =
        list.length > 7 ? list.sublist(list.length - 7) : list;

    emit(
      LoadedState(
        routineProgress: lastWeekProgress,
        streaks: streaks,
        topTasks: topTasks,
      ),
    );
  }

}
