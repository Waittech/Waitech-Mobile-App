import 'package:flutter/material.dart';
import 'package:waitech/config/app_router.dart';
import 'package:waitech/screens/Home/home_screen.dart';
import 'package:waitech/screens/screens.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery By Bike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: MySplashScreen.routeName,
    );
  }
}
