import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:waitech/config/app_router.dart';

import 'package:waitech/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Grock.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Color(0xff696cff),
        ),
        primaryColor: Color(0xff696cff), //button rengi ve appbar rengi
        primaryColorDark: Color(0xfff5f5f9) , //background rengi
        primaryColorLight: Color(0xff697a8d), //login ve sign-up page yazı renkleri (gri)
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
