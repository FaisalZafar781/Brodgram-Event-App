import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorGrid extends StatelessWidget {
  const TutorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 900
        ? 3
        : 4;

    double childAspectRatio = screenWidth < 600
        ? 1
        : screenWidth < 900
        ? 1.2
        : 1.3;

    // Use a fixed height container for better layout control
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildDashboardCard(
          index: index,
          title: index == 0
              ? "Total Events"
              : index == 1
              ? "Completed Events"
              : index == 2
              ? "Cancelled Events"
              : "Total Participants",
          value: index == 0
              ? "30"
              : index == 1
              ? "28"
              : index == 2
              ? "2"
              : "2k",
          percentageChange: "1.3%",
          progressValue: 0.11, // Example progress value (11%)
          screenWidth: screenWidth,
        );
      },
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String value,
    required String percentageChange,
    required double progressValue,
    required int index,
    required double screenWidth,
  }) {
    double iconSize = screenWidth < 600 ? 12 : 16;
    double progressIndicatorSize = screenWidth < 600 ? 30 : 40;

    return Card(
      color: index == 0 ? AppColors.secondaryColor : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: index != 0 ? AppColors.black : AppColors.white,
                fontSize: screenWidth < 600 ? 13 : 13,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth < 600
                    ? AppFontSizes.title1
                    : AppFontSizes.title1,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: FontWeight.bold,
                color: index != 0 ? AppColors.black : AppColors.white,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? AppColors.white
                          : index == 3
                          ? AppColors.fill
                          : AppColors.fill.withOpacity(1),
                      child: Icon(
                        index == 0 || index == 3
                            ? CupertinoIcons.arrow_up_right
                            : CupertinoIcons.arrow_down_left,
                        color: AppColors.secondaryColor,
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      percentageChange,
                      style: TextStyle(
                        color: index != 0 ? AppColors.black : AppColors.white,
                        fontFamily: AppFontsFamily.poppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                index == 0
                    ? const SizedBox()
                    : SizedBox(
                  width: progressIndicatorSize,
                  height: progressIndicatorSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progressValue,
                        strokeWidth: 4,
                        color: AppColors.secondaryColor,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      Text(
                        "${(progressValue * 100).toInt()}%", // Display percentage inside
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: screenWidth < 600 ? 8 : 10,
                          fontWeight: FontWeight.bold,
                          color: index != 0
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
