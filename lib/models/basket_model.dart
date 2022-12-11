import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class Basket extends Equatable{
  final List<MenuItems> items;
  final bool cutlery;

  Basket({
  this.items = const <MenuItems>[],
  this.cutlery=false
});

  Basket copyWith({
     List<MenuItems>? items,
     bool? cutlery
}){
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
    );
  }

  @override
  List<Object?> get props => [items, cutlery];

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