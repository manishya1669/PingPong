// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//import ' googlSheet.dart';
import 'homepage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // GoogleSheetApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
