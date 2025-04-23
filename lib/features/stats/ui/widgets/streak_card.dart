import 'package:daily_track/core/themes/styles.dart';
import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  final int streaks;

  const StreakCard(this.streaks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current Streak", style: TextStyles.font16BlackBold),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$streaks ",
                        style: TextStyles.font36BlackBold,
                      ),
                      TextSpan(
                        text: "days",
                        style: TextStyles.font16GreyRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                child: GridView.count(
                  crossAxisCount: 10,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // disables scrolling
                  children: List.generate(
                    30,
                    (index) => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: index < streaks ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
