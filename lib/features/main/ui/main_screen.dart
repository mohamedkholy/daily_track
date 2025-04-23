import 'package:daily_track/core/di/dependency_injection.dart';
import 'package:daily_track/features/home/logic/home_cubit.dart';
import 'package:daily_track/features/home/ui/home_screen.dart';
import 'package:daily_track/features/main/logic/Main_Cubit.dart';
import 'package:daily_track/features/stats/logic/states_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/styles.dart';
import '../../stats/ui/stats_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.read<MainCubit>().setScreenIndex(index),
        currentIndex: context.watch<MainCubit>().state,
        selectedItemColor: Colors.black,
        selectedFontSize: 15.sp,
        unselectedFontSize: 12.sp,
        selectedLabelStyle: TextStyles.font18BlackBold,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 24.w,), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats,size: 24.w),
            label: "Stats",
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<MainCubit, int>(
          listener: (context, state) =>
            _pageController.animateToPage(state, duration: .5.seconds, curve: Curves.linear)
          ,
          builder:
              (context, state) => PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => context.read<MainCubit>().setScreenIndex(index),
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return BlocProvider(
                      create: (context) => getIt<HomeCubit>(),
                      child: HomeScreen(),
                    );
                  } else {
                    return BlocProvider(
                      create: (context) => getIt<StatsCubit>(),
                      child: StatsScreen(),
                    );
                  }
                },
              ),
        ),
      ),
    );
  }
}
