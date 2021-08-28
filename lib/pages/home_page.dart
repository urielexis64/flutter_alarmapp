import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String _timeString = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _timeString = _formatDateTime(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (timer) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) =>
      DateFormat('hh:mm').format(dateTime);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).accentColor,
                indicatorWeight: 4,
                tabs: [
                  Tab(icon: Icon(Icons.access_time), text: 'Clock'),
                  Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
                  Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
                  Tab(icon: Icon(Icons.timer), text: 'Stopwatch')
                ]),
          ),
          body: Container(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: CustomPaint(
                            painter: ClockPainter(),
                            child: Container(
                              height: 300,
                            )),
                      ),
                      Text(
                        _timeString,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('asdas'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('asdas'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('asdas'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Global angle
    final angle = Vector.radians(-90);
    final double r =
        sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + angle;
    final shiftX = r * cos(beta);
    final shiftY = r * sin(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;

    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round;
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, (size.width / 3) - 5, paint);

    // DateTime
    DateTime now = DateTime.now();

    // Hours Line
    final hoursP1 = center;
    double hoursDegree = 360 / 12 * (now.hour - 12);
    double x =
        (size.width / 2) + (size.width / 3) * cos(Vector.radians(hoursDegree));
    double y = (size.height / 2) +
        (size.height / 3) * sin(Vector.radians(hoursDegree));
    final hoursP2 = Offset(x, y);
    paint.strokeWidth = 5;
    paint.color = Color(0xff353570);
    canvas.drawLine(hoursP1, hoursP2, paint);

    // Minutes Line
    final minutesP1 = center;
    double minutesDegree = 360 / 60 * now.minute;
    x = (size.width / 2) +
        (size.width / 3) * cos(Vector.radians(minutesDegree));
    y = (size.height / 2) +
        (size.height / 3) * sin(Vector.radians(minutesDegree));
    final minutesP2 = Offset(x, y);
    paint.strokeWidth = 3;
    paint.color = Color(0xff354569);
    canvas.drawLine(minutesP1, minutesP2, paint);

    // Seconds Line
    final secondsP1 = center;
    double secondsDegree = 360 / 60 * now.second;
    x = (size.width / 2) +
        (size.width / 3) * cos(Vector.radians(secondsDegree));
    y = (size.height / 2) +
        (size.height / 3) * sin(Vector.radians(secondsDegree));
    final secondsP2 = Offset(x, y);
    paint.strokeWidth = 2;
    paint.color = Color(0xff65d1ba);
    canvas.drawLine(secondsP1, secondsP2, paint);

    for (var i = 0; i < 60; i++) {
      // Calculate line position
      double minute = 360 / 60 * i;

      final divisibleByFive = i % 5 == 0;
      // Set style every 5 minutes
      paint.color = divisibleByFive ? Color(0xff65d1ba) : Colors.white;
      paint.strokeWidth = divisibleByFive ? 4 : 1;
      int distance = divisibleByFive ? 10 : 15;
      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(Vector.radians(minute));
      double y1 = (size.height / 2) +
          (size.width / 3 + distance) * sin(Vector.radians(minute));

      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) +
          (size.width / 3 + 30) * cos(Vector.radians(minute));
      double y2 = (size.height / 2) +
          (size.width / 3 + 30) * sin(Vector.radians(minute));

      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
