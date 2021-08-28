import 'package:flutter/material.dart';

class AlarmItem extends StatelessWidget {
  const AlarmItem({Key? key, required this.hour, required this.enabled})
      : super(key: key);

  final String hour;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                hour,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
            Switch.adaptive(
              value: enabled,
              onChanged: (value) {},
              activeColor: Color(0xff65d1ba),
            )
          ]),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  'Sun',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  'Mon',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  'Tue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white30,
          )
        ],
      ),
    );
  }
}
