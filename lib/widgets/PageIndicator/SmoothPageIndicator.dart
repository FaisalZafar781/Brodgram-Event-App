import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/constants/constants.dart';

class Smoothpageindicator extends StatelessWidget {
  final PageController pageController;


  const Smoothpageindicator({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect:  ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: AppColors.secondaryColor,
        dotColor:AppColors.lighyGreyColor1,
        expansionFactor: 4, // Expands the active dot
      ),
    );
  }
}
