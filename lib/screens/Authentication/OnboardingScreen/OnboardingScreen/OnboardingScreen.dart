
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/assets.dart';
import '../../../../providers/OnboardingProvider.dart';
import '../../../../widgets/PageIndicator/SmoothPageIndicator.dart';
import '../../../../widgets/PrimaryButton/CustomPrimaryButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> _pages = [
    {
      "image": Assets.imagesBoarding1,
      "title": "Discover Sports Events",
      "description": "Explore and browse upcoming sports events and courses tailored to your interests",
    },
    {
      "image": Assets.imagesBoarding2,
      "title": "Easy Registration & Payment",
      "description": "Effortlessly register for events, with secure payment options for paid events",
    },
    {
      "image": Assets.imagesBoarding3,
      "title": "Stay Notified & Join Virtual Events",
      "description": "This keeps it clean and straightforward! Let me know if you need anything else",
    },
  ];



  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final double topPadding = screenHeight * 0;
    double responsiveWidth = screenWidth * 0.9;
    double responsiveHeight = screenHeight * 0.6;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  pageProvider.updatePage(index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: _buildPage(
                      image: _pages[index]["image"]!,
                      title: _pages[index]["title"]!,
                      description: _pages[index]["description"]!,
                      responsiveWidth: responsiveWidth, // Pass the responsive width
                      responsiveHeight: responsiveHeight, // Pass the responsive height
                    ),
                  );
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Smoothpageindicator(pageController: _pageController),
            ),

            // Primary Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PrimaryButton(
                text: pageProvider.currentPage == _pages.length - 1
                    ? "Get Started"
                    : "Next",
                onPressed: () {
                  if (pageProvider.currentPage == _pages.length - 1) {pageProvider.navigateToNextScreen(context);
                  } else {
                    // Move to the next page
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
    required double responsiveWidth,
    required double responsiveHeight,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image
        Image.asset(
          image,
          height: responsiveHeight,
          width: responsiveWidth,
          fit: BoxFit.contain,
        ),
        const SizedBox(height:30),

        // Title
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(

              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Description
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}


