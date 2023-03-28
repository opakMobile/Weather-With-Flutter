import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loadingScreen.dart';
import 'package:flutter_application_1/screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hava Durumu',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
