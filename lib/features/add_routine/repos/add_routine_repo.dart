import 'package:daily_track/core/database/my_database.dart' as my_db;
import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/routine/data/models/sub_task.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../routine/data/models/routine.dart';

class AddRoutineRepo {
  final my_db.MyDatabase db;

  AddRoutineRepo(this.db);

  Future<bool> addRoutine(Routine routine) async {
    try {
      await db
          .into(db.routines)
          .insert(
            my_db.RoutinesCompanion(
              title: Value(routine.title),
              startDate: Value(routine.startDate),
            ),
          );
      await Future.wait(
        routine.tasks!.map((task) async => await addTask(task, routine.title)),
      );
      await addProgress(0, routine.startDate, routine.title);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addProgress(
    double dayProgress,
    DateTime date,
    String routineTitle,
  ) async {
    await db
        .into(db.routineProgress)
        .insert(
          my_db.RoutineProgressCompanion(
            date: Value(date),
            progress: Value(dayProgress),
            routineTitle: Value(routineTitle),
          ),
        );
  }

  Future<void> addTask(Task task, String routineTitle) async {
    await db
        .into(db.tasks)
        .insert(
          my_db.TasksCompanion(
            title: Value(task.title),
            date: Value(task.date),
            startDate: Value(task.startDate),
            routine: Value(routineTitle),
          ),
        );
    await Future.wait(
      task.subTasks.map(
        (subTask) async => await addSubtask(subTask, task.title, routineTitle),
      ),
    );
  }

  Future<void> addSubtask(
    Subtask subtask,
    String taskTitle,
    String routineTitle,
  ) async {
    await db
        .into(db.subtasks)
        .insert(
          my_db.SubtasksCompanion(
            title: Value(subtask.title),
            task: Value(taskTitle),
            routine: Value(routineTitle),
            date: Value(subtask.date),
          ),
        );
  }
}
