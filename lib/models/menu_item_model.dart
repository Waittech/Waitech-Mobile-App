import 'package:equatable/equatable.dart';

class MenuItems2 extends Equatable {
  late final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItems2({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItems2> menuItems = [
    MenuItems2(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burger',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems2(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems2(
        id: 3,
        restaurantId: 1,
        name: 'Sütlaç',
        category: 'Tatlılar',
        description: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems2(
        id: 4,
        restaurantId: 1,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 5,
        restaurantId: 1,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 1,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),





    MenuItems2(
        id: 7,
        restaurantId: 2,
        name: 'Cheese Burger',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems2(
        id: 8,
        restaurantId: 2,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems2(
        id: 9,
        restaurantId: 2,
        name: 'Baklava',
        category: 'Tatlılar',
        description: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 100),
    MenuItems2(
        id: 10,
        restaurantId: 2,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2  (
        id: 11,
        restaurantId: 2,
        name: 'Kazandibi',
        category: 'Tatlılar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),







    MenuItems2(
        id: 3,
        restaurantId: 3,
        name: 'Sütlaç',
        category: 'Tatlılar',
        description: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems2  (
        id: 4,
        restaurantId: 3,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 5,
        restaurantId: 3,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 3,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),






    MenuItems2(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burge',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems2(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        description: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems2(
        id: 3,
        restaurantId: 4,
        name: 'Künefe',
        category: 'Tatlılar',
        description: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems2(
        id: 4,
        restaurantId: 4,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 5,
        restaurantId: 4,
        name: 'Mercimek Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 4,
        name: 'Ezogelin Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 4,
        name: 'Yayla Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 4,
        name: 'Tavuk Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems2(
        id: 6,
        restaurantId: 4,
        name: 'Kellepaça Çorbası',
        category: 'Çorbalar',
        description: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),



  ];
}
