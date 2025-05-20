import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/home/data/repos/home_repo.dart';
import 'package:daily_track/features/home/logic/home_state.dart';
import 'package:daily_track/features/routine/data/models/item.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routine/data/models/sub_task.dart';
import '../../routine/data/models/task.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

  HomeCubit(this._repo) : super(Loading());

  getRoutines() async {
    emit(Loading());
    (await _repo.getAllRoutines()).listen((routines) {
      if(routines.isNotEmpty) {
        emit(Loaded(routines));
      }
      else{
        emit(NoRoutines(routines));
      }
    });
  }

  Future<double> getTodayDayProgress(String title) async {
    return await _repo.getTodayProgress(title);
  }

  Future<double> getOverallProgress(Routine routine) async {
    int days = daysUntilToday(routine.startDate);
    double daysProgress = await _repo.getDaysProgresses(routine.title);
    return daysProgress / days;
  }

  deleteRoutine(String title) {
    _repo.deleteRoutine(title);
  }

  void updateRoutineTitle(String title, String newTitle) async{
    try {
      await _repo.updateRoutineTitle(title, newTitle);
    } catch (e) {
      emit(UpdateRoutineTitleFailed(state.routines));
    }
  }
}
