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
                        child: Text('Clock'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Alarm'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Timer'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Stopwatch'),
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
