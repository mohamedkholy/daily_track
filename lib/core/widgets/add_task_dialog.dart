import 'dart:ffi';

import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/core/widgets/my_button.dart';
import 'package:daily_track/core/widgets/my_text_form_field.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_cubit.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_state.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/styles.dart';
import 'dotted_button.dart';
import '../../features/routine/data/models/sub_task.dart';
import '../../features/routine/data/models/task.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task) addTask;
  final Task? task;

  const AddTaskDialog(this.addTask, {super.key, this.task});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  List<Subtask> subTasks = [];
  TextEditingController taskTitleController = TextEditingController();
  GlobalKey<FormState> taskTitleKey = GlobalKey();
  GlobalKey<FormState> subtaskTitleKey = GlobalKey();
  TextEditingController subTaskTitleController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      subTasks.addAll(widget.task!.subTasks);
      taskTitleController.text = widget.task!.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task title", style: TextStyles.font18BlackBold),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Form(
                  key: taskTitleKey,
                  child: MyTextFormField(
                    hint: "Enter task title...",
                    controller: taskTitleController,
                  ),
                ),
              ),
              Text("Subtasks", style: TextStyles.font18BlackBold),
              if (subTasks.isEmpty)
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    child: Text(
                      "No subtasks yet",
                      style: TextStyles.font14GreyRegular,
                    ),
                  ),
                ),
              ...List.generate(
                subTasks.length,
                (index) => Container(
                  margin: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        subTasks[index].title,
                        style: TextStyles.font16BlackRegular,
                      ),
                      GestureDetector(
                        onTap: () {
                          subTasks.removeAt(index);
                          setState(() {});
                        },
                        child: const Icon(Icons.clear, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Subtask title", style: TextStyles.font18BlackBold),
              Form(
                key: subtaskTitleKey,
                child: MyTextFormField(
                  validator: (val){
                    if(subTasks.any((element) => element.title==val,)) {
                      return "duplicated subtasks";
                    }
                    return null;
                  },
                  hint: "Enter subtask title...",
                  controller: subTaskTitleController,
                ),
              ),
              SizedBox(height: 5.h,),
              InkWell(
                onTap: () {
                  String subTaskTitle = subTaskTitleController.text;
                    if (subTaskTitle.isNotEmpty&&subtaskTitleKey.currentState!.validate()) {
                    subTasks.add(
                      Subtask(
                        title: subTaskTitle,
                        isDone: null,
                        date: DateUtils.dateOnly(DateTime.now()),
                      ),
                    );
                    subTaskTitleController.clear();
                    setState(() {});
                  }
                },
                child: const DottedButton("+ Add subtask"),
              ),
              MyButton(
                title: "Save Task",
                onPressed: () {
                  if (taskTitleKey.currentState!.validate()) {
                    widget.addTask(
                      Task(
                        title: taskTitleController.text,
                        isDone: null,
                        startDate: DateUtils.dateOnly(DateTime.now()),
                        date: DateUtils.dateOnly(DateTime.now()),
                        subTasks: subTasks,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
