import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/stats/logic/states_cubit.dart';
import 'package:daily_track/features/stats/logic/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopTasks extends StatelessWidget {
  final String routineTitle;

  const TopTasks({super.key, required this.routineTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10),
        child: BlocBuilder<StatsCubit, StatsState>(
          buildWhen: (previous, current) => current is LoadedState,
          builder: (context, state) {
            if (state is LoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Tasks", style: TextStyles.font16BlackBold),
                  SizedBox(height: 10),
                  ...List.generate(
                    state.topTasks[routineTitle]!.length,
                    (index) => Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            state.topTasks[routineTitle]![index].title,
                            style: TextStyles.font16BlackRegular,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            minHeight: 10.h,
                            color: Colors.black,
                            backgroundColor: Colors.grey.withAlpha(50),
                            borderRadius: BorderRadius.circular(5.0.r),
                            value:
                                state.topTasks[routineTitle]![index].progress,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${(state.topTasks[routineTitle]![index].progress * 100).ceil()}%",
                          style: TextStyles.font12BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
