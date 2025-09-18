import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class WeeklySchedulePreview extends StatelessWidget {
  const WeeklySchedulePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduleData = [
      {'day': 'Mon', 'time': '09:00 AM – 06:00 PM', 'break': '1:00 – 2:00 PM'},
      {'day': 'Tue', 'time': '09:00 AM – 06:00 PM', 'break': '1:00 – 2:00 PM'},
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kborder),
      ),
      child: Column(
        children: [
          // Title Section
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: MyText(
                text: 'Weekly Schedule Preview',
                size: 14,
                weight: FontWeight.w600,
                color: kheading,
                paddingTop: 7,
                paddingBottom:7,
              )),
          const Divider(height: 1, thickness: 1,color: kborder,),

          // Table Header
          Table(
            border: TableBorder(
              horizontalInside: BorderSide(color: kborder),
              verticalInside: BorderSide(color: kborder),
            ),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(3),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(),
                children: [
                  _TableHeaderCell(text: 'Day'),
                  _TableHeaderCell(text: 'Time Slot'),
                  _TableHeaderCell(text: 'Break Time'),
                ],
              ),
              ...scheduleData.map((item) {
                return TableRow(
                  decoration: const BoxDecoration(),
                  children: [
                    _TableCell(text: item['day']!),
                    _TableCell(text: item['time']!),
                    _TableCell(text: item['break']!),
                  ],
                );
              }).toList(),
            ],
          ),

          // View all
          Container(
            alignment: Alignment.centerRight,
            decoration:
                BoxDecoration(border: Border(top: BorderSide(color: kborder))),
       
            child: GestureDetector(
              onTap: () {},
              child: MyText(
                text: 'View all',
                color: ksecondary,
                size: 11,
                paddingTop: 5,
                paddingRight: 12,
                paddingBottom: 5,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TableHeaderCell extends StatelessWidget {
  final String text;
  const _TableHeaderCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: MyText(
        text: text,
        weight: FontWeight.w600,
        size: 12,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  const _TableCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: MyText(
        text: text,
        weight: FontWeight.w400,
        size: 11,
        textAlign: TextAlign.center,
      ),
    );
  }
}
