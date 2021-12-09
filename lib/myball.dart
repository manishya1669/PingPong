// ignore_for_file: must_be_immutable

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  double x;
  double y;
  bool gamehasStarted;

  MyBall(
      {Key? key,
      required this.x,
      required this.y,
      required this.gamehasStarted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (gamehasStarted) {
      return Container(
        alignment: Alignment(x, y),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          width: 14,
          height: 14,
        ),
      );
    } else {
      return Container(
        alignment: Alignment(x, y),
        child: AvatarGlow(
          endRadius: 60.0,
          child: Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                height: 30,
                width: 30,
              ),
              radius: 7.0,
            ),
          ),
        ),
      );
    }
  }
}
