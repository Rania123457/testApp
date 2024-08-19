import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import 'package:hexcolor/hexcolor.dart';

// ThemeData darkTheme = ThemeData(
//   primaryColor: defaultColor,
//   scaffoldBackgroundColor: Colors.white,
//   primarySwatch: defaultColor as MaterialColor,
//   appBarTheme: AppBarTheme(
//     titleSpacing: 20.0,
//     color: HexColor('333739'),
//     elevation: 0,
//     backwardsCompatibility: false,
//     systemOverlayStyle: const SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       statusBarBrightness: Brightness.light,
//       statusBarIconBrightness: Brightness.light,
//     ),
//     titleTextStyle: const TextStyle(
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: defaultColor,
//     unselectedItemColor: Colors.grey,
//     backgroundColor: HexColor('333739'),
//     elevation: 20.0,
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: HexColor('333739'),
//   ),
//   textTheme: const TextTheme(
//     bodyText1: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//     ),
//   ),
//   fontFamily: 'Jannah',
// );

ThemeData lightTheme = ThemeData(
  iconTheme: IconThemeData(
    color: defaultColor,
  ),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: 'Cairo',
    ),
    toolbarTextStyle: TextStyle(
      fontFamily: 'Cairo',
      color: Colors.black,
    ),
    titleSpacing: 20.0,
    color: Colors.white,
    elevation: 0,
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark),
    // titleTextStyle: TextStyle(
    //   color: Colors.black,
    //   fontSize: 20.0,
    //   fontWeight: FontWeight.bold,
    // ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 20.0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  // textTheme: TextTheme(
  //   bodyText1: TextStyle(
  //     fontSize: 24.0,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.black,
  //   ),
  // ),
  fontFamily: 'Cairo',
);
