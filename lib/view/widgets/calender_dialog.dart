// import 'package:flutter/material.dart';
// import 'package:apc_pro/view/widgets/my_button.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:apc_pro/consts/app_colors.dart';
// import 'package:apc_pro/consts/app_fonts.dart';
// import 'package:apc_pro/view/widgets/dialogboxes.dart';

// class CustomCalendar extends StatelessWidget {
//   const CustomCalendar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return dialogBoxBody(
//       alignment: Alignment.center,
//       barrier: kwhite.withOpacity(0.2),
//       lpad: 20,
//       rpad: 20,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const CustomCalendarSheet(),
//           Row(
//             children: [
//               Expanded(
//                   child: MyButton(
//                 buttonText: 'Cancel',
//                 height: 48,
//                 outlineColor: kgrey,
//                 fontColor: kgrey,
//                 backgroundColor: kwhite,
//               )),
// SizedBox(width: 20,),
//                    Expanded(
//                   child: MyButton(
//                 buttonText: 'Select',
//                 height: 48,
//               ))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomCalendarSheet extends StatefulWidget {
//   const CustomCalendarSheet({super.key});

//   @override
//   State<CustomCalendarSheet> createState() => _CustomCalendarSheetState();
// }

// class _CustomCalendarSheetState extends State<CustomCalendarSheet> {
//   DateTime _focusedDay = DateTime(2025, 7, 8);
//   DateTime? _selectedDay;

//   String _monthName(int month) {
//     const monthNames = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December'
//     ];
//     return monthNames[month - 1];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final month = _monthName(_focusedDay.month);

//     return Container(
//      // padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: Text(
//               month,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: kheading,
//                 fontFamily: AppFonts.gilroyBold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),

//           // 🔹 Calendar
//           TableCalendar(
//             firstDay: DateTime.utc(2020, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//             startingDayOfWeek: StartingDayOfWeek.sunday,
//             calendarFormat: CalendarFormat.month,
//             daysOfWeekVisible: true,
//             headerVisible: false,
//             daysOfWeekStyle: const DaysOfWeekStyle(
//               weekdayStyle: TextStyle(
//                 color: ksecondary,
//                 fontWeight: FontWeight.w400,
//               ),
//               weekendStyle: TextStyle(
//                 color: ksecondary,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             calendarStyle: const CalendarStyle(
              
//                 outsideDaysVisible: false,
//                 cellPadding: EdgeInsets.zero,
//                 weekendTextStyle: TextStyle(color: kred),
//                 todayDecoration: BoxDecoration(
//                   color: Colors.transparent,
//                 ),
//                 todayTextStyle: TextStyle(color: kheading, fontSize: 14)),
//             calendarBuilders: CalendarBuilders(
//               dowBuilder: (context, day) {
//                 final text = [
//                   'Sun',
//                   'Mon',
//                   'Tue',
//                   'Wed',
//                   'Thu',
//                   'Fri',
//                   'Sat'
//                 ][day.weekday % 7];
//                 final isSunday = day.weekday == DateTime.sunday;

//                 return Center(
//                   child: Text(
//                     text,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: isSunday ? kred : ksecondary,
//                       fontfontFamily: AppFonts.gilroyMedium,
//                       fontFamily: AppFonts.gilroyBold,
//                     ),
//                   ),
//                 );
//               },
//               defaultBuilder: (context, day, focusedDay) {
//                 final isSelected = isSameDay(_selectedDay, day);
//                 final isToday = isSameDay(day, DateTime.now());
//                 final isSunday = day.weekday == DateTime.sunday;

//                 return Center(
//                   child: Container(
//                     width: 36,
//                     height: 36,
//                     decoration: isSelected || isToday
//                         ? BoxDecoration(
//                             color: ksecondary,
//                             borderRadius: BorderRadius.circular(8),
//                           )
//                         : null,
//                     alignment: Alignment.center,
//                     child: Text(
//                       '${day.day}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: isSelected || isToday
//                             ? kheading
//                             : isSunday
//                                 ? kred
//                                 : kheading,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: AppFonts.gilroyBold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               selectedBuilder: (context, day, focusedDay) {
//                 return Center(
//                   child: Container(
//                     width: 32,
//                     height: 24,
//                     decoration: BoxDecoration(
//                       color: ksecondary,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       '${day.day}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: kwhite,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: AppFonts.gilroyBold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
