import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'database_tables.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [Tasks, Subtasks, Routines, RoutineProgress])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection()) {
    _enableForeignKeys();
  }

  _enableForeignKeys() async {
    await customStatement('PRAGMA foreign_keys = ON;');
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: "my_db");
  }
}
