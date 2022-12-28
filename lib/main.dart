import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:waitech/blocs/basket/basket_bloc.dart';
import 'package:waitech/blocs/filter/filter_bloc.dart';
import 'package:waitech/config/app_router.dart';
import 'package:waitech/screens/screens.dart';
import 'package:waitech/simple_bloc_observer.dart';

final tokenString = Provider((_) =>'');
final companyId= Provider((ref) => '');
final tableId= Provider((ref) => '');
final baseUrl = Provider((ref) => '');
final basketTotalPrice = Provider((ref) => '');
final notController =Provider((ref) => TextEditingController());
final foodsAmount = Provider((ref) => 0);



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                BasketBloc()
                  ..add(StartBasket(),
                ),
              ),
              BlocProvider(
                create: (context)=>
                FiltersBloc()
                  ..add(FilterLoad()),
              ),
            ],
            child: MaterialApp(
              navigatorKey: Grock.navigationKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  color: Color(0xff696cff),
                ),
                primaryColor: Color(0xff696cff),
                //button rengi ve appbar rengi
                primaryColorDark: Color(0xfff5f5f9),
                //background rengi
                primaryColorLight: Color(0xff697a8d),
                //login ve sign-up page yazı renkleri (gri)
                scaffoldBackgroundColor: Color(0xFFF5F5F9),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: Color(0xFFf5f5f5),
                ),
                fontFamily: 'SFProRegular',
              ),
              title: 'Delivery By Bike',
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: MySplashScreen.routeName,
            ));
  }
}



