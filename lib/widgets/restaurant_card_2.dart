

import 'package:flutter/material.dart';

import '../models/restaurant_model2.dart';

class RestaurantCard2 extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard2({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/restaurant-detail', arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: (){Navigator.pushNamed(context, '/restaurant-detail', arguments: restaurant);},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Ink.image(
                      //image: const NetworkImage("assets/slider/2.jpg"),
                      image:  NetworkImage(restaurant.imageUrl,),
                      height: 150,
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {Navigator.pushNamed(context, '/restaurant-detail', arguments: restaurant);},
                      ),
                    ),


                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(12),
                  child: Text(
                      ' ',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.1)
                          ])),
                ),

          ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15 , bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Text('${restaurant.tags.join(' ').replaceAll(' ' , ', ')}' , style: TextStyle(fontSize: 11, ),),

                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}