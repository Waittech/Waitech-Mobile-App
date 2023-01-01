import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:waitech/blocs/basket/basket_bloc.dart';
import 'package:waitech/models/menu_item_model.dart';
import 'package:waitech/screens/basket/basket_screen.dart';
import 'package:waitech/widgets/restaurant_information.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import '../../models/get_company.dart';
import '../../models/restaurant_model.dart';
import '../../services/company_service.dart';
import '../../services/single_company_service.dart';
import '../profile/profile_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  static const String routeName = '/restaurant-detail';

  final int companyId;


  static Route route({required int companyId}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantDetailScreen(companyId: companyId),
        settings: const RouteSettings(name: routeName));
  }


  RestaurantDetailScreen({Key? key, required this.companyId})
      : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool _onTapped=false;
  final service = SingleCompanyService();

  List<String> basketItems = [];
  Data? restaurant;



  @override
  void initState(){
    super.initState();
    service.fetchSingleCompany(widget.companyId).then((value){
      if(value != null) {
        setState(() {
          print('burada123');
          print(value);
          restaurant = value;
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
      backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.transparent.withOpacity(0.2),
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  margin: EdgeInsets.only(left: 10,top: 10),
                  child: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if(state is BasketLoaded){
                      return Positioned(
                        child: Stack(

                          children: [

                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const BasketScreen()));
                                //send user to cart screen
                              },
                            ),
                            Stack(
                             // alignment: Alignment.topRight,
                              children:  [
                                Icon(
                                  Icons.brightness_1,
                                  size: 19.0,
                                  color: Colors.red,
                                ),
                                Positioned(
                                  top: 3,
                                  right: 5,
                                  //child: Text('0', style: TextStyle(color: Colors.white, fontSize: 12),),
                                  child: Center(
                                    child: Text(state.basket.items.length.toString()),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                     // return Text(state.basket.items.length.toString());
            }
                    else{
                      return Text('');
            }}),
                ),
                Container(
            child:OutlinedButton(
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
            )]
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body:restaurant != null ? SingleChildScrollView(
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
                  restaurant!.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              _buildMenuItems(restaurant!, context)
              //RestaurantInformation(restaurant: restaurant),

            ],
          ),
        ): Center(
          child: LoadingAnimationWidget.inkDrop(
            color: Color(0xff696cff),

            size: 110,
          ),)

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
                child:  Text(listMenuItem[0].category!,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22)),
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
                            BlocBuilder<BasketBloc, BasketState>(
                                builder: (context, state) {

                                  return AnimatedIconButton(

                                    onPressed: () async {
                                      String? companyId = await storage.read(key: 'companyId');
                                      _onTapped=true;
                                      context.read<BasketBloc>()
                                        ..add(AddItem(MenuItems(name: menuItem.food!,id: menuItem.foodId!, restaurantId:widget.companyId , category:menuItem.category! , description: ' ', price: menuItem.sales_price!.toDouble())));
                                    },
                                    icons: [
                                      AnimatedIconItem(icon: Icon(Icons.add_circle,color: Theme.of(context).primaryColor)

                                      )
                                    ],
                                  );
                                })
                          ],),
                      ),
                    ),
                    Divider(height: 2),

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