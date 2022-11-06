import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const DeliveryTimeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const DeliveryTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeliveryTime')),
      body: ElevatedButton(
        child: const Text('Home Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
