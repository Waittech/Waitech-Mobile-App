import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:waitech/blocs/basket/basket_bloc.dart';
import 'package:waitech/models/menu_item_model.dart';
import 'package:waitech/widgets/restaurant_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/restaurant_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurant-detail';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
        builder: (_) =>  RestaurantDetailScreen(restaurant: restaurant),
        settings: const RouteSettings(name: routeName));
  }
  final Restaurant restaurant;
  List<String> basketItems=[];


   RestaurantDetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool addedSomething = false;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child:GestureDetector(
                   /* onTap: (){
                      if(addedSomething==true){
                        _controller.forward();
                      }else{

                      }

                    },*/

             child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_xkraio55.json',height: 70),
                  )),
                OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).canvasColor,
                    fixedSize: const Size(120, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () { Navigator.pushNamed(context, '/basket'); },
                      child:Center(child:Text(
                        "Sepet".toUpperCase(),
                        style: const TextStyle(fontSize: 20,color: Colors.white)))
                  ),
                )
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                ),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                },
                itemCount: restaurant.tags.length,
              )

              /* ListView.builder(
                itemCount: ,
                itemBuilder:  (context, index) {}) */
            ],
          ),
        )

        );
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(menuItem.name, style: Theme.of(context).textTheme.titleLarge ,),
                          subtitle: Text(menuItem.description),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Text('${menuItem.price} \u{20BA}'),
                              BlocBuilder<BasketBloc, BasketState>(builder: (context, state){
                                return IconButton(icon: Icon(Icons.add_circle, color: Theme.of(context).primaryColor,),
                                  onPressed: () {
                                  context.read<BasketBloc>()
                                      ..add(AddItem(menuItem));

                                },
                                );
                              })

                          ],),
                        ),
                      ),
                      Divider(height: 2)
                    ],
                  )).toList(),
        ),
      ],
    );
  }
}
