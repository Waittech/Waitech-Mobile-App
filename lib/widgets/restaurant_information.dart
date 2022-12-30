import 'package:flutter/material.dart';
import 'package:waitech/models/get_data_model.dart';
import 'package:waitech/widgets/restaurant_tags.dart';

import '../models/get_company.dart';
import '../models/restaurant_model.dart';

class RestaurantInformation extends StatefulWidget {
  final GetDataModel restaurant;

  const RestaurantInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantInformation> createState() => _RestaurantInformationState();
}

class _RestaurantInformationState extends State<RestaurantInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.restaurant.description}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).primaryColor),

          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
