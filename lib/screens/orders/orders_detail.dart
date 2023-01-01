import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:waitech/models/get_orders_detail.dart';
import 'package:waitech/services/orders_service.dart';

import '../../services/get_order_detail.dart';
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
        body:(ordersDetail!=null) ? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Text(
              '',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child:Column(children: [
                  Padding(padding: EdgeInsets.only(bottom:15),child:Text('${ordersDetail!.company!.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                          shape: BoxShape.rectangle),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 5),
                          itemCount: ordersDetail!.foods!.length,
                          itemBuilder: (context, index) {
                              return Column(
                                  children:[ListTile(
                                    title: Text('${
                                        ordersDetail!.foods![index].name}' ?? ''),
                                    subtitle: Text(
                                        '${ordersDetail!.foods![index].description ??
                                            ''}'),
                                    trailing: Text(
                                        '${ordersDetail!.foods![index].price}₺ '),
                                  ),
                                    Divider(height: 2,color: Colors.grey[600],)
                                  ]
                              );


                          }))

                ],)
            ),
            Container(
              height: 50,
              width: 360,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)
              ),
              alignment: Alignment.center,
              child:emptyNote ? Text('${ordersDetail!.note}') : Text('Sipariş notu bulunmamaktadır.'),
            ),
            Padding(padding:EdgeInsets.only(top:10), child:  Column(
              children: [
                Text('${ordersDetail!.status}'),
                SizedBox(height: 7),
                Text('${ordersDetail!.createdDate}'),
                SizedBox(height: 7),
                Text('${ordersDetail!.createdTime}'),
                SizedBox(height: 7),
                Text('Toplam tutar: ${ordersDetail!.totalPrice}₺',style: TextStyle(fontWeight: FontWeight.bold),)

              ],
            ))


          ]),
        ): Center(
          child: LoadingAnimationWidget.inkDrop(
            color: Color(0xff696cff),

            size: 110,
          ),)
    );
  }
}