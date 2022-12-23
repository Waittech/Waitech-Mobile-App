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
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  String? description;
  String? image;
  String? country;
  String? city;
  String? district;
  String? neighborhood;
  String? street;

  Data(
      {this.id,
        this.description,
        this.image,
        this.country,
        this.city,
        this.district,
        this.neighborhood,
        this.street});

  Data.fromJson(Map<String, dynamic> json) {
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