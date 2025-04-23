import 'package:daily_track/core/widgets/add_task_dialog.dart';
import 'package:daily_track/core/widgets/delete_edit_menu.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:daily_track/features/routine/logic/routine_state.dart';
import 'package:daily_track/features/routine/ui/widgets/change_date_layout.dart';
import 'package:daily_track/features/routine/ui/widgets/day_progress.dart';
import 'package:daily_track/features/routine/ui/widgets/task_item.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/back_button.dart';
import '../data/models/task.dart';

class RoutineScreen extends StatefulWidget {
  final Routine routine;

  const RoutineScreen({super.key, required this.routine});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  void initState() {
    context.read<RoutineCubit>().routine = widget.routine;
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: buildContext,
            builder:
                (context) => AddTaskDialog((Task task) {
                  buildContext.read<RoutineCubit>()
                    ..addTask(task, widget.routine.title)
                    ..getTasks();
                }),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              BackButtonWithTitle(widget.routine.title),
              SizedBox(height: 20.h),
              ChangeDateLayout(routine: widget.routine),
              BlocConsumer<RoutineCubit, RoutineState>(
                listener: (context, state) {
                  if (state is UpdateSubtaskTitleFailed) {
                    floatingSnackBar(
                      message: "updating subtask title failed",
                      context: context,
                    );
                  }
                  else if(state is UpdateTaskTitleFailed){
                    floatingSnackBar(
                      message: "updating task title failed",
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingTasks) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    );
                  }
                    return Expanded(
                      child: Column(
                        children: [
                          DayProgress(state.tasks),
                          Expanded(
                            child: ListView(
                              children: [
                                ...List.generate(
                                  state.tasks.length,
                                  (index) => DeleteEditMenu(
                                    item: state.tasks[index],
                                    onOkPressed: () {
                                      buildContext
                                          .read<RoutineCubit>()
                                          .deleteTask(
                                            state.tasks[index],
                                            widget.routine.title,
                                          );
                                    },
                                    onTaskSaved: (Task newTask) {
                                      buildContext
                                          .read<RoutineCubit>()
                                          .updateTask(
                                            state.tasks[index],
                                            newTask,
                                            widget.routine.title,
                                          );
                                    },
                                    child: TaskItem(
                                      task: state.tasks[index],
                                      routineTitle: widget.routine.title,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
