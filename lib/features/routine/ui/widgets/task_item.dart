import 'package:daily_track/core/widgets/delete_edit_menu.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:daily_track/features/routine/logic/routine_state.dart';
import 'package:daily_track/features/routine/ui/widgets/subtask_item.dart';
import 'package:daily_track/features/routine/ui/widgets/task_menu_title.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final String routineTitle;

  const TaskItem({required this.task, required this.routineTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        childrenPadding: EdgeInsetsDirectional.only(start: 30.w, bottom: 10.h),

        expandedAlignment: Alignment.topLeft,
        title: TaskMenuTitle(task: task, routineTitle: routineTitle),
        children: [
          ...List.generate(
            task.subTasks.length,
            (index) => DeleteEditMenu(
              item: task.subTasks[index],
              onOkPressed: () {
                 context.read<RoutineCubit>().deleteSubtask(
                  task.subTasks[index].title,
                  task.title,
                  routineTitle,
                );
              },
              onSavePressed: (String newTitle) {
                 context.read<RoutineCubit>().updateSubtaskTitle(
                  task.subTasks[index].title,
                  task.title,
                  routineTitle,
                  newTitle,
                );
              },
              child: SubtaskItem(
                subtask: task.subTasks[index],
                task: task,
                routineTitle: routineTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
