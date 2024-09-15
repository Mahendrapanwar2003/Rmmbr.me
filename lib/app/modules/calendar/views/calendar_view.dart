import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(isBackButtonVisible: false, appBarTitle: StringConstants.calendar),
          Expanded(child: EventDatePicker()),
        ],
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
                      selectedMonth = selectedMonth > 1 ? selectedMonth - 1 : 12;
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
                      selectedMonth = selectedMonth < 12 ? selectedMonth + 1 : 1;
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
            Text(
              'Upcoming Events',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.px),
            ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.px,
                    horizontal: 14.px,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(24.px),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.px),
                        child: Image.asset(
                          'assets/images/profile_dummy.png',
                          height: 60.px,
                          width: 60.px,
                        ),
                      ),
                      SizedBox(width: 14.px),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,labore et dolore magna aliqua. 😍⚡',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium,

                      ),
                            SizedBox(height: 6.px),
                            Text('a day ago',style: Theme.of(Get.context!).textTheme.titleMedium
                                ?.copyWith(height: 1.2,fontSize: 10.px),)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 80.px)
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
