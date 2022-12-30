// import 'package:flutter/material.dart';
// import 'package:waitech/models/get_data_model.dart';
//
// import '../models/get_company.dart';
// import '../models/restaurant_model.dart';
//
// class RestaurantTags extends StatelessWidget {
//   final GetDataModel restaurant;
//
//   const RestaurantTags({Key? key, required this.restaurant}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children: restaurant.map(
//       (tag) => restaurant.indexOf(tag) == restaurant.length - 1
//           ? Text(
//           '$tag,',
//               style: Theme.of(context).textTheme.labelSmall,
//             )
//           : Text(
//               '$tag,',
//               style: Theme.of(context).textTheme.labelSmall,
//             ),
//     ).toList(),
//     );
//   }
// }
