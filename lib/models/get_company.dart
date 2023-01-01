import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:waitech/models/get_data_model.dart';

class GetCompany {
  bool? success;
  List<Data>? data;
  Null? message;
  int? code;

  GetCompany({this.success, this.data, this.message, this.code});

  GetCompany.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? description;
  String? image;
  String? name;
  String? country;
  String? city;
  String? district;
  String? neighborhood;
  String? street;
  List<List<MenuItem>>? menu;

  Data(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.country,
        this.city,
        this.district,
        this.neighborhood,
        this.street,
      this.menu});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    country = json['country'];
    city = json['city'];
    district = json['district'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    if (json['menu'] != null) {
      menu = <List<MenuItem>>[];
      Map<String, dynamic> menus = new Map<String, dynamic>.from(json['menu']);

      for(var v in menus.values){
        var inner = <MenuItem>[];
        v.forEach((w) {
          inner.add(MenuItem.fromJson(w));
        });
        menu?.add(inner);
      }
    }
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['country'] = country;
    data['city'] = city;
    data['district'] = district;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    return data;
  }
}

class MenuItem {
  String? category;
  String? food;
  String? description;
  String? image;
  int? sales_price;
  int? vat_rate;

  MenuItem({
    this.category,
    this.food,
    this.description,
    this.image,
    this.sales_price,
    this.vat_rate,
  });

  MenuItem.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    food = json['food'];
    description = json['description'];
    image = json['image'];
    sales_price = json['sales_price'];
    vat_rate = json['vat_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = category;
    data['food'] = food;
    data['description'] = description;
    data['image'] = image;
    data['sales_price'] = sales_price;
    data['vat_rate'] = vat_rate;
    return data;
  }
}