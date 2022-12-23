class OrderModel {
  Data? data;
  bool? success;
  dynamic message;
  int? code;

  OrderModel({required this.data, required this.success, this.message, required this.code});

  OrderModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    success = json['success'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  Company? company;
  String? tableName;
  String? note;
  String? status;
  List<Foods>? foods;
  String? createdDate;
  String? createdTime;

  Data(
      {required this.company,
        required this.tableName,
        required this.note,
        required this.status,
        required this.foods,
        required this.createdDate,
        required this.createdTime});

  Data.fromJson(Map<String, dynamic> json) {
    company =
    (json['company'] != null ? new Company.fromJson(json['company']) : null)!;
    tableName = json['table_name'];
    note = json['note'];
    status = json['status'];
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods?.add(new Foods.fromJson(v));
      });
    }
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company?.toJson();
    }
    data['table_name'] = this.tableName;
    data['note'] = this.note;
    data['status'] = this.status;
    if (this.foods != null) {
      data['foods'] = this.foods?.map((v) => v.toJson()).toList();
    }
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    return data;
  }
}

class Company {
  int? id;
  String? description;
  String? image;
  String? country;
  String? city;
  String? district;
  String? neighborhood;
  String? street;

  Company(
      {required this.id,
        required this.description,
        required this.image,
        required this.country,
        required this.city,
        required this.district,
        required this.neighborhood,
        required this.street});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image'];
    country = json['country'];
    city = json['city'];
    district = json['district'];
    neighborhood = json['neighborhood'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['image'] = this.image;
    data['country'] = this.country;
    data['city'] = this.city;
    data['district'] = this.district;
    data['neighborhood'] = this.neighborhood;
    data['street'] = this.street;
    return data;
  }
}

class Foods {
  int? id;
  String? description;
  dynamic image;
  int? price;
  String? name;

  Foods({required this.id, required this.description, this.image, required this.price, required this.name});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['name'] = this.name;
    return data;
  }
}