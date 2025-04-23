import 'package:daily_track/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonWithTitle extends StatelessWidget {
  final String title;

  const BackButtonWithTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15.w,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_back, color: Colors.white, size: 18.w),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: Text(
                    title,
                    style: TextStyles.font18BlackBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
