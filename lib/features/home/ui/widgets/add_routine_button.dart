import 'package:daily_track/core/routing/routes.dart';
import 'package:daily_track/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';

class AddRoutineButton extends StatelessWidget {
  const AddRoutineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.addRoutineScreen).then((_) {
          if (context.mounted) {
            context.read<HomeCubit>().getRoutines();
          }
        },);
      },
      child: Card(
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.all(20.0.w),
          width: double.infinity,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundColor: Colors.white.withValues(alpha: .4),
                child: Icon(Icons.add, color: Colors.white,size: 24.w,),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add New Routine", style: TextStyles.font18WhiteBold),
                    Text(
                      "Create a custom daily routine",
                      style: TextStyles.font14GreyRegular.copyWith(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
