import 'package:daily_track/core/di/dependency_injection.dart';
import 'package:daily_track/core/routing/routes.dart';
import 'package:daily_track/features/add_routine/logic/add_routine_cubit.dart';
import 'package:daily_track/features/add_routine/ui/add_routine_screen.dart';
import 'package:daily_track/features/main/ui/main_screen.dart';
import 'package:daily_track/features/routine/data/models/routine.dart';
import 'package:daily_track/features/routine/logic/routine_cubit.dart';
import 'package:daily_track/features/routine/ui/routine_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/main/logic/Main_Cubit.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<MainCubit>(
                create: (context) => MainCubit(),
                child: const MainScreen(),
              ),
        );
      case Routes.addRoutineScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) => getIt<AddRoutineCubit>(),
            child: AddRoutineScreen()));
      case Routes.routineScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) => getIt<RoutineCubit>(),
            child: RoutineScreen(routine: arguments as Routine)));
      default:
        return null;
    }
  }
}
