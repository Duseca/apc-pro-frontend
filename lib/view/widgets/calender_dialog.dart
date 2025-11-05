import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';

class CustomCalendarSheet extends StatefulWidget {
  const CustomCalendarSheet({super.key});

  @override
  State<CustomCalendarSheet> createState() => _CustomCalendarSheetState();
}

class _CustomCalendarSheetState extends State<CustomCalendarSheet> {
  DateTime _focusedDay = DateTime(2025, 7, 8);
  DateTime? _selectedDay;

  String _monthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final month = _monthName(_focusedDay.month);

    return CustomeContainer(
      radius: 8,
      color: getfillcolor(context),
      vpad: 10,
      hpad: 20,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                  });
                },
                icon:  Icon(Icons.chevron_left, color: getSecondaryColor(context), size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Text(
                "$month, ${_focusedDay.year}",
                style:  TextStyle(
                  fontSize: 14,
                  color: getSecondaryColor(context),
                  fontFamily: AppFonts.gilroyMedium,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                  });
                },
                icon:  Icon(Icons.chevron_right, color: getSecondaryColor(context), size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 🔹 Calendar
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            calendarFormat: CalendarFormat.month,
            daysOfWeekVisible: true,
            headerVisible: false,
            daysOfWeekStyle:  DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: getSecondaryColor(context),
                fontWeight: FontWeight.w400,
              ),
              weekendStyle: TextStyle(
                color: getSecondaryColor(context),
                fontWeight: FontWeight.w400,
              ),
            ),
            calendarStyle:  CalendarStyle(
                outsideDaysVisible: false,
                cellPadding: EdgeInsets.zero,
                weekendTextStyle: TextStyle(color: getSecondaryColor(context)),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                todayTextStyle: TextStyle(color: getSecondaryColor(context), fontSize: 14)),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) {
                final text = [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat'
                ][day.weekday % 7];
                final isSunday = day.weekday == DateTime.sunday;

                return Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: getTertiary(context),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.gilroyMedium,
                    ),
                  ),
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                final isSelected = isSameDay(_selectedDay, day);
                final isToday = isSameDay(day, DateTime.now());
                final isSunday = day.weekday == DateTime.sunday;

                return Center(
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 38,
                      height: 40,
                    
                      decoration: isSelected || isToday
                          ? BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              color: getsplashcolor(context), )
                          : null,
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected || isToday
                              ? getSecondaryColor(context)
                              : isSunday
                                  ? getSecondaryColor(context)
                                  : getSecondaryColor(context),
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.gilroyMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: getsplashcolor(context), ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: 14,
                        color: getSecondaryColor(context),
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.gilroyMedium,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
