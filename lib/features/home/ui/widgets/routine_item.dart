import 'package:daily_track/core/routing/routes.dart';
import 'package:daily_track/features/home/logic/home_cubit.dart';
import 'package:daily_track/features/home/ui/widgets/overall_progress.dart';
import 'package:daily_track/features/home/ui/widgets/today_progress.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';

class RoutineItem extends StatelessWidget {
  final Routine routine;

  const RoutineItem(this.routine, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 10.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.w),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(routine.title, style: TextStyles.font18BlackBold),
                      SizedBox(height: 10.h),
                      TodayProgress(routine: routine),
                      SizedBox(height: 8.h),
                      OverallProgress(routine: routine),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.routineScreen, arguments: routine)
                      .then((value) {
                        if (context.mounted) {
                          context.read<HomeCubit>().getRoutines();
                        }
                      });
                },
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 15.w, end: 10.w),
                  child: CircleAvatar(
                    radius: 18.w,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 21.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
