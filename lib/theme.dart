import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: KAccentColor,
    primaryColor: KPrimaryColor,
    fontFamily: "Muli",
    //type of extra font
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder(),
      //this to make shape when enter data in form
      focusedBorder: outlineInputBorder(),
      border: outlineInputBorder(),
    ),
    primarySwatch: Colors.blue,

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: KTextColor),
    gapPadding: 5,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: KTextColor),
    bodyText2: TextStyle(color: KTextColor),
  );
}
