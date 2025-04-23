import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/sub_task.dart';

class SubtaskItem extends StatelessWidget {
  final Subtask subtask;
  final String routineTitle;
  final Task task;

  const SubtaskItem({
    required this.subtask,
    required this.task,
    required this.routineTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      color: Colors.white38,
      child: Row(
        children: [
          PopupMenuButton<String>(
            child: Icon(
              subtask.isDone == null
                  ? Icons.circle_outlined
                  : subtask.isDone!
                  ? Icons.check_circle
                  : Icons.cancel_rounded,
              color:
                  subtask.isDone == null
                      ? Colors.grey
                      : subtask.isDone!
                      ? Colors.green
                      : Colors.red,
              size: 30.r,
            ),
            onSelected: (value) {
              context.read<RoutineCubit>().saveSubtaskState(
                subtask,
                task.title,
                _checkSubtaskState(value),
              );

              if ((_checkSubtaskState(value) != true && task.isDone == true)) {
                _saveTask(context, null);
              } else if (_checkSubtaskState(value) == true &&
                  task.subTasks.where((e) => e.isDone == true).length ==
                      task.subTasks.length - 1) {
                _saveTask(context, true);
              } else {
                _saveTask(context, task.isDone);
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(value: "Done", child: Text("Done")),
                  PopupMenuItem(value: "Fail", child: Text("Fail")),
                  PopupMenuItem(value: "Not yet", child: Text("Not yet")),
                ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 10.w),
            child: Text(subtask.title, style: TextStyles.font16BlackRegular),
          ),
        ],
      ),
    );
  }

  _saveTask(BuildContext context, bool? state) {
    context.read<RoutineCubit>().saveTaskState(task, state);
  }

  bool? _checkSubtaskState(val) {
    switch (val) {
      case "Done":
        return true;
      case "Fail":
        return false;
      default:
        return null;
    }
  }
}
