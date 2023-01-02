//Bu modelde links classının ismi urls oldu//




class GetOrderModel {
  List<Data>? data;
  Links? links;
  Meta? meta;
  bool? success;
  Null? message;
  int? code;

  GetOrderModel(
      {this.data,
        this.links,
        this.meta,
        this.success,
        this.message,
        this.code});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    success = json['success'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
  String? companyName;
  String? description;
  String? image;
  String? country;
  String? city;
  String? district;
  String? neighborhood;
  String? street;

  Company(
      {this.id,
        this.companyName,
        this.description,
        this.image,
        this.country,
        this.city,
        this.district,
        this.neighborhood,
        this.street});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName =json['name'];
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
    data['name'] = this.companyName;
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

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Urls {
  String? url;
  String? label;
  bool? active;

  Urls({this.url, this.label, this.active});

  Urls.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}