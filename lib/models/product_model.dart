class ProductModel {
  ProductModel({
    this.mobiles,
    this.ac,
    this.laptop,
    this.camera,
    this.watches,
  });

  ProductModel.fromJson(dynamic json) {
    if (json['mobiles'] != null) {
      mobiles = [];
      json['mobiles'].forEach((v) {
        mobiles?.add(ProductItem.fromJson(v));
      });
    }
    if (json['ac'] != null) {
      ac = [];
      json['ac'].forEach((v) {
        ac?.add(ProductItem.fromJson(v));
      });
    }
    if (json['laptop'] != null) {
      laptop = [];
      json['laptop'].forEach((v) {
        laptop?.add(ProductItem.fromJson(v));
      });
    }
    if (json['camera'] != null) {
      camera = [];
      json['camera'].forEach((v) {
        camera?.add(ProductItem.fromJson(v));
      });
    }
    if (json['watches'] != null) {
      watches = [];
      json['watches'].forEach((v) {
        watches?.add(ProductItem.fromJson(v));
      });
    }
  }

  List<ProductItem>? mobiles;
  List<ProductItem>? ac;
  List<ProductItem>? laptop;
  List<ProductItem>? camera;
  List<ProductItem>? watches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (mobiles != null) {
      map['mobiles'] = mobiles?.map((v) => v.toJson()).toList();
    }
    if (ac != null) {
      map['ac'] = ac?.map((v) => v.toJson()).toList();
    }
    if (laptop != null) {
      map['laptop'] = laptop?.map((v) => v.toJson()).toList();
    }
    if (camera != null) {
      map['camera'] = camera?.map((v) => v.toJson()).toList();
    }
    if (watches != null) {
      map['watches'] = watches?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductItem {
  ProductItem({
    required this.manufactureAddress,
    required this.productName,
    required this.modelNumber,
    required this.manufactureDate,
    required this.price,
  });

  ProductItem.fromJson(dynamic json) {
    manufactureAddress = json['manufactureAddress'];
    productName = json['productName'];
    modelNumber = json['modelNumber'];
    manufactureDate = json['manufactureDate'];
    price = json['price'];
  }

  String? manufactureAddress;
  String? productName;
  num? modelNumber;
  String? manufactureDate;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['manufactureAddress'] = manufactureAddress;
    map['productName'] = productName;
    map['modelNumber'] = modelNumber;
    map['manufactureDate'] = manufactureDate;
    map['price'] = price;
    return map;
  }
}
