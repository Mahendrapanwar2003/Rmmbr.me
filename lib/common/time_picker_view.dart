import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerView {
  Future<TimeOfDay?> timePickerView({
    required Color color,
  }) {
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFFFF8E1),
        100: const Color(0xFFFFECB3),
        200: const Color(0xFFFFE082),
        300: const Color(0xFFFFD54F),
        400: const Color(0xFFFFCA28),
        500: color,
        600: const Color(0xFFFFB300),
        700: const Color(0xFFFFA000),
        800: const Color(0xFFFF8F00),
        900: const Color(0xFFFF6F00),
      },
    );
    return showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            primarySwatch: materialColor,
            // cardColor:  color,
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}

class DatePickerView {
  Future<DateTime?> datePickerView({
    required Color color,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFFFF8E1),
        100: const Color(0xFFFFECB3),
        200: const Color(0xFFFFE082),
        300: const Color(0xFFFFD54F),
        400: const Color(0xFFFFCA28),
        500: color,
        600: const Color(0xFFFFB300),
        700: const Color(0xFFFFA000),
        800: const Color(0xFFFF8F00),
        900: const Color(0xFFFF6F00),
      },
    );
    return showDatePicker(
      context: Get.context!,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            primarySwatch: materialColor,
            // cardColor:  color,
          ),
          child: child ?? const SizedBox(),
        );
      },
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
    );
  }
}
