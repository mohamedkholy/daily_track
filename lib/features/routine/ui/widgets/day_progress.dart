import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/routine/data/models/task.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayProgress extends StatelessWidget {
  final List<Task> tasks;
  const DayProgress(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    final completeTasks = tasks.where((e) => e.isDone==true).length;
    final dayProgress =completeTasks/(tasks.isEmpty?1:tasks.length);
    context.read<RoutineCubit>().saveDayProgress(dayProgress);
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text("day Progress", style: TextStyles.font16GreyRegular),
            ),
            LinearProgressIndicator(
              value: dayProgress,
              minHeight: 10.h,
              color: dayProgress==1?Colors.green:Colors.orange,
              borderRadius: BorderRadius.circular(10.r),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.only(top: 5.h),
              child: Text(
                 "$completeTasks/${tasks.length} tasks completed",
                style: TextStyles.font16GreyRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
