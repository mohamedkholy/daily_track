import 'package:daily_track/core/database/my_database.dart';
import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/routine/data/models/task.dart'
    as task_model;
import 'package:daily_track/features/routine/data/models/sub_task.dart'
    as subtask_model;
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class RoutineRepo {
  MyDatabase _db;

  RoutineRepo(this._db);

  Future<List<task_model.Task>> getRoutineData(String routineTitle) async {
    var table = _db.tasks;
    final tasks =
        await (_db.selectOnly(table, distinct: true)
              ..addColumns([table.title, table.startDate])
              ..where(table.routine.equals(routineTitle)))
            .get();

    return await Future.wait(
      tasks.map((row) async {
        return task_model.Task(
          title: row.read(table.title)!,
          startDate: row.read(table.startDate)!,
          date: DateUtils.dateOnly(DateTime.now()),
          isDone: null,
          subTasks: await _getSubtasks(row.read(table.title)!, routineTitle),
        );
      }),
    );
  }

  Future<List<subtask_model.Subtask>> _getSubtasks(
    String taskTitle,
    String routineTitle,
  ) async {
    List<String> subtasksTitles =
        await (_db.selectOnly(_db.subtasks, distinct: true)
              ..addColumns([_db.subtasks.title])
              ..where(
                _db.subtasks.task.equals(taskTitle) &
                    _db.subtasks.routine.equals(routineTitle),
              ))
            .map((row) => row.read(_db.subtasks.title)!)
            .get();

    return subtasksTitles.map((title) {
      return subtask_model.Subtask(
        title: title,
        isDone: null,
        date: DateUtils.dateOnly(DateTime.now()),
      );
    }).toList();
  }

  Stream<List<task_model.Task>> getTasks(String routineTitle, DateTime date) {
    final taskStream =
        (_db.select(_db.tasks)..where(
          (e) => e.routine.equals(routineTitle) & e.date.equals(date),
        )).watch();

    return taskStream.asyncMap((tasks) async {
      List<task_model.Task> tasksList = [];
      for (var task in tasks) {
        tasksList.add(
          task_model.Task(
            title: task.title,
            date: task.date,
            startDate: task.startDate,
            isDone: task.isDone,
            subTasks: await _getSubtasksData(task.title, date, routineTitle),
          ),
        );
      }

      return tasksList;
    });
  }

  Future<List<subtask_model.Subtask>> _getSubtasksData(
    String taskTitle,
    DateTime date,
    String routineTitle,
  ) async {
    List<Subtask> subtasks =
        await (_db.select(_db.subtasks)..where(
          (e) =>
              e.task.equals(taskTitle) &
              e.date.equals(date) &
              e.routine.equals(routineTitle),
        )).get();

    return subtasks.map((subtask) => subtask_model.Subtask(
        title: subtask.title,
        date: subtask.date,
        isDone: subtask.isDone,
      )
    ).toList();
  }

  upsertTask(task_model.Task task, String routineTitle, [bool? state]) {
    var taskCompanion = TasksCompanion(
      title: Value(task.title),
      routine: Value(routineTitle),
      startDate: Value(task.startDate),
      date: Value(task.date),
      isDone: Value(state),
    );
    _upsertTask(taskCompanion, task.subTasks);
  }

  _upsertTask(TasksCompanion task, List<subtask_model.Subtask> subTasks) async {
    await _db
        .into(_db.tasks)
        .insert(
          task,
          onConflict: DoUpdate((old) => TasksCompanion(isDone: task.isDone)),
        );
    if (task.isDone.value == true) {
      for (var subtask in subTasks) {
        upsertSubtask(
          subtask.copyWith(date: task.date.value),
          task.title.value,
          task.routine.value,
          true,
        );
      }
    }
  }

  Future<void> addTask(
    task_model.Task task,
    String routineTitle, [
    DateTime? date,
  ]) async {
    await _db
        .into(_db.tasks)
        .insert(
          TasksCompanion(
            title: Value(task.title),
            date: Value(task.date),
            startDate: Value(task.startDate),
            routine: Value(routineTitle),
            isDone: Value.absent(),
          ),
        );
    for (subtask_model.Subtask subtask in task.subTasks) {
      upsertSubtask(
        subtask.copyWith(date: date),
        task.title,
        routineTitle,
        null,
      );
    }
  }

  upsertSubtask(
    subtask_model.Subtask subtask,
    String taskTitle,
    String routineTitle,
    [bool? state]
  ) async {
    var subtasksCompanion = SubtasksCompanion(
      title: Value(subtask.title),
      task: Value(taskTitle),
      routine: Value(routineTitle),
      date: Value(subtask.date),
      isDone: Value(state),
    );
    await _upsertSubtask(subtasksCompanion);
  }

  _upsertSubtask(SubtasksCompanion subtask) async {
    await _db
        .into(_db.subtasks)
        .insert(
          subtask,
          onConflict: DoUpdate(
            (old) => SubtasksCompanion(isDone: Value(subtask.isDone.value)),
          ),
        );
  }

  saveDayProgress(double dayProgress, DateTime date, String routineTitle) {
    _db
        .into(_db.routineProgress)
        .insert(
          RoutineProgressCompanion(
            date: Value(date),
            progress: Value(dayProgress),
            routineTitle: Value(routineTitle),
          ),
          onConflict: DoUpdate(
            (old) => RoutineProgressCompanion(progress: Value(dayProgress)),
          ),
        );
  }

  deleteTask(String title, String routineTitle) async {
    await (_db.delete(_db.tasks)..where(
      (tbl) => tbl.title.equals(title) & tbl.routine.equals(routineTitle),
    )).go();
  }

  deleteSubtask(String title, String taskTitle, String routineTitle) async {
    await (_db.delete(_db.subtasks)..where(
      (tbl) =>
          tbl.title.equals(title) &
          tbl.routine.equals(routineTitle) &
          tbl.task.equals(taskTitle),
    )).go();
  }

  changeDayProgress(
    DateTime day,
    double taskPercentage,
    String routineTitle,
    double length,
  ) async {
    await (_db.update(_db.routineProgress)..where(
      (tbl) => tbl.date.equals(day) & tbl.routineTitle.equals(routineTitle),
    )).write(
      RoutineProgressCompanion.custom(
        progress:
            (_db.routineProgress.progress - Constant(taskPercentage)) *
            Constant(length) /
            Constant(length == 1 ? 1 : length - 1),
      ),
    );
  }

  Future<bool> getTaskState(
    String taskTitle,
    String routineTitle,
    DateTime day,
  ) async {
    var tasksTable = _db.tasks;
    var result =
        await (_db.selectOnly(tasksTable)
              ..addColumns([tasksTable.isDone])
              ..where(
                tasksTable.date.equals(day) &
                    tasksTable.routine.equals(routineTitle) &
                    tasksTable.title.equals(taskTitle),
              ))
            .map((row) => row.read(tasksTable.isDone))
            .get();
    return result.isEmpty
        ? false
        : result.single == true
        ? true
        : false;
  }

  updateSubtaskTitle(
    String title,
    String taskTitle,
    String routineTitle,
    String newTitle,
  ) async {
    await (_db.update(_db.subtasks)..where(
      (tbl) =>
          tbl.title.equals(title) &
          tbl.task.equals(taskTitle) &
          tbl.routine.equals(routineTitle),
    )).write(SubtasksCompanion(title: Value(newTitle)));
  }

  updateTaskTitle(String oldTitle, String newTitle, String routineTitle) async {
    await (_db.update(_db.tasks)..where(
      (tbl) => tbl.title.equals(oldTitle) & tbl.routine.equals(routineTitle),
    )).write(TasksCompanion(title: Value(newTitle)));
  }
}
