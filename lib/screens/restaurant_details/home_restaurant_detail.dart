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

       floatingActionButton: FloatingActionButton(
         backgroundColor: Theme.of(context).primaryColor,
           onPressed: () {},
           child: IconButton(
               onPressed: () { Navigator.pushNamed(context, '/qr_code'); },
               icon:Icon(Icons.qr_code_scanner_sharp, color: Colors.white,   )
           )
       ),
         appBar: AppBar(
           foregroundColor: Theme.of(context).primaryColor,
           backgroundColor: Colors.transparent.withOpacity(0.2),
           elevation: 0,
         ),

         extendBodyBehindAppBar: true,
         body: SingleChildScrollView(
           child:  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Container(

                 height: 230,
                 decoration: BoxDecoration(
                   color: Colors.black12,
                   image: DecorationImage(

                       image: NetworkImage(restaurant!.image!),
                       fit: BoxFit.fitHeight),
                   borderRadius: BorderRadius.vertical(
                       bottom: Radius.elliptical(
                           MediaQuery.of(context).size.width, 50)),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                 child: Text(
                   restaurant!.name!,
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
               children: [
                 Padding(
                   padding: EdgeInsets.symmetric(vertical: 15),
                   child:  Text(listMenuItem[0].category!,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18)),
                 ),
                 Column(
                   children: listMenuItem!
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
                               Text('${menuItem.sales_price} \u{20BA}',style:TextStyle(fontSize:16)),
                             ],),
                         ),
                       ),
                       Divider(height: 2)
                     ],
                   )).toList(),
                 )
               ]
           )).toList(),
         )
       ],
     );
   }
 }
