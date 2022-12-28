import 'package:flutter/material.dart';
import 'package:waitech/models/restaurant_model.dart';
import 'package:waitech/screens/Home/home_screen.dart';
import 'package:waitech/screens/basket/basket_screen.dart';
import 'package:waitech/screens/checkout/checkout_screen.dart';
import 'package:waitech/screens/delivery_time/delivery_time_screen.dart';
import 'package:waitech/screens/filter/filter_screen.dart';
import 'package:waitech/screens/location/location_screen.dart';
import 'package:waitech/screens/login_sign-up/sign_up_page.dart';
import 'package:waitech/screens/qr_code/qr_code_screen.dart';
import 'package:waitech/screens/restaurant_details/restaurant_detail_screen.dart';
import 'package:waitech/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:waitech/screens/voucher/voucher_screen.dart';
import 'package:waitech/screens/login_sign-up/login_page2.dart';
import 'package:waitech/screens/basket/pay_screen.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
import '../screens/restaurant_details/home_restaurant_detail.dart';
import '../screens/splash/splashScreen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    ('The Router is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailScreen.routeName:
        return RestaurantDetailScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(restaurants: []);
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case MySplashScreen.routeName:
        return MySplashScreen.route();
      case SignUpPage.routeName:
        return SignUpPage.route();
      case QRCodeScanner.routeName:
        return QRCodeScanner.route();
      // case QrCode.routeName:
      //   return QrCode.route();
      case TabBarIndex.routeName:
        return TabBarIndex.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case PayScreen.routeName:
        return PayScreen.route();
      case HomeRestaurantDetailScreen.routeName:
        return HomeRestaurantDetailScreen.route(
            restaurant: settings.arguments as Restaurant);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('error')),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
