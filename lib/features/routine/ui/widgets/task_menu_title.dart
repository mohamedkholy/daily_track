import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';
import '../../data/models/task.dart' show Task;

class TaskMenuTitle extends StatelessWidget {
  final Task task;
  final String routineTitle;

  const TaskMenuTitle({
    required this.task,
    required this.routineTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<String>(
          color: Colors.grey[100],
          child: Icon(
            task.isDone == null
                ? Icons.circle_outlined
                : task.isDone!
                ? Icons.check_circle
                : Icons.cancel_rounded,
            color:
                task.isDone == null
                    ? Colors.grey
                    : task.isDone!
                    ? Colors.green
                    : Colors.red,
            size: 30.r,
          ),
          onSelected: (value) {
            if (task.subTasks.length !=
                    task.subTasks.where((e) => e.isDone == true).length ||
                task.subTasks.isEmpty) {
              context.read<RoutineCubit>().saveTaskState(
                task,
                checkTask(value),
              );
            }
          },
          itemBuilder:
              (BuildContext context) => [
                const PopupMenuItem(value: "Done", child: Text("Done")),
                const PopupMenuItem(value: "Fail", child: Text("Fail")),
                const PopupMenuItem(value: "Not yet", child: Text("Not yet")),
              ],
        ),
        Container(
          width: 200.w,
          margin: EdgeInsetsDirectional.only(start: 10.w),
          child: Text(
            task.title,
            style: TextStyles.font18BlackBold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

bool? checkTask(val) {
  switch (val) {
    case "Done":
      return true;
    case "Fail":
      return false;
    default:
      return null;
  }
}
