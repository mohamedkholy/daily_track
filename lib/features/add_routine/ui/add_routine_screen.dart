import 'package:daily_track/core/di/dependency_injection.dart';
import 'package:daily_track/core/helpers/date_formater.dart';
import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/core/widgets/back_button.dart';
import 'package:daily_track/core/widgets/my_text_form_field.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_cubit.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_state.dart';
import 'package:daily_track/features/add_routine/ui/widgets/add_task_button.dart';
import 'package:daily_track/features/add_routine/ui/widgets/colors_row.dart';
import 'package:daily_track/core/widgets/my_button.dart';
import 'package:daily_track/features/add_routine/ui/widgets/task_item.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routine/data/models/task.dart';

class AddRoutineScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> taskTitleKey = GlobalKey();

  AddRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWithTitle("Create New Routine"),
                SizedBox(height: 10.h,),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Routine Name", style: TextStyles.font18BlackBold),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: Form(
                            key: taskTitleKey,
                            child: MyTextFormField(
                              controller: controller,
                              hint: "Enter routine name...",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            "Tasks",
                            style: TextStyles.font18BlackBold,
                          ),
                        ),
                        BlocConsumer<AddRoutineCubit, AddRoutineState>(
                          listener: (context, state) {
                            if (state is AddingRoutineState) {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                              );
                            } else if (state is SuccessAddedRoutineState) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                            else if(state is AddingRoutineFailedState){
                              Navigator.of(context).pop();
                              floatingSnackBar(
                                message: "Adding routine failed",
                                context: context,
                              );
                            }
                           else if (state is AddTaskState) {
                              tasks.add(state.task);
                            } else if (state is RemoveTaskState) {
                              tasks.removeWhere((element) {
                                return element == state.task;
                              });
                            }
                          },
                          builder: (context, state) {
                            if (tasks.isEmpty) {
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30.h),
                                  child: Text(
                                    "No tasks yet",
                                    style: TextStyles.font14GreyRegular,
                                  ),
                                ),
                              );
                            }
                            return ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ...List.generate(
                                  tasks.length,
                                  (index) => TaskItem(tasks[index]),
                                ),
                              ],
                            );
                          },
                        ),
                        const AddTaskButton(),
                        MyButton(
                          title: "Save routine",
                          onPressed: () {
                            if (tasks.isEmpty) {
                              floatingSnackBar(
                                message: "No Tasks",
                                context: context,
                              );
                            } else if (taskTitleKey.currentState!.validate()) {
                              context.read<AddRoutineCubit>().addRoutine(
                                Routine(
                                  title: controller.text,
                                  startDate: DateUtils.dateOnly(DateTime.now()),
                                  tasks: tasks,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
