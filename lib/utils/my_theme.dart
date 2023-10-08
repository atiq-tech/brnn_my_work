import 'package:ecommerceshope/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final borderRadius = BorderRadius.circular(4);
  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // scaffoldBackgroundColor: primaryColor,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primaryColor),
    colorScheme: const ColorScheme.light(secondary: redColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: redColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: redColor,
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          color: iconThemeColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: iconThemeColor),
      actionsIconTheme: IconThemeData(color: iconThemeColor),
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: ashColor,
    ),
    chipTheme: const ChipThemeData(
      shape: StadiumBorder(),
      side: BorderSide(color: Colors.black54,width: 0.5),
      checkmarkColor: Colors.green,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12, height: 1.83),
      bodyLarge:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
      bodyMedium: TextStyle(fontSize: 14, height: 1.5714),
      labelLarge: TextStyle(fontSize: 16, height: 2, fontWeight: FontWeight.w600),
      // titleLarge: const TextStyle(
      //     fontSize: 16, height: 2, fontWeight: FontWeight.w600),
    ),
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 64), backgroundColor: redColor,foregroundColor: iconThemeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 64), backgroundColor: Colors.transparent,foregroundColor: redColor,
        side: const BorderSide(color: redColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: Color(0x00ffffff),
      selectedLabelStyle: TextStyle(color: redColor, fontSize: 14.0),
      unselectedLabelStyle: TextStyle(color: paragraphColor, fontSize: 12.0),
      selectedItemColor: redColor,
      unselectedItemColor: blackColor,
      showUnselectedLabels: true,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: redColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(color: grayColor),
      labelStyle: TextStyle(color: grayColor, fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: Colors.red)
      ),
      fillColor: primaryColor,
      filled: true,
      focusColor: blackColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: blackColor,
      selectionColor: blackColor,
      selectionHandleColor: blackColor,
    ),
  );
}
