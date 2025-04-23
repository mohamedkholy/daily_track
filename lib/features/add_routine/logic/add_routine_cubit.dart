import 'package:daily_track/features/add_routine/logic/add_routine_state.dart';
import 'package:daily_track/features/add_routine/repos/add_routine_repo.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routine/data/models/task.dart';

class AddRoutineCubit extends Cubit<AddRoutineState> {
  AddRoutineRepo repo;
  AddRoutineCubit(this.repo) : super(InitialState());


  void addTask(Task task) {
    emit(AddTaskState(task));
  }

  void removeTask(Task task) {
    emit(RemoveTaskState(task));
  }

  void addRoutine(Routine routine) async {
    emit(AddingRoutineState());
    var result = await repo.addRoutine(routine);
    result?  emit(SuccessAddedRoutineState()) :   emit(AddingRoutineFailedState());

  }

}
