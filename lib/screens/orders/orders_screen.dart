import 'package:flutter/material.dart';
import 'package:waitech/services/orders_service.dart';

import '../../models/get_order_model.dart';
import '../../models/get_order_model.dart';


class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => OrdersScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final service = OrderService();
  final model =GetOrderModel();
  List<Data?> orders =[];

  @override
  void initState(){
    super.initState();
    service.createOrder().then((value){
      if(value != null && value.data != null) {
        setState(() {
          orders = value.data!;
        });
      }
      else{
        throw Exception('order data null geldi');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
        Text('Siparişlerim')),
      body:SafeArea(
        child:ListView.builder(
          padding: EdgeInsets.only(top:10),
          itemCount: orders.length,
            itemBuilder:(context,index){
            return InkWell(
              onTap:(){ Navigator.pushNamed(context, '/orders_detail', arguments: orders[index] );},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${orders[index]!.company!.description}', style: Theme.of(context).textTheme.headline5),
                      Text('Sipariş Tarihi:${orders[index]!.createdDate}'),
                      Text('Sepet tutarı: ${orders[index]!.totalPrice}'),
                    ],
                  ),
                ),
              )
            );
            }),
      )

    );
  }
}
