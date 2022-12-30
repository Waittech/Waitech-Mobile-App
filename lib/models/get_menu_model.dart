class MenuItems {
  List<Burgerler>? burgerler;
  List<Salatalar>? salatalar;
  List<Tatlilar>? tatlilar;
  List<Corbalar>? corbalar;

  MenuItems({this.burgerler, this.salatalar, this.tatlilar, this.corbalar});

  MenuItems.fromJson(Map<String, dynamic> json) {
    if (json['Burgerler'] != null) {
      burgerler = <Burgerler>[];
      json['Burgerler'].forEach((v) {
        burgerler!.add(new Burgerler.fromJson(v));
      });
    }
    if (json['Salatalar'] != null) {
      salatalar = <Salatalar>[];
      json['Salatalar'].forEach((v) {
        salatalar!.add(new Salatalar.fromJson(v));
      });
    }
    if (json['Tatlilar'] != null) {
      tatlilar = <Tatlilar>[];
      json['Tatlilar'].forEach((v) {
        tatlilar!.add(new Tatlilar.fromJson(v));
      });
    }
    if (json['Corbalar'] != null) {
      corbalar = <Corbalar>[];
      json['Corbalar'].forEach((v) {
        corbalar!.add(new Corbalar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.burgerler != null) {
      data['Burgerler'] = this.burgerler!.map((v) => v.toJson()).toList();
    }
    if (this.salatalar != null) {
      data['Salatalar'] = this.salatalar!.map((v) => v.toJson()).toList();
    }
    if (this.tatlilar != null) {
      data['Tatlilar'] = this.tatlilar!.map((v) => v.toJson()).toList();
    }
    if (this.corbalar != null) {
      data['Corbalar'] = this.corbalar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Burgerler {
  String? category;
  String? food;
  String? description;
  Null? image;
  int? salesPrice;
  int? vatRate;

  Burgerler(
      {this.category,
        this.food,
        this.description,
        this.image,
        this.salesPrice,
        this.vatRate});

  Burgerler.fromJson(Map<String, dynamic> json) {
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

class Salatalar {
  String? category;
  String? food;
  String? description;
  Null? image;
  int? salesPrice;
  int? vatRate;

  Salatalar(
      {this.category,
        this.food,
        this.description,
        this.image,
        this.salesPrice,
        this.vatRate});

  Salatalar.fromJson(Map<String, dynamic> json) {
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

class Corbalar {
  String? category;
  String? food;
  String? description;
  Null? image;
  int? salesPrice;
  int? vatRate;

  Corbalar(
      {this.category,
        this.food,
        this.description,
        this.image,
        this.salesPrice,
        this.vatRate});

  Corbalar.fromJson(Map<String, dynamic> json) {
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

class Tatlilar {
  String? category;
  String? food;
  String? description;
  Null? image;
  int? salesPrice;
  int? vatRate;

  Tatlilar(
      {this.category,
        this.food,
        this.description,
        this.image,
        this.salesPrice,
        this.vatRate});

  Tatlilar.fromJson(Map<String, dynamic> json) {
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