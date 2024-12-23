import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCrousel extends StatefulWidget {
  const ImageCrousel({super.key});

  @override
  State<ImageCrousel> createState() => _ImageCrouselState();
}

class _ImageCrouselState extends State<ImageCrousel> {
  final List<String> imgList = [
    'assets/images/card2.png',
    'assets/images/card1.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          items: imgList.map((item) {
            return Container(
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: screenHeight * 0.30,
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 50,
          left: screenWidth * 0.4,
          right: screenWidth * 0.4, // Add a small margin from the right
          child: Container(
            width: 12,
            height: 18,
            decoration: BoxDecoration(
              color:
                  Colors.white30, // Semi-transparent background for container
              borderRadius: BorderRadius.circular(
                  15), // Rounded corners for the background container
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _currentIndex = entry.key;
                  }),
                  child: Container(
                    width: _currentIndex == entry.key
                        ? 10.0
                        : 6.0, // Set width based on selection
                    height: _currentIndex == entry.key
                        ? 10.0
                        : 6.0, // Set height based on selection
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0), // Margin between indicators
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.white // Selected indicator color
                          : const Color(0xFF6A6A6A)
                              .withOpacity(0.4), // Unselected indicator color
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
