import 'package:daily_track/features/routine/data/models/task.dart';

abstract class RoutineState{
  List<Task> tasks;
  RoutineState(this.tasks);
}

class LoadingTasks extends RoutineState{
  LoadingTasks():super([]);
}

class UpdateSubtaskTitleFailed extends RoutineState{
  UpdateSubtaskTitleFailed(super.tasks);
}

class UpdateTaskTitleFailed extends RoutineState{
  UpdateTaskTitleFailed(super.tasks);
}

class TasksLoaded extends RoutineState{
  TasksLoaded(super.tasks);
}

class DateChanged extends RoutineState{
  DateTime dateTime;
  DateChanged(this.dateTime,super.tasks);
}

class TaskIsDoneState extends RoutineState{
  TaskIsDoneState(super.tasks);

}