// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mc_utils/mc_utils.dart';

class TextFieldDateTimePicker extends StatefulWidget {
  final Function(DateTime) onTap;
  final String title;
  final double? width;
  DateTime? initDatetime;
  final EdgeInsetsGeometry? padding;
  TextFieldDateTimePicker(
      {super.key,
      required this.onTap,
      required this.title,
      this.width,
      this.initDatetime,
      this.padding});

  @override
  State<TextFieldDateTimePicker> createState() =>
      _TextFieldDateTimePickerState();
}

class _TextFieldDateTimePickerState extends State<TextFieldDateTimePicker> {
  String? dateTime;
  @override
  void initState() {
    super.initState();
    dateTime = DateFormat('EEE, MMM d, yyyy hh:mm a')
        .format(widget.initDatetime ?? DateTime.now());
    print(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return McCardItem(
        onTap: () {
          try {
            McDateAndTimePicker()
                .selectDateAndTime(
              context: context,
              materialDatePickerFirstDate: DateTime(2000),
              materialDatePickerInitialDate:
                  widget.initDatetime ?? DateTime.now(),
              materialDatePickerInitialEntryMode: DatePickerEntryMode.calendar,
              materialDatePickerLastDate: DateTime(2099),
              // materialDatePickerLocale: Get.deviceLocale,
              materialInitialTime: TimeOfDay.now(),
              materialTimePickerUse24hrFormat: false,
              materialTimePickerInitialEntryMode: TimePickerEntryMode.dial,
              preferredDateFormat: DateFormat.yMMMEd(),
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoTimePickerUse24hFormat: false,
              cupertinoTimePickerMinuteInterval: 1,
              cupertinoDateInitialDateTime: DateTime.now(),
            )
                .then((value) {
              if (value == null) {
                return;
              } else {
                DateFormat format = DateFormat('EEE, MMM d, yyyy hh:mm a');

                // Parse the date string
                DateTime dateTime1 = format.parse(value.toString());
                widget.onTap(dateTime1);
                setState(() {
                  dateTime = value;
                });
              }
            });
          } catch (e) {}
        },
        width: widget.width,
        color: Colors.white,
        padding: widget.padding,
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            McText(
              txt: widget.title,
              fontSize: 14,
            ),
            McText(
              txt: dateTime ?? "",
              fontSize: 12,
            )
          ],
        ));
  }
}
