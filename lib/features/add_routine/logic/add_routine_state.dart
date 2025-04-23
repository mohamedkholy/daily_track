import 'package:daily_track/features/routine/data/models/routine.dart';

import '../../routine/data/models/task.dart';

abstract class AddRoutineState{
}

class InitialState extends AddRoutineState{
   final List<Task> items = [];
}

class AddTaskState extends AddRoutineState{
   final Task task;
   AddTaskState(this.task);
}

class AddingRoutineState extends AddRoutineState{
   AddingRoutineState();
}

class SuccessAddedRoutineState extends AddRoutineState{
   SuccessAddedRoutineState();
}

class AddingRoutineFailedState extends AddRoutineState{
   AddingRoutineFailedState();
}

class RemoveTaskState extends AddRoutineState{
   final Task task;
   RemoveTaskState(this.task);
}