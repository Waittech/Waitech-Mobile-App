import 'package:equatable/equatable.dart';

class MenuItems extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String desctioption;
  final double price;

  MenuItems({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.desctioption,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        desctioption,
        price,
      ];

  static List<MenuItems> menuItems = [
    MenuItems(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems(
        id: 3,
        restaurantId: 1,
        name: 'Sütlaç',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems(
        id: 4,
        restaurantId: 1,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 5,
        restaurantId: 1,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 1,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),





    MenuItems(
        id: 7,
        restaurantId: 2,
        name: 'Cheese Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems(
        id: 8,
        restaurantId: 2,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems(
        id: 9,
        restaurantId: 2,
        name: 'Baklava',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 100),
    MenuItems(
        id: 10,
        restaurantId: 2,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 11,
        restaurantId: 2,
        name: 'Kazandibi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),







    MenuItems(
        id: 3,
        restaurantId: 3,
        name: 'Sütlaç',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems(
        id: 4,
        restaurantId: 3,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 5,
        restaurantId: 3,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 3,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),






    MenuItems(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burge',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItems(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItems(
        id: 3,
        restaurantId: 4,
        name: 'Künefe',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItems(
        id: 4,
        restaurantId: 4,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 5,
        restaurantId: 4,
        name: 'Mercimek Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 4,
        name: 'Ezogelin Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 4,
        name: 'Yayla Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 4,
        name: 'Tavuk Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItems(
        id: 6,
        restaurantId: 4,
        name: 'Kellepaça Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),



  ];
}
