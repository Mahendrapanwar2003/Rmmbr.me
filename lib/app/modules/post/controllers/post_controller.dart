import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostController extends GetxController {
  final count = 0.obs;

  final realCheckSelectedValue = ''.obs;

  List realCheckList = [
    'Edited media',
    'Real and un-edited media',
    'Wholly or partially computer-generated media',
  ];

  final classificationSelectedValue = ''.obs;

  List classificationList = [
    'No nudity, sex,  violence or weapons',
    'Contains nudity, sex, violence or weapons',
  ];

  @override
  void onInit() {
    super.onInit();
    //showEventDialog();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnRealCheckItem({required int index}) {
    if (realCheckSelectedValue.value.contains(realCheckList[index])) {
      realCheckSelectedValue.value = '';
    } else {
      realCheckSelectedValue.value = realCheckList[index];
    }
    count.value++;
  }

  void clickOnClassificationItem({required int index}) {
    if (classificationSelectedValue.value.contains(classificationList[index])) {
      classificationSelectedValue.value = '';
    } else {
      classificationSelectedValue.value = classificationList[index];
    }
    count.value++;
  }

  void showEventDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.px)),child: EventDatePicker()),
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
  DateTime selectedDate = DateTime.now(); // Defaults to today
  DateTime today = DateTime.now();
  final List<int> years = [2023, 2024, 2025, 2026, 2027, 2028];
  int selectedYear = DateTime.now().year; // Default to current year
  int selectedMonth = DateTime.now().month; // Default to current month

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _monthName(selectedMonth),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(width: 10.px),
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 14,
                  ),
                  onTap: () {
                    setState(() {
                      selectedMonth =
                          selectedMonth > 1 ? selectedMonth - 1 : 12;
                      if (selectedMonth == 12) {
                        selectedYear--;
                      }
                    });
                  },
                ),
                SizedBox(width: 6.px),
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                  onTap: () {
                    setState(() {
                      selectedMonth =
                          selectedMonth < 12 ? selectedMonth + 1 : 1;
                      if (selectedMonth == 1) {
                        selectedYear++;
                      }
                    });
                  },
                ),
                Spacer(),
                Container(
                  height: 28.px,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8.px),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // The position of the shadow (x, y)
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.px),
                    child: DropdownButton<int>(
                      value: selectedYear,
                      items: years.map((int year) {
                        return DropdownMenuItem<int>(
                          value: year,
                          child: Text(
                            year.toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        );
                      }).toList(),
                      underline: const SizedBox(),
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 18.px,
                      ),
                      borderRadius: BorderRadius.circular(6.px),
                      padding: EdgeInsets.zero,
                      onChanged: (int? newYear) {
                        setState(() {
                          if (newYear != null) {
                            selectedYear = newYear;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCalendar(),
            SizedBox(height: 10.px),
          ],
        ),
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
              borderRadius: BorderRadius.circular(6.px),
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
          color: const Color(0xffD5D5D5),
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
