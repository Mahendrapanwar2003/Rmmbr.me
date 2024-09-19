import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickDate {
  static Future<DateTime?> pickDateView({
    required Color color,
  }) {
    // Creating a MaterialColor from the given color
    MaterialColor materialColor = MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFFFF8E1),
        100: const Color(0xFFFFECB3),
        200: const Color(0xFFFFE082),
        300: const Color(0xFFFFD54F),
        400: const Color(0xFFFFCA28),
        500: color, // Use the passed color
        600: const Color(0xFFFFB300),
        700: const Color(0xFFFFA000),
        800: const Color(0xFFFF8F00),
        900: const Color(0xFFFF6F00),
      },
    );

    return showDatePicker(
      context: Get.context!, // Ensure context is not null
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness, // Use current theme brightness
            primarySwatch: materialColor, // Apply the custom color scheme
          ),
          child: child ?? const SizedBox.shrink(), // Ensure child is properly handled
        );
      },
      keyboardType: TextInputType.text,
      initialDate: DateTime(2000), // Set a default initial date (adjust as needed)
      firstDate: DateTime(1960), // Start date range
      lastDate: DateTime.now(),  // End date range (current date)
    );
  }

}
