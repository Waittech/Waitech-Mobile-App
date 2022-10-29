// For demo

class Menu {
  final String title, image;
  final double price;
  final int id;

  Menu(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
}

class CategoryMenu {
  final String category;
  final List<Menu> items;

  CategoryMenu({required this.category, required this.items});
}

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(
    category: "Sıcak İçecekler",
    items: [
      Menu(
        id: 0,
        price: 1,
        image: "assets/images/f_0.png",
        title: "Çay(Küçük)",
      ),
      Menu(
        id: 1,
        price: 1,
        image: "assets/images/f_1.png",
        title: "Kekik Çayı(Küçük)",
      ),
      Menu(
        id: 1,
        price: 1,
        image: "assets/images/f_2.png",
        title: "Oralet(Küçük)",
      ),
      Menu(
        id: 1,
        price: 2,
        image: "assets/images/f_0.png",
        title: "Çay(Büyük Cam)",
      ),
      Menu(
        id: 1,
        price: 2,
        image: "assets/images/f_1.png",
        title: "Kekik Çayı(Büyük Cam)",
      ),
      Menu(
        id: 1,
        price: 2,
        image: "assets/images/f_2.png",
        title: "Oralet(Büyük Cam)",
      ),
      Menu(
        id: 1,
        price: 1.75,
        image: "assets/images/f_2.png",
        title: "Çay(Karton)",
      ),
      Menu(
        id: 1,
        price: 5,
        image: "assets/images/f_0.png",
        title: "Tük Kahvesi(Double)",
      ),
      Menu(
        id: 1,
        price: 1.75,
        image: "assets/images/f_1.png",
        title: "Nescafe(Küçük)",
      ),
      Menu(
        id: 1,
        price: 2.5,
        image: "assets/images/f_2.png",
        title: "Nescafe(Büyük)",
      ),
      Menu(
        id: 1,
        price: 2,
        image: "assets/images/f_0.png",
        title: "Oralet kivi",
      ),
    ],
  ),
  CategoryMenu(
    category: "Soğuk İçecekler",
    items: [
      Menu(
        id: 1,
        price: 1.75,
        image: "assets/images/f_4.png",
        title: "Su",
      ),
      Menu(
        id: 1,
        price: 2.75,
        image: "assets/images/f_5.png",
        title: "Soda",
      ),
    ],
  ),
  CategoryMenu(
    category: "Yiyecekler",
    items: [
      Menu(
        id: 1,
        price: 7.4,
        image: "assets/images/f_6.png",
        title: "Oyster Dish",
      ),
      Menu(
        id: 1,
        price: 9.0,
        image: "assets/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Menu(
        id: 1,
        price: 8.5,
        image: "assets/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
  CategoryMenu(
    category: "Diğer",
    items: [
      Menu(
        id: 1,
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        id: 1,
        price: 7.4,
        image: "assets/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        id: 1,
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        id: 1,
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        id: 1,
        price: 9.0,
        image: "assets/images/f_1.png",
        title: "Chow Fun",
      ),
    ],
  ),
];
