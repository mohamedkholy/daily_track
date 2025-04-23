import 'dart:ui';

import 'package:daily_track/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../themes/styles.dart';

showDeleteDialog({
  required BuildContext context,
  required String deletedItemTitle,
  required VoidCallback onOkPressed,
}) {
  Alert(
    context: context,
    style: AlertStyle(
      backgroundColor: Colors.white,
      isCloseButton: false,
      descStyle: TextStyles.font16BlackRegular,
      titleStyle: TextStyles.font18BlackBold,
    ),
    title: "Deleting $deletedItemTitle",
    desc: "Are you sure that you want to delete $deletedItemTitle permanently",
    image: Image.asset(Assets.imagesAlert, width: 100.w, height: 100.h),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        color: Colors.black,
        child: Text("Cancel", style: TextStyles.font18WhiteBold),
      ),
      DialogButton(
        onPressed: () {
          onOkPressed();
          Navigator.pop(context);
        },
        color: Colors.black,
        child: Text("Ok", style: TextStyles.font18WhiteBold),
      ),
    ],
  ).show();

}
