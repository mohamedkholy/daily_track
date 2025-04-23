import 'package:daily_track/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final double? width;

  const MyButton({required this.title,required this.onPressed,super.key,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?? double.infinity,
      margin: EdgeInsets.only(top: 20.h,bottom: 50.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: Text(title,style: TextStyles.font18WhiteBold,),
      ),
    );
  }
}
