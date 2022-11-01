import 'package:flutter/material.dart';
import 'package:waitech/config/app_router.dart';

import 'package:waitech/screens/screens.dart';
import 'package:waitech/screens/login_sign-up/login_page.dart';
import 'package:waitech/screens/login_sign-up/sign_up_page.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 105, 150, 255),
        primaryColorDark: Color.fromARGB(255, 87, 14, 245),
        primaryColorLight: Color(0xFFBDBFFF),
        scaffoldBackgroundColor: Color(0xFFF5F5F9),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFf5f5f5),
        ),
        fontFamily: 'SFProRegular',
      ),
      title: 'Delivery By Bike',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: MySplashScreen.routeName,
    );
  }
}
