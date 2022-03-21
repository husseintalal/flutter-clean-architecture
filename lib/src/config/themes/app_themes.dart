import 'package:flutter/material.dart';

///! This file contains all [Themes]
///! That will be used in our [main.dart]

class AppThemes{

  static ThemeData get myTheme{
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.indigo,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          )
        ),
      )
    );
  }

}