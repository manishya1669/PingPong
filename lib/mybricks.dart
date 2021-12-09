// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBrick extends StatelessWidget {
  double x;
  double y;
  double brickwidth;
  final thisisenemy;
  MyBrick(
      {required this.x,
      required this.y,
      required this.brickwidth,
      required this.thisisenemy});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * x + brickwidth) / (2 - brickwidth), y),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: thisisenemy ? Colors.deepPurple : Colors.pink[300],
          height: 20,
          width: MediaQuery.of(context).size.width * brickwidth / 2,
        ),
      ),
    );
  }
}
