import 'package:alarm_app/pages/add_alarm_page.dart';
import 'package:alarm_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/add-alarm': (context) => AddAlarmPage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xff1b2c57),
        accentColor: Color(0xff65d1ba),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
