import 'package:flutter/material.dart';
import 'package:waitech/models/get_orders_detail.dart';
import 'package:waitech/services/orders_service.dart';

import '../../services/get_orders_detail.dart';
import 'orders_screen.dart';


class OrdersDetailScreen extends StatefulWidget {
  final int orderId;
  static const String routeName = '/orders_detail';

  const OrdersDetailScreen({Key? key, required this.orderId}) : super(key: key);

  static Route route({required int orderId}) {
    return MaterialPageRoute(
        builder: (_) => OrdersDetailScreen(orderId: orderId),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  final service = GetOrdersDetailService();
  final model = GetOrdersDetail();
  Data? ordersDetail;
  final emptyNote=false;

  bool emptyDetail = true;

  @override
  void initState() {
    super.initState();
    service.showOrder(widget.orderId).then((value) {
      if (value.data != null) {
        setState(() {
          ordersDetail = value!.data;
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
            '',
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
                      itemCount: ordersDetail!.foods!.length,
                      itemBuilder: (context, index) {
                        if (ordersDetail!.note == null) {
                          emptyNote == true;
                        }
                        return ListTile(
                          title: Text('${
                              ordersDetail!.foods![index].name}' ?? ''),
                          subtitle: Text(
                              '${ordersDetail!.foods![index].description ??
                                  ''}'),
                          trailing: Text(
                              '${ordersDetail!.foods![index].price ?? ''}'),
                        );
                      }))
          ),
          Container(
            height: 50,
            width: 360,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.center,
            child:emptyNote ? Text('${ordersDetail!.note}') : Text('Sipariş notu bulunmamaktadır.'),
          ),
          Text('${ordersDetail!.createdDate}'),
          Text('${ordersDetail!.createdTime}'),
          Text('Toplam tutar: ${ordersDetail!.totalPrice}',style: TextStyle(fontWeight: FontWeight.bold),)
        ]));
  }
}
