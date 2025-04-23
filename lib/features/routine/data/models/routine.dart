import 'package:daily_track/features/routine/data/models/item.dart';
import 'package:daily_track/features/routine/data/models/task.dart';

class Routine implements Item{
  @override
  final String title;
  final DateTime startDate;
  final List<Task>? tasks;

  Routine({required this.title,required this.startDate, this.tasks});

}