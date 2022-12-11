import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waitech/models/restaurant_model.dart';
import '../../widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: const RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  List<Restaurant> searchRestaurant = [];

  void searchFunc(String value) {
    for (var restaurant in Restaurant.restaurants) {
      if (restaurant.name.toLowerCase().trim().contains(value.trim().toLowerCase())) {
        searchRestaurant.add(restaurant);
        log(searchRestaurant[0].name);
        setState(() {
          log(searchRestaurant[0].name);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Waitech"),
        actions: <Widget>[
          const Icon(Icons.location_on_outlined),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'location');
            },
            child: const Text("Konum",
              style: TextStyle(color: Colors.white,
                  fontSize: 14.0),),


          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
              child:CupertinoTextField(
                placeholder: 'Restaurant Ara',
                padding:  EdgeInsets.symmetric(horizontal: 10.0),
                onChanged:(value){
                  searchFunc(value);
                  log(searchRestaurant.length.toString());
                },
              ),


            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Restaurantlar',
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(10),
              child:ListView.builder(
                physics:  NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RestaurantCard(

                      restaurant: Restaurant.restaurants[index]);
                },
                itemCount: searchRestaurant.isNotEmpty ? searchRestaurant.length : Restaurant.restaurants.length,
              ),)

          ],
        ),
      ),
    );
  }
}