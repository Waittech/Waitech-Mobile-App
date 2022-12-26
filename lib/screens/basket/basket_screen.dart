import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grock/grock.dart';
import 'package:waitech/blocs/basket/basket_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waitech/main.dart';
import 'package:waitech/models/basket_model.dart';
import 'package:waitech/models/menu_list.dart';
import 'package:waitech/models/order_model.dart';
import 'package:waitech/models/restaurant_model.dart';

import '../../models/menu_item_model.dart';

class BasketScreen extends ConsumerStatefulWidget {
  static const String routeName = '/basket';

  const BasketScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  ConsumerState<BasketScreen> createState() => _BasketState();
}

class _BasketState extends ConsumerState<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sepet'),
          actions: <Widget>[
            BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
              if (state is BasketLoading) {
                return const Center(
                  child: Text('ürün yok'),
                );
              }
              if (state is BasketLoaded) {
                return IconButton(
                    onPressed: () {
                      for (int i = 0;
                          i <
                              state.basket
                                  .itemQuantity(state.basket.items[0].id)
                                  .length;
                          i++) {
                        context.read<BasketBloc>().add(RemoveItem(state.basket
                            .itemQuantity(state.basket.items)
                            .keys
                            .elementAt(i)));
                      }
                    },
                    icon: Icon(Icons.delete));
              } else {
                return Text('ürün yok');
              }
            })
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is BasketLoaded &&
                        state.basket
                            .itemQuantity(state.basket.items)
                            .isNotEmpty) {
                      return Row(
                        children: [
                          Text('Toplam Fiyat: ${state.basket.totalString}₺',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          OutlinedButton(
                            onPressed: () {

                              List<int> id=[];
                              List <int> amount=[];
                             /* print(state.basket.itemQuantity(state.basket.items).length);//kaç çeşit ürün olduğunu veriyor
                              print(BasketLoaded(basket: Basket(items: state.basket.items)).basket.items[0].id);//i değerindeki food_id veriyor
                              print(state.basket.itemQuantity(state.basket.items).entries.elementAt(0).value);//i değerinde kaç tane ürün olduğunu veriyor*/
                              print(state.basket.itemQuantity(state.basket.items).keys.length);
                              for(int i=0;i<state.basket.itemQuantity(state.basket.items).length;i++){
                                amount.add(state.basket.itemQuantity(state.basket.items).entries.elementAt(i).value);
                                print('${amount} amount değeri');

                              }
                              int sum = 0;
                              for (int number in amount) {
                                sum += number;
                              }
                              for(int i = 0; i<sum;i++){
                                id.add(BasketLoaded(basket: Basket(items: state.basket.items)).basket.items[i].id);
                              }
                              Set<int> set = id.toSet();
                              List<int> deduplicated = set.toList();
                              print('${deduplicated} food_id');
                              HashMap<int,int> hashMap =HashMap();
                              for(int i=0;i<amount.length;i++){
                                hashMap[deduplicated[i]]=amount[i];
                                print(hashMap);
                              }
                              String price = state.basket.totalString
                                  .replaceAll('.00', '');

                              postOrder(price,hashMap);

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Theme.of(context).canvasColor,
                              fixedSize: const Size(170, 40),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  print(state.basket
                                      .itemQuantity(state.basket.items[0].id));

                                },
                                child: Text("Devam".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white))),
                          )
                        ],
                      );
                    } else {
                      return Text('');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Ürünler',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Segoe_UI',
                  color: Colors.black38,
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                if (state is BasketLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                      ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Text(
                                'Sepetinizde ürün bulunmamaktadır',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.actor(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                children: [
                                  Text(
                                    '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value} x',
                                    style: TextStyle(
                                      fontFamily: 'Monoton-Regular',
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                          style: TextStyle(
                                            fontFamily: 'Monoton-Regular',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}₺',
                                          style: TextStyle(
                                            fontFamily: 'Monoton-Regular',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>()
                                            ..add(RemoveItem(state.basket
                                                .itemQuantity(
                                                    state.basket.items)
                                                .keys
                                                .elementAt(index)));
                                        },
                                        icon: Icon(Icons.remove,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>()
                                            ..add(AddItem(state.basket
                                                .itemQuantity(
                                                    state.basket.items)
                                                .keys
                                                .elementAt(index)));
                                        },
                                        icon: Icon(Icons.add,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                } else {
                  return Text('something wrong');
                }
              }),
              const SizedBox(height: 20),
              SizedBox(
                  height: 300,
                  child: TextField(
                    controller: ref.read(notController),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Not Bırakın',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                  ))
            ])));
  }

  Future<OrderModel> postOrder(String price,HashMap<int,int> hashMap) async {
    final response = await http.post(
      Uri.parse(
          'https://amazing-gauss.213-142-157-85.plesk.page/api/orders?total_price=$price'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'table_id': ref.read(tableId).toString(),
        'company_id': ref.read(companyId).toString(),
        'note': ref.watch(notController).text,
        'total_price': price,
        'user_id':'1',
        'foods[0][foods_id]':'1',
        'foods[0][amount]':'2',


      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      log('burda');
      return OrderModel.fromJson(jsonDecode(response.body));
    }
    if (response.statusCode == 200) {
      return OrderModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
