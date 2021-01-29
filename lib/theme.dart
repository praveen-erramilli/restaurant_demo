import 'package:flutter/material.dart';

import 'constants.dart';

class MyTheme{

  ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: kPrimaryColor,
      accentColor: kSecondaryColor,
      fontFamily: "Muli",
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: elevatedButtonTheme(),
      textButtonTheme: textButtonTheme(),
    );
  }

  TextButtonThemeData textButtonTheme() {
    return TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor)));
  }

  ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          elevation: MaterialStateProperty.all(10.0),
          minimumSize: MaterialStateProperty.all<Size>(Size(100, 45))),
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
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
}