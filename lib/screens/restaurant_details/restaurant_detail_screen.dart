import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurant-detail';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const RestaurantDetailScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RestaurantDetail')),
      body: ElevatedButton(
        child: Text('Home Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
