import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  static const String routeName = '/qr_code';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => QrCode(), settings: RouteSettings(name: routeName));
  }

  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr'),
      ),
      body: Center(child: Text('Qr')),
    );
  }
}
