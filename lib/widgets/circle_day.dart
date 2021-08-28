import 'package:flutter/material.dart';

class CircleDay extends StatelessWidget {
  const CircleDay(
      {Key? key,
      required this.day,
      required this.context,
      required this.isSelected})
      : super(key: key);

  final String day;
  final BuildContext context;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).accentColor : Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(50),
      ),
      child: Padding(
          padding: EdgeInsets.all(6),
          child: Center(
              child: Text(day,
                  style: TextStyle(color: Colors.white, fontSize: 20)))),
    );
  }
}
