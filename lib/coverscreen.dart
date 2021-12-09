// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  bool gamehasstarted;
  CoverScreen({Key? key, required this.gamehasstarted}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.2),
      child: const Text(
        " T A P   T O   S T A R T",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
