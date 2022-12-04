import 'package:flutter/material.dart';
import 'package:waitech/widgets/restaurant_tags.dart';

import '../models/restaurant_model.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).primaryColor),

          ),
          SizedBox(height: 10,),
          RestaurantTags(restaurant: restaurant),
        ],
      ),
    );
  }
}
