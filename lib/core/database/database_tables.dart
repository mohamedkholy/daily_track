import 'package:drift/drift.dart';

class Routines extends Table {
  TextColumn get title => text()();

  DateTimeColumn get startDate => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {title};
}

class Tasks extends Table {
  TextColumn get routine =>
      text().references(
        Routines,
        #title,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get title => text()();

  BoolColumn get isDone => boolean().nullable()();

  DateTimeColumn get startDate => dateTime()();

  DateTimeColumn get date => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {routine, title, date};
}

class Subtasks extends Table {
  TextColumn get title => text()();

  TextColumn get task => text()();

  TextColumn get routine => text()();

  BoolColumn get isDone => boolean().nullable()();

  DateTimeColumn get date => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {title, task, routine, date};

  @override
  List<String> get customConstraints => [
    " FOREIGN KEY (task, routine, date) REFERENCES tasks(title, routine, date) ON DELETE CASCADE ON UPDATE CASCADE",
  ];
}

class RoutineProgress extends Table {
  TextColumn get routineTitle =>
      text().references(
        Routines,
        #title,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  DateTimeColumn get date => dateTime()();

  RealColumn get progress => real()();

  @override
  Set<Column<Object>> get primaryKey => {routineTitle, date};
}
