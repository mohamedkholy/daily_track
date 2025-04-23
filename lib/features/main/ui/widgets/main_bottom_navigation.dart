import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/features/main/logic/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => context.read<MainCubit>().setScreenIndex(index),
      currentIndex: context
          .watch<MainCubit>()
          .state,
      selectedItemColor: Colors.black,
      selectedFontSize: 15.sp,
      selectedLabelStyle: TextStyles.font18BlackBold,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.query_stats), label: "Stats"),
      ],
    );
  }
}
