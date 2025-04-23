import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChangeDateLayout extends StatefulWidget {
  final Routine routine;

  const ChangeDateLayout({required this.routine, super.key});

  @override
  State<ChangeDateLayout> createState() => _ChangeDateLayoutState();
}

class _ChangeDateLayoutState extends State<ChangeDateLayout> {
  DateTime date = DateUtils.dateOnly(DateTime.now());

  @override
  void initState() {
    context.read<RoutineCubit>().getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed:
                  DateUtils.isSameDay(date, widget.routine.startDate)
                      ? null
                      : () {
                        setState(() {
                          date = date.subtract(Duration(days: 1));
                          context.read<RoutineCubit>().updateTasks(date);
                        });
                      },
              icon: Icon(Icons.arrow_back),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
            Text(
              DateFormat("MMMM d, y").format(date),
              style: TextStyles.font18BlackBold,
            ), //"March 13, 2025"
            IconButton(
              onPressed:
                  DateUtils.isSameDay(date, DateTime.now())
                      ? null
                      : () {
                        setState(() {
                          date = date.add(Duration(days: 1));
                          context.read<RoutineCubit>().updateTasks(date);
                        });
                      },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
