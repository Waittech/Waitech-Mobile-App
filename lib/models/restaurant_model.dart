import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> tags;

  Restaurant(
      {required this.tags,
      required this.id,
      required this.name,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, name, imageUrl, tags];

  static List<Restaurant> restaurants = [
    Restaurant(
      tags: ["Pizza", "Salad", "Burger", "Dessert"],
      id: 1,
      name: "Birsen Cafe Restaurant",
      imageUrl:
          "https://www.nenerede.com.tr/wp-content/uploads/2017/07/18951070_1895516277327221_9216384988785886230_n.jpg",
    ),
    Restaurant(
      tags: ["Pizza", "Salad", "Burger", "Dessert"],
      id: 2,
      name: "Et Evim Steakhouse",
      imageUrl:
          "https://avatars.mds.yandex.net/get-altay/4079915/2a0000017ae249c70384b7f33c6f5ab82470/XXXL"
    ),
    Restaurant(
      tags: ["Pizza", "Salad", "Burger", "Dessert"],
      id: 3,
      name: "Harbiye Restaurant",
      imageUrl:
      "https://media-cdn.tripadvisor.com/media/photo-s/12/1c/21/d8/harbiye-restaurant.jpg",
    ),
    Restaurant(
      tags: ["Pizza", "Salad", "Burger", "Dessert"],
      id: 4,
      name: "Servet Cafe Restaurant",
      imageUrl:
      "https://i.dugun.com/gallery/62217/preview_doga-park-kir-bahcesi_8CBobYK7.jpeg",
    ),
  ];
}
