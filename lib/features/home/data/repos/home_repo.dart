import 'package:daily_track/core/database/my_database.dart';
import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/features/routine/data/models/routine.dart'
    as models;
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class HomeRepo {
  final MyDatabase _db;

  HomeRepo(this._db);

  Future<Stream<List<models.Routine>>> getAllRoutines() async {
    Stream<List<Routine>> query = _db.select(_db.routines).watch();
    return query.asyncMap((list) {
      return list.map((e) {
        return models.Routine(title: e.title, startDate: e.startDate);
      }).toList();
    });
  }

  Future<double> getTodayProgress(String title) async {
    var list =
        await (_db.selectOnly(_db.routineProgress)
              ..addColumns([_db.routineProgress.progress])
              ..where(
                _db.routineProgress.routineTitle.equals(title) &
                    _db.routineProgress.date.equals(
                      DateUtils.dateOnly(DateTime.now()),
                    ),
              ))
            .map((row) => row.read(_db.routineProgress.progress)!)
            .get();

    return list.isNotEmpty ? list.single : 0;
  }

  Future<double> getDaysProgresses(title) async {
    var list =
        await (_db.selectOnly(_db.routineProgress)
              ..addColumns([_db.routineProgress.progress])
              ..where(_db.routineProgress.routineTitle.equals(title)))
            .map((row) => row.read(_db.routineProgress.progress)!)
            .get();

    return list.isNotEmpty
        ? list.reduce((value, element) => value + element)
        : 0;
  }

  deleteRoutine(String title) {
    (_db.delete(_db.routines)..where((tbl) => tbl.title.equals(title))).go();
  }

  updateRoutineTitle(String title, String newTitle) async {
    await (_db.update(_db.routines)..where(
      (tbl) => tbl.title.equals(title),
    )).write(RoutinesCompanion(title: Value(newTitle)));
  }
}
