import 'package:flutter/material.dart';
import 'package:waitech/widgets/restaurant_information.dart';

import '../../models/restaurant_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = '/restaurant-detail';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
        builder: (_) =>  RestaurantDetailScreen(restaurant: restaurant,),
        settings: const RouteSettings(name: routeName));
  }
  final Restaurant restaurant;

   RestaurantDetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  child: Text(
                    "Sepete Ekle".toUpperCase(),
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                ),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                },
                itemCount: restaurant.tags.length,
              )

              /* ListView.builder(
                itemCount: ,
                itemBuilder:  (context, index) {}) */
            ],
          ),
        ));
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(menuItem.name, style: Theme.of(context).textTheme.titleLarge ,),
                          subtitle: Text(menuItem.desctioption),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Text('${menuItem.price} \u{20BA}'),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle, color: Theme.of(context).primaryColor,))
                          ],),
                        ),
                      ),
                      Divider(height: 2,)
                    ],
                  )).toList(),
        ),
      ],
    );
  }
}
