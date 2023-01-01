 import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:lottie/lottie.dart';
 import 'package:waitech/blocs/basket/basket_bloc.dart';
 import 'package:waitech/models/menu_item_model.dart';
 import 'package:waitech/widgets/restaurant_information.dart';
 import 'package:shared_preferences/shared_preferences.dart';
 import 'package:flutter_animated_button/flutter_animated_button.dart';
 import 'package:animated_icon_button/animated_icon_button.dart';

import '../../models/get_company.dart';
 import '../../models/restaurant_model.dart';

 class HomeRestaurantDetailScreen extends StatelessWidget {
   static const String routeName = '/home_restaurant-detail';

   static Route route({required Data restaurant}) {
     return MaterialPageRoute(
         builder: (_) =>  HomeRestaurantDetailScreen(restaurant: restaurant),
         settings:  RouteSettings(name: routeName));
   }
   final Data restaurant;
   List<String> basketItems=[];

   HomeRestaurantDetailScreen({Key? key, required this.restaurant}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     AnimationController _animationController;
     bool isPlaying = false;
     bool addedSomething = false;
    print(restaurant.name);
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
                       image: NetworkImage(restaurant!.image!),
                       fit: BoxFit.cover),
                   borderRadius: BorderRadius.vertical(
                       bottom: Radius.elliptical(
                           MediaQuery.of(context).size.width, 50)),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                 child: Text(
                   restaurant!.description!,
                   style: Theme.of(context)
                       .textTheme
                       .headlineSmall!
                       .copyWith(color: Theme.of(context).primaryColor),
                 ),
               ),
               _buildMenuItems(restaurant, context)
               //RestaurantInformation(restaurant: restaurant),

             ],
           ),
         )

     );
   }

   Widget _buildMenuItems(
       Data restaurant, BuildContext context) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Column(
           children: restaurant.menu!
               .map((listMenuItem) => Column(
             children:(listMenuItem!
                 .map((menuItem) => Column(
               children: [
                 Container(
                   color: Colors.white,
                   padding: EdgeInsets.symmetric( horizontal: 20),
                   child: ListTile(
                     dense: true,
                     contentPadding: EdgeInsets.zero,
                     title: Text(menuItem.food!, style: Theme.of(context).textTheme.titleLarge ,),
                     trailing: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text('${menuItem.sales_price} \u{20BA}'),
                       ],),
                   ),
                 ),
                 Divider(height: 2)
             ],
           )).toList())
        )).toList(),
         )
       ],
     );
   }
 }
