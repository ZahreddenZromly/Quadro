import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailabilityPage extends StatefulWidget {
  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  bool isAvailable = false;
  String selectedWorkingHours = 'Select working hours';
  String selectedDaysOff = 'Select days off';
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  // Sample data for working hours and days off slice menus
  List<String> workingHoursOptions = [
    '9 AM - 5 PM',
    '8 AM - 4 PM',
    '10 AM - 6 PM',
  ];

  List<String> daysOffOptions = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Availability',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Availability Status:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                Switch(
                  inactiveThumbColor:Colors.teal,
                  activeColor: Colors.teal,
                  value: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text('Working Hours:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ListTile(
                  title: Text(selectedWorkingHours),
                  trailing: Icon(Icons.arrow_drop_down),
                  onTap: () async {
                    final selectedOption = await _showSliceMenu(context, workingHoursOptions);
                    if (selectedOption != null) {
                      setState(() {
                        selectedWorkingHours = selectedOption;
                      });
                    }
                  },
                ),
                SizedBox(height: 16.0),
                Text('Days Off:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                TableCalendar(
                  focusedDay: focusedDay,
                  firstDay: DateTime(DateTime.now().year - 1),
                  lastDay: DateTime(DateTime.now().year + 1),
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      this.selectedDay = selectedDay;
                      if (!daysOffOptions.contains(selectedDay)) {
                        daysOffOptions.remove(selectedDay);;
                      } else {
                        daysOffOptions.add(selectedDay.toString());
                      }
                    });
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  calendarStyle: CalendarStyle(

                    selectedDecoration: BoxDecoration(
                      color: Colors.teal, // Change the color here
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Change the background color here
                      elevation: 10,
                    ),
                    onPressed: () {
                      // Handle the submission of availability information
                      // You can send this information to a backend server for storage
                      // or update the local database.
                      print('Availability Status: $isAvailable');
                      print('Working Hours: $selectedWorkingHours');
                      print('Days Off: $selectedDaysOff');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Update Availability',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> _showSliceMenu(BuildContext context, List<String> options) async {
  return await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView(
        shrinkWrap: true,
        children: options.map((String option) {
          return ListTile(
            title: Text(option),
            onTap: () {
              Navigator.pop(context, option);
            },
          );
        }).toList(),
      );
    },
  );
}