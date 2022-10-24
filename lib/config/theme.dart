import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Color(0xFF6A6EFF),
    primaryColorDark: Color(0xFF1E24FC),
    primaryColorLight: Color(0xFFBDBFFF),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xFFf5f5f5),
    ),
    fontFamily: 'SFProRegular',
  );
}
