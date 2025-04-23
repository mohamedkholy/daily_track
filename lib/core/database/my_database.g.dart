// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $RoutinesTable extends Routines with TableInfo<$RoutinesTable, Routine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [title, startDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Routine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {title};
  @override
  Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Routine(
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      startDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}start_date'],
          )!,
    );
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }
}

class Routine extends DataClass implements Insertable<Routine> {
  final String title;
  final DateTime startDate;
  const Routine({required this.title, required this.startDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['start_date'] = Variable<DateTime>(startDate);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(title: Value(title), startDate: Value(startDate));
  }

  factory Routine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Routine(
      title: serializer.fromJson<String>(json['title']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'startDate': serializer.toJson<DateTime>(startDate),
    };
  }

  Routine copyWith({String? title, DateTime? startDate}) => Routine(
    title: title ?? this.title,
    startDate: startDate ?? this.startDate,
  );
  Routine copyWithCompanion(RoutinesCompanion data) {
    return Routine(
      title: data.title.present ? data.title.value : this.title,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Routine(')
          ..write('title: $title, ')
          ..write('startDate: $startDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, startDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Routine &&
          other.title == this.title &&
          other.startDate == this.startDate);
}

class RoutinesCompanion extends UpdateCompanion<Routine> {
  final Value<String> title;
  final Value<DateTime> startDate;
  final Value<int> rowid;
  const RoutinesCompanion({
    this.title = const Value.absent(),
    this.startDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutinesCompanion.insert({
    required String title,
    required DateTime startDate,
    this.rowid = const Value.absent(),
  }) : title = Value(title),
       startDate = Value(startDate);
  static Insertable<Routine> custom({
    Expression<String>? title,
    Expression<DateTime>? startDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (startDate != null) 'start_date': startDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutinesCompanion copyWith({
    Value<String>? title,
    Value<DateTime>? startDate,
    Value<int>? rowid,
  }) {
    return RoutinesCompanion(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _routineMeta = const VerificationMeta(
    'routine',
  );
  @override
  late final GeneratedColumn<String> routine = GeneratedColumn<String>(
    'routine',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routines (title) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    routine,
    title,
    isDone,
    startDate,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('routine')) {
      context.handle(
        _routineMeta,
        routine.isAcceptableOrUnknown(data['routine']!, _routineMeta),
      );
    } else if (isInserting) {
      context.missing(_routineMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routine, title, date};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      routine:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}routine'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      ),
      startDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}start_date'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String routine;
  final String title;
  final bool? isDone;
  final DateTime startDate;
  final DateTime date;
  const Task({
    required this.routine,
    required this.title,
    this.isDone,
    required this.startDate,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['routine'] = Variable<String>(routine);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || isDone != null) {
      map['is_done'] = Variable<bool>(isDone);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      routine: Value(routine),
      title: Value(title),
      isDone:
          isDone == null && nullToAbsent ? const Value.absent() : Value(isDone),
      startDate: Value(startDate),
      date: Value(date),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      routine: serializer.fromJson<String>(json['routine']),
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool?>(json['isDone']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routine': serializer.toJson<String>(routine),
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool?>(isDone),
      'startDate': serializer.toJson<DateTime>(startDate),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Task copyWith({
    String? routine,
    String? title,
    Value<bool?> isDone = const Value.absent(),
    DateTime? startDate,
    DateTime? date,
  }) => Task(
    routine: routine ?? this.routine,
    title: title ?? this.title,
    isDone: isDone.present ? isDone.value : this.isDone,
    startDate: startDate ?? this.startDate,
    date: date ?? this.date,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      routine: data.routine.present ? data.routine.value : this.routine,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('routine: $routine, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('startDate: $startDate, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routine, title, isDone, startDate, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.routine == this.routine &&
          other.title == this.title &&
          other.isDone == this.isDone &&
          other.startDate == this.startDate &&
          other.date == this.date);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> routine;
  final Value<String> title;
  final Value<bool?> isDone;
  final Value<DateTime> startDate;
  final Value<DateTime> date;
  final Value<int> rowid;
  const TasksCompanion({
    this.routine = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
    this.startDate = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String routine,
    required String title,
    this.isDone = const Value.absent(),
    required DateTime startDate,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : routine = Value(routine),
       title = Value(title),
       startDate = Value(startDate),
       date = Value(date);
  static Insertable<Task> custom({
    Expression<String>? routine,
    Expression<String>? title,
    Expression<bool>? isDone,
    Expression<DateTime>? startDate,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (routine != null) 'routine': routine,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
      if (startDate != null) 'start_date': startDate,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? routine,
    Value<String>? title,
    Value<bool?>? isDone,
    Value<DateTime>? startDate,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      routine: routine ?? this.routine,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      startDate: startDate ?? this.startDate,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routine.present) {
      map['routine'] = Variable<String>(routine.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('routine: $routine, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('startDate: $startDate, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubtasksTable extends Subtasks with TableInfo<$SubtasksTable, Subtask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubtasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
    'task',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routineMeta = const VerificationMeta(
    'routine',
  );
  @override
  late final GeneratedColumn<String> routine = GeneratedColumn<String>(
    'routine',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [title, task, routine, isDone, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subtasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subtask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('task')) {
      context.handle(
        _taskMeta,
        task.isAcceptableOrUnknown(data['task']!, _taskMeta),
      );
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('routine')) {
      context.handle(
        _routineMeta,
        routine.isAcceptableOrUnknown(data['routine']!, _routineMeta),
      );
    } else if (isInserting) {
      context.missing(_routineMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {title, task, routine, date};
  @override
  Subtask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subtask(
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      task:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}task'],
          )!,
      routine:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}routine'],
          )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
    );
  }

  @override
  $SubtasksTable createAlias(String alias) {
    return $SubtasksTable(attachedDatabase, alias);
  }
}

class Subtask extends DataClass implements Insertable<Subtask> {
  final String title;
  final String task;
  final String routine;
  final bool? isDone;
  final DateTime date;
  const Subtask({
    required this.title,
    required this.task,
    required this.routine,
    this.isDone,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['task'] = Variable<String>(task);
    map['routine'] = Variable<String>(routine);
    if (!nullToAbsent || isDone != null) {
      map['is_done'] = Variable<bool>(isDone);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  SubtasksCompanion toCompanion(bool nullToAbsent) {
    return SubtasksCompanion(
      title: Value(title),
      task: Value(task),
      routine: Value(routine),
      isDone:
          isDone == null && nullToAbsent ? const Value.absent() : Value(isDone),
      date: Value(date),
    );
  }

  factory Subtask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subtask(
      title: serializer.fromJson<String>(json['title']),
      task: serializer.fromJson<String>(json['task']),
      routine: serializer.fromJson<String>(json['routine']),
      isDone: serializer.fromJson<bool?>(json['isDone']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'task': serializer.toJson<String>(task),
      'routine': serializer.toJson<String>(routine),
      'isDone': serializer.toJson<bool?>(isDone),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Subtask copyWith({
    String? title,
    String? task,
    String? routine,
    Value<bool?> isDone = const Value.absent(),
    DateTime? date,
  }) => Subtask(
    title: title ?? this.title,
    task: task ?? this.task,
    routine: routine ?? this.routine,
    isDone: isDone.present ? isDone.value : this.isDone,
    date: date ?? this.date,
  );
  Subtask copyWithCompanion(SubtasksCompanion data) {
    return Subtask(
      title: data.title.present ? data.title.value : this.title,
      task: data.task.present ? data.task.value : this.task,
      routine: data.routine.present ? data.routine.value : this.routine,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subtask(')
          ..write('title: $title, ')
          ..write('task: $task, ')
          ..write('routine: $routine, ')
          ..write('isDone: $isDone, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, task, routine, isDone, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subtask &&
          other.title == this.title &&
          other.task == this.task &&
          other.routine == this.routine &&
          other.isDone == this.isDone &&
          other.date == this.date);
}

class SubtasksCompanion extends UpdateCompanion<Subtask> {
  final Value<String> title;
  final Value<String> task;
  final Value<String> routine;
  final Value<bool?> isDone;
  final Value<DateTime> date;
  final Value<int> rowid;
  const SubtasksCompanion({
    this.title = const Value.absent(),
    this.task = const Value.absent(),
    this.routine = const Value.absent(),
    this.isDone = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubtasksCompanion.insert({
    required String title,
    required String task,
    required String routine,
    this.isDone = const Value.absent(),
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : title = Value(title),
       task = Value(task),
       routine = Value(routine),
       date = Value(date);
  static Insertable<Subtask> custom({
    Expression<String>? title,
    Expression<String>? task,
    Expression<String>? routine,
    Expression<bool>? isDone,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (task != null) 'task': task,
      if (routine != null) 'routine': routine,
      if (isDone != null) 'is_done': isDone,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubtasksCompanion copyWith({
    Value<String>? title,
    Value<String>? task,
    Value<String>? routine,
    Value<bool?>? isDone,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return SubtasksCompanion(
      title: title ?? this.title,
      task: task ?? this.task,
      routine: routine ?? this.routine,
      isDone: isDone ?? this.isDone,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (routine.present) {
      map['routine'] = Variable<String>(routine.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubtasksCompanion(')
          ..write('title: $title, ')
          ..write('task: $task, ')
          ..write('routine: $routine, ')
          ..write('isDone: $isDone, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineProgressTable extends RoutineProgress
    with TableInfo<$RoutineProgressTable, RoutineProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _routineTitleMeta = const VerificationMeta(
    'routineTitle',
  );
  @override
  late final GeneratedColumn<String> routineTitle = GeneratedColumn<String>(
    'routine_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routines (title) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [routineTitle, date, progress];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('routine_title')) {
      context.handle(
        _routineTitleMeta,
        routineTitle.isAcceptableOrUnknown(
          data['routine_title']!,
          _routineTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routineTitleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routineTitle, date};
  @override
  RoutineProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineProgressData(
      routineTitle:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}routine_title'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      progress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}progress'],
          )!,
    );
  }

  @override
  $RoutineProgressTable createAlias(String alias) {
    return $RoutineProgressTable(attachedDatabase, alias);
  }
}

class RoutineProgressData extends DataClass
    implements Insertable<RoutineProgressData> {
  final String routineTitle;
  final DateTime date;
  final double progress;
  const RoutineProgressData({
    required this.routineTitle,
    required this.date,
    required this.progress,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['routine_title'] = Variable<String>(routineTitle);
    map['date'] = Variable<DateTime>(date);
    map['progress'] = Variable<double>(progress);
    return map;
  }

  RoutineProgressCompanion toCompanion(bool nullToAbsent) {
    return RoutineProgressCompanion(
      routineTitle: Value(routineTitle),
      date: Value(date),
      progress: Value(progress),
    );
  }

  factory RoutineProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineProgressData(
      routineTitle: serializer.fromJson<String>(json['routineTitle']),
      date: serializer.fromJson<DateTime>(json['date']),
      progress: serializer.fromJson<double>(json['progress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routineTitle': serializer.toJson<String>(routineTitle),
      'date': serializer.toJson<DateTime>(date),
      'progress': serializer.toJson<double>(progress),
    };
  }

  RoutineProgressData copyWith({
    String? routineTitle,
    DateTime? date,
    double? progress,
  }) => RoutineProgressData(
    routineTitle: routineTitle ?? this.routineTitle,
    date: date ?? this.date,
    progress: progress ?? this.progress,
  );
  RoutineProgressData copyWithCompanion(RoutineProgressCompanion data) {
    return RoutineProgressData(
      routineTitle:
          data.routineTitle.present
              ? data.routineTitle.value
              : this.routineTitle,
      date: data.date.present ? data.date.value : this.date,
      progress: data.progress.present ? data.progress.value : this.progress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineProgressData(')
          ..write('routineTitle: $routineTitle, ')
          ..write('date: $date, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routineTitle, date, progress);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineProgressData &&
          other.routineTitle == this.routineTitle &&
          other.date == this.date &&
          other.progress == this.progress);
}

class RoutineProgressCompanion extends UpdateCompanion<RoutineProgressData> {
  final Value<String> routineTitle;
  final Value<DateTime> date;
  final Value<double> progress;
  final Value<int> rowid;
  const RoutineProgressCompanion({
    this.routineTitle = const Value.absent(),
    this.date = const Value.absent(),
    this.progress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineProgressCompanion.insert({
    required String routineTitle,
    required DateTime date,
    required double progress,
    this.rowid = const Value.absent(),
  }) : routineTitle = Value(routineTitle),
       date = Value(date),
       progress = Value(progress);
  static Insertable<RoutineProgressData> custom({
    Expression<String>? routineTitle,
    Expression<DateTime>? date,
    Expression<double>? progress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (routineTitle != null) 'routine_title': routineTitle,
      if (date != null) 'date': date,
      if (progress != null) 'progress': progress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineProgressCompanion copyWith({
    Value<String>? routineTitle,
    Value<DateTime>? date,
    Value<double>? progress,
    Value<int>? rowid,
  }) {
    return RoutineProgressCompanion(
      routineTitle: routineTitle ?? this.routineTitle,
      date: date ?? this.date,
      progress: progress ?? this.progress,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routineTitle.present) {
      map['routine_title'] = Variable<String>(routineTitle.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineProgressCompanion(')
          ..write('routineTitle: $routineTitle, ')
          ..write('date: $date, ')
          ..write('progress: $progress, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $SubtasksTable subtasks = $SubtasksTable(this);
  late final $RoutineProgressTable routineProgress = $RoutineProgressTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    routines,
    tasks,
    subtasks,
    routineProgress,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_progress', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('routine_progress', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$RoutinesTableCreateCompanionBuilder =
    RoutinesCompanion Function({
      required String title,
      required DateTime startDate,
      Value<int> rowid,
    });
typedef $$RoutinesTableUpdateCompanionBuilder =
    RoutinesCompanion Function({
      Value<String> title,
      Value<DateTime> startDate,
      Value<int> rowid,
    });

final class $$RoutinesTableReferences
    extends BaseReferences<_$MyDatabase, $RoutinesTable, Routine> {
  $$RoutinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$MyDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.routines.title, db.tasks.routine),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.routine.title.sqlEquals($_itemColumn<String>('title')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutineProgressTable, List<RoutineProgressData>>
  _routineProgressRefsTable(_$MyDatabase db) => MultiTypedResultKey.fromTable(
    db.routineProgress,
    aliasName: $_aliasNameGenerator(
      db.routines.title,
      db.routineProgress.routineTitle,
    ),
  );

  $$RoutineProgressTableProcessedTableManager get routineProgressRefs {
    final manager = $$RoutineProgressTableTableManager(
      $_db,
      $_db.routineProgress,
    ).filter(
      (f) => f.routineTitle.title.sqlEquals($_itemColumn<String>('title')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _routineProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutinesTableFilterComposer
    extends Composer<_$MyDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.title,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.routine,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routineProgressRefs(
    Expression<bool> Function($$RoutineProgressTableFilterComposer f) f,
  ) {
    final $$RoutineProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.title,
      referencedTable: $db.routineProgress,
      getReferencedColumn: (t) => t.routineTitle,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineProgressTableFilterComposer(
            $db: $db,
            $table: $db.routineProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutinesTableOrderingComposer
    extends Composer<_$MyDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutinesTableAnnotationComposer
    extends Composer<_$MyDatabase, $RoutinesTable> {
  $$RoutinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.title,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.routine,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routineProgressRefs<T extends Object>(
    Expression<T> Function($$RoutineProgressTableAnnotationComposer a) f,
  ) {
    final $$RoutineProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.title,
      referencedTable: $db.routineProgress,
      getReferencedColumn: (t) => t.routineTitle,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.routineProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutinesTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $RoutinesTable,
          Routine,
          $$RoutinesTableFilterComposer,
          $$RoutinesTableOrderingComposer,
          $$RoutinesTableAnnotationComposer,
          $$RoutinesTableCreateCompanionBuilder,
          $$RoutinesTableUpdateCompanionBuilder,
          (Routine, $$RoutinesTableReferences),
          Routine,
          PrefetchHooks Function({bool tasksRefs, bool routineProgressRefs})
        > {
  $$RoutinesTableTableManager(_$MyDatabase db, $RoutinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RoutinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RoutinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RoutinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> title = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion(
                title: title,
                startDate: startDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String title,
                required DateTime startDate,
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion.insert(
                title: title,
                startDate: startDate,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RoutinesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            tasksRefs = false,
            routineProgressRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tasksRefs) db.tasks,
                if (routineProgressRefs) db.routineProgress,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData<Routine, $RoutinesTable, Task>(
                      currentTable: table,
                      referencedTable: $$RoutinesTableReferences
                          ._tasksRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$RoutinesTableReferences(
                                db,
                                table,
                                p0,
                              ).tasksRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.routine == item.title,
                          ),
                      typedResults: items,
                    ),
                  if (routineProgressRefs)
                    await $_getPrefetchedData<
                      Routine,
                      $RoutinesTable,
                      RoutineProgressData
                    >(
                      currentTable: table,
                      referencedTable: $$RoutinesTableReferences
                          ._routineProgressRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$RoutinesTableReferences(
                                db,
                                table,
                                p0,
                              ).routineProgressRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.routineTitle == item.title,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoutinesTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $RoutinesTable,
      Routine,
      $$RoutinesTableFilterComposer,
      $$RoutinesTableOrderingComposer,
      $$RoutinesTableAnnotationComposer,
      $$RoutinesTableCreateCompanionBuilder,
      $$RoutinesTableUpdateCompanionBuilder,
      (Routine, $$RoutinesTableReferences),
      Routine,
      PrefetchHooks Function({bool tasksRefs, bool routineProgressRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      required String routine,
      required String title,
      Value<bool?> isDone,
      required DateTime startDate,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<String> routine,
      Value<String> title,
      Value<bool?> isDone,
      Value<DateTime> startDate,
      Value<DateTime> date,
      Value<int> rowid,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$MyDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutinesTable _routineTable(_$MyDatabase db) => db.routines
      .createAlias($_aliasNameGenerator(db.tasks.routine, db.routines.title));

  $$RoutinesTableProcessedTableManager get routine {
    final $_column = $_itemColumn<String>('routine')!;

    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.title.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$MyDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutinesTableFilterComposer get routine {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routine,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer extends Composer<_$MyDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinesTableOrderingComposer get routine {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routine,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableOrderingComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$RoutinesTableAnnotationComposer get routine {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routine,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool routine})
        > {
  $$TasksTableTableManager(_$MyDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> routine = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool?> isDone = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                routine: routine,
                title: title,
                isDone: isDone,
                startDate: startDate,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String routine,
                required String title,
                Value<bool?> isDone = const Value.absent(),
                required DateTime startDate,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                routine: routine,
                title: title,
                isDone: isDone,
                startDate: startDate,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TasksTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({routine = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (routine) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.routine,
                            referencedTable: $$TasksTableReferences
                                ._routineTable(db),
                            referencedColumn:
                                $$TasksTableReferences._routineTable(db).title,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool routine})
    >;
typedef $$SubtasksTableCreateCompanionBuilder =
    SubtasksCompanion Function({
      required String title,
      required String task,
      required String routine,
      Value<bool?> isDone,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$SubtasksTableUpdateCompanionBuilder =
    SubtasksCompanion Function({
      Value<String> title,
      Value<String> task,
      Value<String> routine,
      Value<bool?> isDone,
      Value<DateTime> date,
      Value<int> rowid,
    });

class $$SubtasksTableFilterComposer
    extends Composer<_$MyDatabase, $SubtasksTable> {
  $$SubtasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get task => $composableBuilder(
    column: $table.task,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routine => $composableBuilder(
    column: $table.routine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubtasksTableOrderingComposer
    extends Composer<_$MyDatabase, $SubtasksTable> {
  $$SubtasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get task => $composableBuilder(
    column: $table.task,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routine => $composableBuilder(
    column: $table.routine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubtasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $SubtasksTable> {
  $$SubtasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<String> get routine =>
      $composableBuilder(column: $table.routine, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$SubtasksTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $SubtasksTable,
          Subtask,
          $$SubtasksTableFilterComposer,
          $$SubtasksTableOrderingComposer,
          $$SubtasksTableAnnotationComposer,
          $$SubtasksTableCreateCompanionBuilder,
          $$SubtasksTableUpdateCompanionBuilder,
          (Subtask, BaseReferences<_$MyDatabase, $SubtasksTable, Subtask>),
          Subtask,
          PrefetchHooks Function()
        > {
  $$SubtasksTableTableManager(_$MyDatabase db, $SubtasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SubtasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SubtasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SubtasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> title = const Value.absent(),
                Value<String> task = const Value.absent(),
                Value<String> routine = const Value.absent(),
                Value<bool?> isDone = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubtasksCompanion(
                title: title,
                task: task,
                routine: routine,
                isDone: isDone,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String title,
                required String task,
                required String routine,
                Value<bool?> isDone = const Value.absent(),
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => SubtasksCompanion.insert(
                title: title,
                task: task,
                routine: routine,
                isDone: isDone,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubtasksTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $SubtasksTable,
      Subtask,
      $$SubtasksTableFilterComposer,
      $$SubtasksTableOrderingComposer,
      $$SubtasksTableAnnotationComposer,
      $$SubtasksTableCreateCompanionBuilder,
      $$SubtasksTableUpdateCompanionBuilder,
      (Subtask, BaseReferences<_$MyDatabase, $SubtasksTable, Subtask>),
      Subtask,
      PrefetchHooks Function()
    >;
typedef $$RoutineProgressTableCreateCompanionBuilder =
    RoutineProgressCompanion Function({
      required String routineTitle,
      required DateTime date,
      required double progress,
      Value<int> rowid,
    });
typedef $$RoutineProgressTableUpdateCompanionBuilder =
    RoutineProgressCompanion Function({
      Value<String> routineTitle,
      Value<DateTime> date,
      Value<double> progress,
      Value<int> rowid,
    });

final class $$RoutineProgressTableReferences
    extends
        BaseReferences<
          _$MyDatabase,
          $RoutineProgressTable,
          RoutineProgressData
        > {
  $$RoutineProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoutinesTable _routineTitleTable(_$MyDatabase db) =>
      db.routines.createAlias(
        $_aliasNameGenerator(
          db.routineProgress.routineTitle,
          db.routines.title,
        ),
      );

  $$RoutinesTableProcessedTableManager get routineTitle {
    final $_column = $_itemColumn<String>('routine_title')!;

    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.title.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineTitleTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoutineProgressTableFilterComposer
    extends Composer<_$MyDatabase, $RoutineProgressTable> {
  $$RoutineProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutinesTableFilterComposer get routineTitle {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineTitle,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineProgressTableOrderingComposer
    extends Composer<_$MyDatabase, $RoutineProgressTable> {
  $$RoutineProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinesTableOrderingComposer get routineTitle {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineTitle,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableOrderingComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineProgressTableAnnotationComposer
    extends Composer<_$MyDatabase, $RoutineProgressTable> {
  $$RoutineProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  $$RoutinesTableAnnotationComposer get routineTitle {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineTitle,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.title,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineProgressTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $RoutineProgressTable,
          RoutineProgressData,
          $$RoutineProgressTableFilterComposer,
          $$RoutineProgressTableOrderingComposer,
          $$RoutineProgressTableAnnotationComposer,
          $$RoutineProgressTableCreateCompanionBuilder,
          $$RoutineProgressTableUpdateCompanionBuilder,
          (RoutineProgressData, $$RoutineProgressTableReferences),
          RoutineProgressData,
          PrefetchHooks Function({bool routineTitle})
        > {
  $$RoutineProgressTableTableManager(
    _$MyDatabase db,
    $RoutineProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$RoutineProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RoutineProgressTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RoutineProgressTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> routineTitle = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineProgressCompanion(
                routineTitle: routineTitle,
                date: date,
                progress: progress,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String routineTitle,
                required DateTime date,
                required double progress,
                Value<int> rowid = const Value.absent(),
              }) => RoutineProgressCompanion.insert(
                routineTitle: routineTitle,
                date: date,
                progress: progress,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RoutineProgressTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({routineTitle = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (routineTitle) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.routineTitle,
                            referencedTable: $$RoutineProgressTableReferences
                                ._routineTitleTable(db),
                            referencedColumn:
                                $$RoutineProgressTableReferences
                                    ._routineTitleTable(db)
                                    .title,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoutineProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $RoutineProgressTable,
      RoutineProgressData,
      $$RoutineProgressTableFilterComposer,
      $$RoutineProgressTableOrderingComposer,
      $$RoutineProgressTableAnnotationComposer,
      $$RoutineProgressTableCreateCompanionBuilder,
      $$RoutineProgressTableUpdateCompanionBuilder,
      (RoutineProgressData, $$RoutineProgressTableReferences),
      RoutineProgressData,
      PrefetchHooks Function({bool routineTitle})
    >;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$SubtasksTableTableManager get subtasks =>
      $$SubtasksTableTableManager(_db, _db.subtasks);
  $$RoutineProgressTableTableManager get routineProgress =>
      $$RoutineProgressTableTableManager(_db, _db.routineProgress);
}
