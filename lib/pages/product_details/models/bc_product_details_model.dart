class BCProductDetailsModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  BCProductDetailsModel({this.code, this.status, this.data, this.message});

  BCProductDetailsModel.fromJson( json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null && json['data'].toString() != "[]" ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Items>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  String? description;
  String? name;
  String? createdAt;
  String? shortDescription;
  int? price;
  Null? taxIncluded;
  Null? mainImage;
  bool? hidePrice;
  int? purchasePrice;
  int? shopId;
  int? stock;
  bool? active;
  Null? supplierPurchasePrice;
  Null? supplierPrice;
  String? code;
  String? partNumber;
  Category? category;
  List<Null>? machines;

  Items(
      {this.id,
        this.description,
        this.name,
        this.createdAt,
        this.shortDescription,
        this.price,
        this.taxIncluded,
        this.mainImage,
        this.hidePrice,
        this.purchasePrice,
        this.shopId,
        this.stock,
        this.active,
        this.supplierPurchasePrice,
        this.supplierPrice,
        this.code,
        this.partNumber,
        this.category,
        this.machines});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    name = json['name'];
    createdAt = json['created_at'];
    shortDescription = json['short_description'];
    price = json['price'];
    taxIncluded = json['tax_included'];
    mainImage = json['main_image'];
    hidePrice = json['hide_price'];
    purchasePrice = json['purchase_price'];
    shopId = json['shop_id'];
    stock = json['stock'];
    active = json['active'];
    supplierPurchasePrice = json['supplier_purchase_price'];
    supplierPrice = json['supplier_price'];
    code = json['code'];
    partNumber = json['part_number'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    // if (json['machines'] != null) {
    //   machines = <Null>[];
    //   json['machines'].forEach((v) {
    //     machines!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['short_description'] = this.shortDescription;
    data['price'] = this.price;
    data['tax_included'] = this.taxIncluded;
    data['main_image'] = this.mainImage;
    data['hide_price'] = this.hidePrice;
    data['purchase_price'] = this.purchasePrice;
    data['shop_id'] = this.shopId;
    data['stock'] = this.stock;
    data['active'] = this.active;
    data['supplier_purchase_price'] = this.supplierPurchasePrice;
    data['supplier_price'] = this.supplierPrice;
    data['code'] = this.code;
    data['part_number'] = this.partNumber;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    // if (this.machines != null) {
    //   data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Pagination {
  int? totalItems;
  int? totalPages;
  int? currentPage;
  int? perPage;

  Pagination(
      {this.totalItems, this.totalPages, this.currentPage, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    return data;
  }
}
