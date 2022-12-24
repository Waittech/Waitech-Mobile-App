

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/restaurant_model2.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/restaurant-detail', arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(restaurant.tags.join(', '),style: GoogleFonts.openSans(),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}