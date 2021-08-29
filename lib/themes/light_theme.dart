import 'package:flutter/material.dart';

import '../utils/Constants.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: MAIN_COLOR, titleTextStyle: TextStyle(fontSize: 14)),
  primaryColor: MAIN_COLOR,
  textTheme: TextTheme(bodyText2: TextStyle(color: MAIN_COLOR)),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[200],
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  iconTheme: IconThemeData(color: MAIN_COLOR),
);
