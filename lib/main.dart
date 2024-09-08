import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/theme_data.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}



/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Event Date Picker')),
        body: const EventDatePicker(),
      ),
    );
  }
}

class EventDatePicker extends StatefulWidget {
  const EventDatePicker({Key? key}) : super(key: key);

  @override
  _EventDatePickerState createState() => _EventDatePickerState();
}

class _EventDatePickerState extends State<EventDatePicker> {
  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();
  final List<int> years = [2023, 2024, 2025];
  int selectedYear = 2024;
  int selectedMonth = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Event date',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _monthName(selectedMonth),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  setState(() {
                    selectedMonth = selectedMonth > 1 ? selectedMonth - 1 : 12;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  setState(() {
                    selectedMonth = selectedMonth < 12 ? selectedMonth + 1 : 1;
                  });
                },
              ),
              DropdownButton<int>(
                value: selectedYear,
                items: years.map((int year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (int? newYear) {
                  setState(() {
                    if (newYear != null) {
                      selectedYear = newYear;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCalendar(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Confirm date selection
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    int daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;
    int startDayOfWeek = DateTime(selectedYear, selectedMonth, 1).weekday;
    List<Widget> dayWidgets = [];
    // Add empty slots for days before the first day of the month
    for (int i = 0; i < startDayOfWeek - 1; i++) {
      dayWidgets.add(Container());
    }

    // Add the days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime currentDay = DateTime(selectedYear, selectedMonth, day);
      bool isSelected = selectedDate.day == day &&
          selectedDate.month == selectedMonth &&
          selectedDate.year == selectedYear;
      bool isBeforeToday = currentDay.isBefore(today);

      dayWidgets.add(
        GestureDetector(
          onTap: isBeforeToday
              ? null
              : () {
                  setState(() {
                    selectedDate = DateTime(selectedYear, selectedMonth, day);
                  });
                },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.black
                  : isBeforeToday
                      ? const Color(0xffF3F3F3)
                      : Colors.transparent,
              //borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF3F3F3),
                width: .5,
              ),
            ),
            child: Text(
              '$day',
              style: TextStyle(
                color: isBeforeToday
                    ? Colors.grey.shade400
                    : isSelected
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        physics: const NeverScrollableScrollPhysics(),
        children: dayWidgets,
      ),
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
*/