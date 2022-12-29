import 'package:flutter/material.dart';
import 'package:waitech/services/orders_service.dart';

import '../../models/get_order_model.dart';
import '../../models/get_order_model.dart';

class OrdersDetailScreen extends StatefulWidget {
  static const String routeName = '/orders_detail';

  const OrdersDetailScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => OrdersDetailScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  final service = OrderService();
  final model = GetOrderModel();
  List<Data?> orders = [];

  @override
  void initState() {
    super.initState();
    service.createOrder().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          orders = value.data!;
        });
      } else {
        throw Exception('order data null geldi');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sipariş Detay')),
        body: Column(children: [
          Text(
            'Restaurant Adı',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      shape: BoxShape.rectangle),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10),
                      itemCount: orders[1]!.foods!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${orders[1]!.foods![index].name}'),
                          subtitle: Text('${orders[1]!.foods![index].description}'),
                          trailing: Text('${orders[1]!.foods![index].price}'),
                        );
                      }))),
          Text('Toplam tutar: ${orders[1]!.totalPrice}')
        ]));
  }
}
