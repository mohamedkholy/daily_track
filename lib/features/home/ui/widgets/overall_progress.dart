import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';
import '../../../routine/data/models/routine.dart';
import '../../logic/home_cubit.dart';

class OverallProgress extends StatelessWidget {
  final Routine routine;

  const OverallProgress({required this.routine, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HomeCubit>().getOverallProgress(
        routine,
      ),
      builder: (context, snapshot) {
        return Row(
          children: [
            Text(
              "Overall Progress:",
              style: TextStyles.font14BlackRegular,
            ),
            Expanded(
              child: Container(
                height: 10.0.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                ),
                child: LinearProgressIndicator(
                  color: Colors.green,
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
