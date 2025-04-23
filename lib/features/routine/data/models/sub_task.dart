import 'package:equatable/equatable.dart';

import 'item.dart';

class Subtask extends Equatable implements Item{
  @override
  final String title;
  final bool? isDone;
  final DateTime date;

  const Subtask({required this.title,required this.date,required this.isDone});

  @override
  List<Object?> get props => [title,date,isDone];

  Subtask copyWith({String? title, bool? isDone, DateTime? date}) {
    return Subtask(
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Subtask && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;

}