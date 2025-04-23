import 'dart:developer';

import 'package:daily_track/core/database/my_database.dart';
import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/stats/data/model/day_progress.dart';
import 'package:daily_track/features/stats/data/model/routine_progress.dart';
import 'package:daily_track/features/stats/data/model/task_progress.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class StatsRepo {
  final MyDatabase _db;

  StatsRepo(this._db);

  Future<Map<String, List<DayProgress>>> getRoutinesLastWeekProgress() async {
    final Map<String, List<DayProgress>> result = {};
    await (_db.select(_db.routineProgress, distinct: true)
          ..addColumns([
            _db.routines.title,
            _db.routineProgress.progress,
            _db.routineProgress.date,
          ])
          ..where(
            (tbl) => tbl.date.isBiggerOrEqualValue(
              DateUtils.dateOnly(DateTime.now().subtract(Duration(days: 7))),
            ),
          ))
        .join([
          innerJoin(
            _db.routines,
            _db.routines.title.equalsExp(_db.routineProgress.routineTitle),
          ),
        ])
        .map((row) {
          var routine = row.read(_db.routines.title)!;
          var progress = row.read(_db.routineProgress.progress)!;
          var date = row.read(_db.routineProgress.date)!;
          result.putIfAbsent(routine, () => []);
          result[routine]!.add(DayProgress(date, progress));
        })
        .get();

    return result;
  }

  Future<List<TaskProgress>> getRoutineTopTasks(String routineTitle) async {
    var result =
        await (_db.selectOnly(_db.tasks, distinct: true)
              ..addColumns([_db.tasks.title, _db.tasks.startDate])
              ..where(_db.tasks.routine.equals(routineTitle)))
            .get();

    List<TaskProgress> list = await Future.wait(
      result.map((row) async {
        var title = row.read(_db.tasks.title)!;
        return TaskProgress(
          title,
          await getTaskProgress(title, row.read(_db.tasks.startDate)!),
        );
      }),
    );

    list.sort((a, b) => a.progress.compareTo(b.progress));
    return list.length < 4 ? list : list.sublist(list.length - 3);
  }

  getTaskProgress(String title, DateTime startDate) async {
    var row =
        await (_db.selectOnly(_db.tasks)
              ..addColumns([_db.tasks.isDone.count()])
              ..where(
                _db.tasks.title.equals(title) & _db.tasks.isDone.equals(true),
              ))
            .getSingle();

    var count = row.read(_db.tasks.isDone.count())!;
    return count / daysUntilToday(startDate);
  }
}
