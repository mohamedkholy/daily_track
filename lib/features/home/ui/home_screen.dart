import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/core/widgets/delete_edit_menu.dart';
import 'package:daily_track/features/home/logic/home_cubit.dart';
import 'package:daily_track/features/home/logic/home_state.dart';
import 'package:daily_track/features/home/ui/widgets/add_routine_button.dart';
import 'package:daily_track/features/home/ui/widgets/app_bar.dart';
import 'package:daily_track/features/home/ui/widgets/routine_item.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeCubit>().getRoutines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: 15.h),
              const AddRoutineButton(),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.0.w),
                child: Text(
                  "Your Routines",
                  style: TextStyles.font18WhiteBold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if(state is UpdateRoutineTitleFailed){
                      floatingSnackBar(
                        message: "updating title failed",
                        context: context,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }
                    else if(state is NoRoutines){
                      return const Center(child: Text("No routines yet"),);
                    }
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ...List.generate(
                          state.routines.length,
                              (index) => DeleteEditMenu(
                            item: state.routines[index],
                            child: RoutineItem(state.routines[index]),
                            onOkPressed: () {
                              context.read<HomeCubit>().deleteRoutine(
                                state.routines[index].title,
                              );
                            },
                            onSavePressed: (String newTitle) {
                              context.read<HomeCubit>().updateRoutineTitle(
                                state.routines[index].title,
                                newTitle,
                              );
                            },
                          ),
                        ),
                      ].animate(interval: .1.seconds).fadeIn().slideX(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
  }
}
