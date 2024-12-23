import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime> _days = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _generateDays();
  }

  void _generateDays() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    _days = List.generate(
      daysInMonth,
      (index) => DateTime(now.year, now.month, index + 1),
    );
  }

  void _onDaySelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _days.length,
              itemBuilder: (context, index) {
                DateTime day = _days[index];
                bool isSelected = _selectedDate.day == day.day;

                return GestureDetector(
                  onTap: () => _onDaySelected(day),
                  child: Container(
                    width: screenWidth * 0.08,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.secondaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${day.day}', // Day number
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('MMM')
                              .format(day), // Month abbreviation (e.g., Jan)
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
