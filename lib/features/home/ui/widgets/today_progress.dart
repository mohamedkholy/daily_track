import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';
import '../../logic/home_cubit.dart';

class TodayProgress extends StatelessWidget {
  final Routine routine;

  const TodayProgress({required this.routine, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HomeCubit>().getTodayDayProgress(
        routine.title,
      ),
      builder: (context, snapshot) {
        return Row(
          children: [
            Text(
              "Today Progress:",
              style: TextStyles.font14BlackRegular,
            ),
            Expanded(
              child: Container(
                height: 10.0.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                ),
                child: LinearProgressIndicator(
                  color:
                  snapshot.data == 1
                      ? Colors.green
                      : Colors.orange,
                  backgroundColor: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(5.0.r),
                  value: snapshot.data??0,
                ),
              ),
            ),
            Text(
              "${((snapshot.data ?? 0) * 100).ceil()}%",
              style: TextStyles.font12BlackRegular,
            ),
          ],
        );
      },
    );
  }
}
