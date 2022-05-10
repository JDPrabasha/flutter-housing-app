import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/screens/LandingScreen.dart';
import 'package:housing_app/screens/HouseScreen.dart';
import 'package:housing_app/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Housing App',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: 'Montserrat',
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE)),
      home: HouseScreen(),
    );
  }
}
