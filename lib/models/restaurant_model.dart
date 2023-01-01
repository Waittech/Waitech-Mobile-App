import 'package:equatable/equatable.dart';
import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final int? id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  final List<MenuItems> menuItems;

  const Restaurant(
      {required this.menuItems,
      required this.tags,
      required this.id,
      required this.name,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, name, menuItems, imageUrl, tags];

  static List<Restaurant> restaurants = [
    Restaurant(
      tags: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 1).map((menuItem) => menuItem.category).toSet().toList(),
      id: 1,
      menuItems: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      name: "Birsen Cafe Restaurant",
      imageUrl:
          "https://www.nenerede.com.tr/wp-content/uploads/2017/07/18951070_1895516277327221_9216384988785886230_n.jpg",
    ),
    Restaurant(
        tags: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 2).map((menuItem) => menuItem.category).toSet().toList(),
        id: 2,
        menuItems: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        name: "Et Evim Steakhouse",
        imageUrl:
            "https://avatars.mds.yandex.net/get-altay/4079915/2a0000017ae249c70384b7f33c6f5ab82470/XXXL"),
    Restaurant(
      tags: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 3).map((menuItem) => menuItem.category).toSet().toList(),
      id: 3,
      menuItems: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .toList(),
      name: "Harbiye Restaurant",
      imageUrl:
          "https://media-cdn.tripadvisor.com/media/photo-s/12/1c/21/d8/harbiye-restaurant.jpg",
    ),
    Restaurant(
      tags: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 4).map((menuItem) => menuItem.category).toSet().toList(),
      id: 4,
      menuItems: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
      name: "Servet Cafe Restaurant",
      imageUrl:
          "https://i.dugun.com/gallery/62217/preview_doga-park-kir-bahcesi_8CBobYK7.jpeg",
    ),
  ];
}
