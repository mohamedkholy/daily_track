import 'dart:ui';

import 'package:daily_track/core/routing/app_router.dart';
import 'package:daily_track/core/routing/routes.dart';
import 'package:daily_track/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_orientation_screen/lock_orientation_screen.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize:
              constraints.maxWidth > 600
                  ? Size(constraints.maxWidth, constraints.maxHeight)
                  : const Size(430, 900),
          minTextAdapt: true,
          child: LockOrientation(
            child: MaterialApp(
              initialRoute: Routes.mainScreen,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                dividerColor: Colors.transparent,
                scaffoldBackgroundColor: Colors.grey[50],
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                ),
                cardTheme: const CardTheme(elevation: 2, color: Colors.white),
                primaryColor: Colors.black,
                fontFamily: "montserrat_regular",
              ),
              onGenerateRoute: AppRouter().generateRoute,
            ),
          ),
        );
      },
    );
  }
}
