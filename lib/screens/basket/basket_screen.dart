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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sepet'),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.delete))
          ],
        ),
      body: SafeArea(
        child: Row(
          children: [
            Text('Sepet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Segoe_IU',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),



    );
  }
}
