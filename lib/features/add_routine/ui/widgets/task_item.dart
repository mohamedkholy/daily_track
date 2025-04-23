import 'package:daily_track/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routine/data/models/task.dart';
import '../../logic/add_routine_cubit.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10).w,
      margin: EdgeInsets.all(10).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: TextStyles.font18BlackBold),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...List.generate(task.subTasks.length, (index) {
                        return Text(
                          task.subTasks[index].title,
                          style: TextStyles.font18BlackRegular,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AddRoutineCubit>().removeTask(task);
            },
            child: CircleAvatar(
              radius: 15.r,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.close, size: 18.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
