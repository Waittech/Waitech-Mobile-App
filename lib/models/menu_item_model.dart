import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String desctioption;
  final double price;

  MenuItem({
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

  static List<MenuItem> menuItems = [
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burge',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItem(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItem(
        id: 3,
        restaurantId: 1,
        name: 'Sütlaç',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItem(
        id: 4,
        restaurantId: 1,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 5,
        restaurantId: 1,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 1,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),





    MenuItem(
        id: 7,
        restaurantId: 2,
        name: 'Cheese Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItem(
        id: 8,
        restaurantId: 2,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItem(
        id: 9,
        restaurantId: 2,
        name: 'Baklava',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 100),
    MenuItem(
        id: 10,
        restaurantId: 2,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 11,
        restaurantId: 2,
        name: 'Kazandibi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),







    MenuItem(
        id: 3,
        restaurantId: 3,
        name: 'Sütlaç',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItem(
        id: 4,
        restaurantId: 3,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 5,
        restaurantId: 3,
        name: 'Domates Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 3,
        name: 'İşkembe Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),






    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'XL-Burge',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 120),
    MenuItem(
        id: 2,
        restaurantId: 1,
        name: 'Tavuk Burger',
        category: 'Burgerlar',
        desctioption: 'Domates sosu, Mozarella ',
        price: 80),
    MenuItem(
        id: 3,
        restaurantId: 4,
        name: 'Künefe',
        category: 'Tatlılar',
        desctioption: 'Türk mutfağında yer alan birçok sütlü tatlı içinde en  ',
        price: 40),
    MenuItem(
        id: 4,
        restaurantId: 4,
        name: 'Sakızlı Muhallebi',
        category: 'Tatlılar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 5,
        restaurantId: 4,
        name: 'Mercimek Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 4,
        name: 'Ezogelin Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 4,
        name: 'Yayla Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 4,
        name: 'Tavuk Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),
    MenuItem(
        id: 6,
        restaurantId: 4,
        name: 'Kellepaça Çorbası',
        category: 'Çorbalar',
        desctioption: 'yaygın yapılanlarından ve tanınanlarındane ',
        price: 30),



  ];
}
