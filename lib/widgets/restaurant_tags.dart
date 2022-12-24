import 'package:flutter/material.dart';

import '../models/restaurant_model2.dart';

class RestaurantTags extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTags({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: restaurant.tags.map(
      (tag) => restaurant.tags.indexOf(tag) == restaurant.tags.length - 1
          ? Text(
              tag,
              style: Theme.of(context).textTheme.labelSmall,
            )
          : Text(
              '$tag,',
              style: Theme.of(context).textTheme.labelSmall,
            ),
    ).toList(),
    );
  }
}
