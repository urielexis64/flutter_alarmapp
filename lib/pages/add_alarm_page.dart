import 'package:alarm_app/widgets/circle_day.dart';
import 'package:flutter/material.dart';

class AddAlarmPage extends StatefulWidget {
  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  late TimeOfDay _selectedTime;
  late ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = TimeOfDay(
      hour: 12,
      minute: 30,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b2c57),
      appBar: AppBar(
        backgroundColor: Color(0xff1b2c57),
        title: Column(children: [
          Icon(Icons.alarm_add, color: Color(0xff65d1ba)),
          Text(
            'Add alarm',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff65d1ba),
            ),
          )
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 60),
            GestureDetector(
              child: Text(
                _selectedTime.format(context),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _selectTime(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleDay(day: 'Mon', context: context, isSelected: true),
                CircleDay(day: 'Tue', context: context, isSelected: true),
                CircleDay(day: 'Wed', context: context, isSelected: true),
                CircleDay(day: 'Thu', context: context, isSelected: true),
                CircleDay(day: 'Fri', context: context, isSelected: true),
                CircleDay(day: 'Sat', context: context, isSelected: false),
                CircleDay(day: 'Sun', context: context, isSelected: false),
              ],
            ),
            SizedBox(height: 60),
            Divider(color: Colors.white30),
            ListTile(
              leading: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              title: Text('Alarm Notification',
                  style: TextStyle(color: Colors.white)),
            ),
            Divider(color: Colors.white30),
            ListTile(
              leading: Icon(
                Icons.check_box,
                color: Colors.white,
              ),
              title: Text('Vibrate', style: TextStyle(color: Colors.white)),
            ),
            Divider(color: Colors.white30),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child:
            Icon(Icons.delete, size: 20, color: Theme.of(context).accentColor),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
