import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class Basket extends Equatable{
  final List<MenuItems2> items;


  Basket({
  this.items = const <MenuItems2>[],

});

  Basket copyWith({
     List<MenuItems2>? items,
     bool? cutlery
}){
    return Basket(
      items: items ?? this.items,

    );
  }

  @override
  List<Object?> get props => [items];

  Map itemQuantity(items) {
    var quantity = Map();

    items.forEach((item){
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      }
      else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0,(total,current) => total + current.price);

  double total(subtotal) {
    return subtotal;

  }
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal).toStringAsFixed(2);


}