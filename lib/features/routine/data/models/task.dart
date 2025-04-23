import 'package:daily_track/features/routine/data/models/sub_task.dart';
import 'package:equatable/equatable.dart';

import 'item.dart';

class Task extends Equatable implements Item {
  @override
  final String title;
  final bool? isDone;
  final List<Subtask> subTasks;
  final DateTime startDate;
  final DateTime date;

  const Task({
    required this.title,
    required this.startDate,
    required this.date,
    required this.isDone,
    required this.subTasks,
  });

  @override
  List<Object?> get props => [title, date];

  Task copyWith({
    String? title,
    bool? isDone,
    DateTime? startDate,
    DateTime? date,
  }) {
    return Task(
      title: title ?? this.title,
      subTasks: subTasks,
      date: date ?? this.date,
      startDate: startDate ?? this.startDate,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;

}
