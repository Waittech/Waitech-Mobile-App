import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sepet')),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            'Sepet',
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
