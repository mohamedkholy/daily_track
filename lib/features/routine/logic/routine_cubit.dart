import 'dart:async';

import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:daily_track/features/routine/data/models/sub_task.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:daily_track/features/routine/data/repos/routine_repo.dart';
import 'package:daily_track/features/routine/logic/routine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineCubit extends Cubit<RoutineState> {
  final RoutineRepo repo;
  StreamSubscription<List<Task>>? _tasksStreamSubscription;
  late List<Task> routineData;
  DateTime date = DateUtils.dateOnly(DateTime.now());

  late Routine routine;

  RoutineCubit(this.repo) : super(LoadingTasks());

  getTasks() async {
    routineData = await repo.getRoutineData(routine.title);
    updateTasks(date);
  }

  updateTasks(DateTime date) {
    this.date = date;
    _tasksStreamSubscription?.cancel();
    _tasksStreamSubscription = repo.getTasks(routine.title, date).listen((
      tasks,
    ) async {
      for (int i = 0; i < routineData.length; i++) {
        var index = tasks.indexWhere(
          (element) => element.title == routineData[i].title,
        );
        if (index != -1) {
          routineData[i].subTasks.asMap().forEach((j, element) {
            if (!tasks[index].subTasks.contains(element)) {
              tasks[index].subTasks.insert(j, element);
            }
          });
        } else if (isDateStartBefore(routineData[i].startDate, date)) {
          tasks.add(routineData[i]);
        }
      }
      emit(TasksLoaded(tasks));
    });
  }

  bool isDateStartBefore(DateTime startDate, currentDate) {
    return startDate.isBefore(currentDate) ||
        startDate.isAtSameMomentAs(currentDate);
  }

  saveTaskState(Task task, bool? state) {
    repo.upsertTask(task.copyWith(date: date), routine.title, state);
  }

  saveSubtaskState(Subtask subtask, String taskTitle, bool? state) {
    repo.upsertSubtask(
      subtask.copyWith(date: date),
      taskTitle,
      routine.title,
      state,
    );
  }

  addTask(Task task, String routineTitle) async {
    await repo.addTask(task, routineTitle);
  }

  @override
  Future<void> close() {
    _tasksStreamSubscription?.cancel();
    return super.close();
  }

  saveDayProgress(double dayProgress) {
    repo.saveDayProgress(dayProgress, date, routine.title);
  }

  deleteTask(Task task, String routineTitle) async {
    await updateAllProgresses(task, routineTitle);
    await repo.deleteTask(task.title, routineTitle);
    getTasks();
  }

  deleteSubtask(
    String subtaskTitle,
    String taskTitle,
    String routineTitle,
  ) async {
    await repo.deleteSubtask(subtaskTitle, taskTitle, routineTitle);
    getTasks();
  }

  updateAllProgresses(Task task, String routineTitle) async {
    var taskPercentage =
        1 /
        routineData
            .where(
              (element) => isDateStartBefore(element.startDate, task.startDate),
            )
            .length;
    int days = daysUntilToday(task.startDate);
    for (int i = 0; i <= days; i++) {
      var day =
        task.startDate.add(Duration(days: i));
      double percentage =
          await repo.getTaskState(task.title, routineTitle, day)
              ? taskPercentage
              : 0;
      await repo.changeDayProgress(
        day,
        percentage,
        routineTitle,
        routineData.length.toDouble(),
      );
    }
  }

  updateSubtaskTitle(
    String title,
    String taskTitle,
    String routineTitle,
    String newTitle,
  ) async {
    try {
      await repo.updateSubtaskTitle(title, taskTitle, routineTitle, newTitle);
      getTasks();
    } catch (e) {
      emit(UpdateSubtaskTitleFailed(state.tasks));
    }
  }

  void updateTask(Task oldTask, Task newTask, String routineTitle) async {
    if (oldTask.isDone == null) {
      await repo.upsertTask(oldTask.copyWith(date: date), routineTitle);
    }
    var removedTasks = oldTask.subTasks.toSet().difference(
      newTask.subTasks.toSet(),
    );
    var addedTasks = newTask.subTasks.toSet().difference(
      oldTask.subTasks.toSet(),
    );

    for (var element in removedTasks) {
      await repo.deleteSubtask(element.title, oldTask.title, routineTitle);
    }
    for (var element in addedTasks) {
      await repo.upsertSubtask(
        element.copyWith(date: date),
        oldTask.title,
        routineTitle,
      );
    }
    try {
      if (oldTask.title != newTask.title) {
        await repo.updateTaskTitle(oldTask.title, newTask.title, routineTitle);
      }
    } catch (e) {
      emit(UpdateTaskTitleFailed(state.tasks));
    }
    getTasks();
  }
}
