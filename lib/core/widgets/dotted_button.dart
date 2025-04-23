import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/styles.dart';

class DottedButton extends StatelessWidget {
  final String title;
  const DottedButton(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(title, style: TextStyles.font18BlackRegular),
      ),
    );
  }
}
