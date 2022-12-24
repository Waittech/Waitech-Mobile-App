import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Product {
  Product({
    required this.success,
    required this.data,
    this.message,
    required this.code,
  });
  late final bool success;
  late final List<Data> data;
  late final Null message;
  late final int code;

  Product.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    _data['code'] = code;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    this.description,
    this.image,
    required this.country,
    this.city,
    this.district,
    this.neighborhood,
    this.street,
  });
  late final int id;
  late final String? description;
  late final String? image;
  late final String country;
  late final String? city;
  late final String? district;
  late final String? neighborhood;
  late final String? street;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = null;
    image = null;
    country = json['country'];
    city = null;
    district = null;
    neighborhood = null;
    street = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['image'] = image;
    _data['country'] = country;
    _data['city'] = city;
    _data['district'] = district;
    _data['neighborhood'] = neighborhood;
    _data['street'] = street;
    return _data;
  }
}
