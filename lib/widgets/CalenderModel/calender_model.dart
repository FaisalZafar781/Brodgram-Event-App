// import 'package:flutter/material.dart';
//
// class CalenderModel extends StatefulWidget {
//   @override
//   CalenderModel createState() => _CalendarPickerModalState();
// }
//
// class _CalendarPickerModalState extends State<CalendarPickerModal> {
//   DateTime? _selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Calendar Picker Example")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showCalendarModal(context);
//           },
//           child: Text("Open Calendar Picker"),
//         ),
//       ),
//     );
//   }
//
//   void CalenderModel(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Select Date',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               TableCalendar(
//                 firstDay: DateTime.utc(2000, 1, 1),
//                 lastDay: DateTime.utc(2100, 12, 31),
//                 focusedDay: _selectedDate ?? DateTime.now(),
//                 selectedDayPredicate: (day) {
//                   return isSameDay(_selectedDate, day);
//                 },
//                 onDaySelected: (selectedDay, focusedDay) {
//                   setState(() {
//                     _selectedDate = selectedDay;
//                   });
//                 },
//                 calendarStyle: CalendarStyle(
//                   todayDecoration: BoxDecoration(
//                     color: Colors.green.withOpacity(0.5),
//                     shape: BoxShape.circle,
//                   ),
//                   selectedDecoration: BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 headerStyle: HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_selectedDate != null) {
//                     Navigator.pop(context);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Selected: $_selectedDate")),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   "Done",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
