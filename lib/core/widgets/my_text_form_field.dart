import 'package:daily_track/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final String hint;

  const MyTextFormField({
    required this.hint,
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        style: TextStyles.font16BlackRegular,
        validator:
            validator ??
            (value) {
              if (value?.isEmpty == true) {
                return "Empty field";
              }
              return null;
            },
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hint,
          hintStyle: TextStyles.font16GreyRegular,
        ),
      ),
    );
  }
}
