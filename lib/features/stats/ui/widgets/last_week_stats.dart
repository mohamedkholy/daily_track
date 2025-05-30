import 'dart:math';

import 'package:daily_track/features/stats/data/model/routine_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/themes/styles.dart';
import '../../data/model/day_progress.dart';

class LastWeekStats extends StatelessWidget {
  final List<DayProgress> progresses;

  const LastWeekStats(this.progresses, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w,bottom: 10.h),
              child: Text(
                "Week Performance",
                style: TextStyles.font18BlackBold,
              ),
            ),
            SizedBox(
              height: 300.h,
              child: SfCartesianChart(
                series: [
                  LineSeries<DayProgress, DateTime>(
                    color: Colors.black,
                    sortingOrder: SortingOrder.ascending,
                    dataSource: progresses,
                    xValueMapper:
                        (DayProgress item, index) =>
                            DateUtils.dateOnly(item.date),
                    yValueMapper:
                        (DayProgress item, index) => (item.progress * 100),
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat.MMMd(),
                  intervalType: DateTimeIntervalType.days,
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  plotOffset: 10.w,
                  labelRotation: 45,
                  labelIntersectAction: AxisLabelIntersectAction.rotate90,
                  minimum: DateUtils.dateOnly(
                    DateTime.now(),
                  ).subtract(Duration(days: 6)),
                  maximum: DateUtils.dateOnly(DateTime.now()),
                  maximumLabels: 7,
                  rangePadding: ChartRangePadding.roundStart,
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyles.font12BlackRegular,
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyles.font12BlackRegular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
