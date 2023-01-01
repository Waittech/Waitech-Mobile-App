class GetOrdersDetail {
  Data? data;
  bool? success;
  Null? message;
  int? code;

  GetOrdersDetail({this.data, this.success, this.message, this.code});

  GetOrdersDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  Company? company;
  int? orderId;
  String? tableName;
  String? note;
  String? totalPrice;
  String? status;
  List<Foods>? foods;
  String? createdDate;
  String? createdTime;

  Data(
      {this.company,
        this.orderId,
        this.tableName,
        this.note,
        this.totalPrice,
        this.status,
        this.foods,
        this.createdDate,
        this.createdTime});

  Data.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    tableName = json['table_name'];
    orderId = json['order_id'];
    note = json['note'];
    totalPrice = json['total_price'];
    status = json['status'];
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(new Foods.fromJson(v));
      });
    }
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['order_id'] = this.orderId;
    data['table_name'] = this.tableName;
    data['note'] = this.note;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
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
      {this.id,
        this.description,
        this.image,
        this.country,
        this.city,
        this.district,
        this.neighborhood,
        this.street});

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
  Null? image;
  int? price;
  String? name;

  Foods({this.id, this.description, this.image, this.price, this.name});

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
