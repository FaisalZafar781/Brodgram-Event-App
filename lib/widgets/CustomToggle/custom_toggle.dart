import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class CustomToggle extends StatefulWidget {
  final int initialSelectedIndex;
  final ValueChanged<int> onTap;
  final List<String> labels;

  const CustomToggle({
    super.key,
    this.initialSelectedIndex = 0,
    required this.onTap,
    required this.labels,
  });

  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      width: screenWidth * 0.61,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding:
          EdgeInsets.symmetric(vertical: screenHeight * 0.005, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.labels.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: screenWidth * 0.03),
              child: Text(
                widget.labels[index],
                style: TextStyle(
                  fontFamily: AppFontsFamily.poppins,
                  color: _selectedIndex == index
                      ? Colors.white
                      : AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
