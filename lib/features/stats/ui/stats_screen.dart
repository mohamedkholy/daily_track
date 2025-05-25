import 'package:daily_track/features/stats/data/model/day_progress.dart';
import 'package:daily_track/features/stats/logic/states_cubit.dart';
import 'package:daily_track/features/stats/logic/stats_state.dart';
import 'package:daily_track/features/stats/ui/widgets/last_week_stats.dart';
import 'package:daily_track/features/stats/ui/widgets/stats_app_bar.dart';
import 'package:daily_track/features/stats/ui/widgets/streak_card.dart';
import 'package:daily_track/features/stats/ui/widgets/top_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/styles.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late StatsCubit cubit;
  List<DayProgress> list = [];
  String selectedValue = "";

  @override
  void initState() {
    cubit = context.read<StatsCubit>();
    cubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatsAppBar(),
            SizedBox(height: 15.h),
            BlocConsumer<StatsCubit, StatsState>(
              listener: (context, state) {
                if (state is LoadedState) {
                  if (state.routineProgress.isNotEmpty) {
                    list = state.routineProgress[0].daysProgresses;
                    selectedValue = state.routineProgress[0].routineTitle;
                  }
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Column(
                    children: [LastWeekStats([]), StreakCard(0)],
                  );
                } else if (state is NoRoutinesState) {
                  return Center(
                    child: Text(
                      "No routines yet",
                      style: TextStyles.font14BlackRegular,
                    ),
                  );
                } else if (state is LoadedState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        [
                          state.routineProgress.isEmpty
                              ? Container()
                              : Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Routine:  ",
                                      style: TextStyles.font18BlackBold,
                                    ),
                                    DropdownButton(
                                      underline: Container(),
                                      value: selectedValue,
                                      items:
                                          state.routineProgress
                                              .map(
                                                (e) => DropdownMenuItem(
                                                  value: e.routineTitle,
                                                  child: Text(e.routineTitle),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value.toString();
                                          list =
                                              state.routineProgress
                                                  .firstWhere(
                                                    (e) =>
                                                        e.routineTitle == value,
                                                  )
                                                  .daysProgresses;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                          LastWeekStats(list),
                          state.routineProgress.isEmpty
                              ? const StreakCard(0)
                              : StreakCard(state.streaks[selectedValue]!),
                          if (state.routineProgress.isNotEmpty)
                            TopTasks(routineTitle: selectedValue),
                        ].animate(interval: .1.seconds).fadeIn().slideX(),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
