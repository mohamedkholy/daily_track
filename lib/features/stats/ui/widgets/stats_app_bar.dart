import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';

class StatsAppBar extends StatelessWidget {
  const StatsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Stats", style: TextStyles.font24BlackBold),
            Text(
              "Track your productivity",
              style: TextStyles.font14GreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
