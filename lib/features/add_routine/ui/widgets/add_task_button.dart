import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_cubit.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/dotted_button.dart';
import '../../../../core/widgets/add_task_dialog.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});
  @override
  Widget build(BuildContext buildContext) {
    return InkWell(
      onTap: () {
        showDialog(
          context: buildContext,
          builder:
              (context) => AddTaskDialog((Task task){
                buildContext.read<AddRoutineCubit>().addTask(task);
              }),
        );
      },
      child: DottedButton("+ Add Task"),
    );
  }
}
