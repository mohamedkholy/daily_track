import 'package:daily_track/core/themes/styles.dart';
import 'package:daily_track/core/widgets/my_button.dart';
import 'package:daily_track/core/widgets/my_text_form_field.dart';
import 'package:daily_track/features/routine/data/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTitleDialog extends StatelessWidget {
  final BuildContext buildContext;
  final Item item;
  final Function(String) onSavePressed;
  final GlobalKey<FormState> taskTitleKey;

  const EditTitleDialog({
    required this.buildContext,
    required this.item,
    required this.onSavePressed,
    super.key,
    required this.taskTitleKey,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    controller.text = item.title;

    return Dialog(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: IntrinsicWidth(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text("Edit Title", style: TextStyles.font18BlackBold),
                ),
                Form(
                  key: taskTitleKey,
                  child: MyTextFormField(
                    hint: "Edit title",
                    controller: controller,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyles.font16WhiteBold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              if (taskTitleKey.currentState!.validate()) {
                                onSavePressed(controller.text);
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyles.font16WhiteBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
