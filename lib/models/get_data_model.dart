import 'dart:collection';

import 'get_menu_model.dart';

class GetDataModel {
  int? id;
  String? description;
  String? image;
  String? country;
  String? city;
  String? district;
  String? neighborhood;
  String? street;
  Menu? menu;


  GetDataModel({this.id,
    this.menu,
    this.description,
    this.image,
    this.country,
    this.city,
    this.district,
    this.neighborhood,
    this.street});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image'];
    country = json['country'];
    city = json['city'];
    district = json['district'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    menu = json['menu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['description'] = description;
    data['image'] = image;
    data['country'] = country;
    data['city'] = city;
    data['district'] = district;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    data['menu'] = menu;
    return data;
  }
}

class Menu {
  List<HashMap <String, List<MenuItemDetail>>>? menuItems;


  Menu({this.menuItems, });

  Menu.fromJson(Map<String, dynamic> json) {
    if (json['Menu'] != null) {
      menuItems = <HashMap <String, List<MenuItemDetail>>>[];
      json['Menu'].forEach((v) {
       // menuItems!.add(<HashMap <String, List<MenuItemDetail>>>.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (menuItems != null) {
      print(menuItems);
      //data['Menu'] = menuItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuItems {


}

class MenuItemDetail{


  String? category;
  String? food;
  String? description;
  Null? image;
  int? salesPrice;
  int? vatRate;

  MenuItemDetail(
      {this.category,
        this.food,
        this.description,
        this.image,
        this.salesPrice,
        this.vatRate});

  MenuItemDetail.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    food = json['food'];
    description = json['description'];
    image = json['image'];
    salesPrice = json['sales_price'];
    vatRate = json['vat_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['food'] = this.food;
    data['description'] = this.description;
    data['image'] = this.image;
    data['sales_price'] = this.salesPrice;
    data['vat_rate'] = this.vatRate;
    return data;
  }



}