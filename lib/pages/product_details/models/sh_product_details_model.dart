class SHProductDetailsModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  SHProductDetailsModel({this.code, this.status, this.data, this.message});

  SHProductDetailsModel.fromJson( json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null&& json['data'].toString() != "[]"  ? new Data.fromJson(json['data']) : null;
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
  int? addedStock;
  double? currentPrice;
  int? oldStock;
  String? createdAt;
  String? storagePlace;
  double? currentStockPrice;
  dynamic? stock;
  dynamic? realStock;
  dynamic? sourceType;
  dynamic? sourceId;
  dynamic? physicalInventoryId;
  dynamic? physicalInventoryName;
  String? barCode;
  Warehouse? warehouse;
  Shop? shop;
  UpdatedBy? updatedBy;
  Product? product;

  Items(
      {this.id,
        this.addedStock,
        this.currentPrice,
        this.oldStock,
        this.createdAt,
        this.storagePlace,
        this.currentStockPrice,
        this.stock,
        this.realStock,
        this.sourceType,
        this.sourceId,
        this.physicalInventoryId,
        this.physicalInventoryName,
        this.barCode,
        this.warehouse,
        this.shop,
        this.updatedBy,
        this.product});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedStock = json['added_stock'];
    currentPrice = json['current_price'];
    oldStock = json['old_stock'];
    createdAt = json['created_at'];
    storagePlace = json['storage_place'];
    currentStockPrice = json['current_stock_price'];
    stock = json['stock'];
    realStock = json['real_stock'];
    sourceType = json['source_type'];
    sourceId = json['source_id'];
    physicalInventoryId = json['physical_inventory_id'];
    physicalInventoryName = json['physical_inventory_name'];
    barCode = json['bar_code'];
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    updatedBy = json['updated_by'] != null
        ? new UpdatedBy.fromJson(json['updated_by'])
        : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_stock'] = this.addedStock;
    data['current_price'] = this.currentPrice;
    data['old_stock'] = this.oldStock;
    data['created_at'] = this.createdAt;
    data['storage_place'] = this.storagePlace;
    data['current_stock_price'] = this.currentStockPrice;
    data['stock'] = this.stock;
    data['real_stock'] = this.realStock;
    data['source_type'] = this.sourceType;
    data['source_id'] = this.sourceId;
    data['physical_inventory_id'] = this.physicalInventoryId;
    data['physical_inventory_name'] = this.physicalInventoryName;
    data['bar_code'] = this.barCode;
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.toJson();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.updatedBy != null) {
      data['updated_by'] = this.updatedBy!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Warehouse {
  int? id;
  String? name;
  bool? main;
  double? lat;
  double? long;
  String? addressLine1;

  Warehouse(
      {this.id, this.name, this.main, this.lat, this.long, this.addressLine1});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    main = json['main'];
    lat = json['lat'];
    long = json['long'];
    addressLine1 = json['address_line1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['main'] = this.main;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['address_line1'] = this.addressLine1;
    return data;
  }
}

class Shop {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? slug;
  bool? isZatcaReady;
  double? rating;
  Names? names;

  Shop(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.slug,
        this.isZatcaReady,
        this.rating,
        this.names});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
    slug = json['slug'];
    isZatcaReady = json['is_zatca_ready'];
    rating = json['rating'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['slug'] = this.slug;
    data['is_zatca_ready'] = this.isZatcaReady;
    data['rating'] = this.rating;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    return data;
  }
}

class Names {
  String? ar;
  String? en;
  String? ur;

  Names({this.ar, this.en, this.ur});

  Names.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    ur = json['ur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    data['ur'] = this.ur;
    return data;
  }
}

class UpdatedBy {
  int? id;
  String? name;
  String? email;
  String? phone;

  UpdatedBy({this.id, this.name, this.email, this.phone});

  UpdatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Product {
  int? id;
  String? description;
  String? name;
  String? createdAt;
  String? shortDescription;
  double? price;
  dynamic? taxIncluded;
  dynamic? mainImage;
  bool? hidePrice;
  double? purchasePrice;
  int? shopId;
  int? stock;
  bool? active;
  dynamic? supplierPurchasePrice;
  dynamic? supplierPrice;
  String? code;
  String? partNumber;
  Category? category;
  List<Null>? machines;

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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
