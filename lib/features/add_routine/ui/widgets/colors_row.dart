import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsRow extends StatefulWidget {
  const ColorsRow({super.key});

  @override
  State<ColorsRow> createState() => _ColorsRowState();
}

class _ColorsRowState extends State<ColorsRow> {

  Color selectedColor =Colors.red ;

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      colors.map((color) {
        return GestureDetector(
          onTap: () {
            selectedColor = color;
            setState(() {
            });
          },
          child: Container(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: CircleAvatar(
              radius: selectedColor == color ? 18.w : 15.w,
              backgroundColor: color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
