class ProductsOfStockModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  ProductsOfStockModel({this.code, this.status, this.data, this.message});

  ProductsOfStockModel.fromJson(json) {
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
  List<ProductsInStocks>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ProductsInStocks>[];
      json['items'].forEach((v) {
        items!.add(new ProductsInStocks.fromJson(v));
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

class ProductsInStocks {
  int? id;
  String? mainImage;
  String? slug;
  int? physicalStock;
  String? name;
  String? partNumber;
  Category? category;
  List<ProductPhysicalInventories>? productPhysicalInventories;

  ProductsInStocks(
      {this.id,
        this.mainImage,
        this.slug,
        this.physicalStock,
        this.name,
        this.partNumber,
        this.category,
        this.productPhysicalInventories});

  ProductsInStocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainImage = json['main_image'];
    slug = json['slug'];
    physicalStock = json['physical_stock'];
    name = json['name'];
    partNumber = json['part_number'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['product_physical_inventories'] != null) {
      productPhysicalInventories = <ProductPhysicalInventories>[];
      json['product_physical_inventories'].forEach((v) {
        productPhysicalInventories!.add(new ProductPhysicalInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_image'] = this.mainImage;
    data['slug'] = this.slug;
    data['physical_stock'] = this.physicalStock;
    data['name'] = this.name;
    data['part_number'] = this.partNumber;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.productPhysicalInventories != null) {
      data['product_physical_inventories'] =
          this.productPhysicalInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  int? shopId;
  String? createdAt;
  String? updatedAt;
  bool? disabled;
  int? parentId;
  int? userId;
  dynamic? key;
  dynamic? supportTicketTypeId;
  bool? showInSupportTicket;
  String? slug;
  dynamic? order;
  String? name;
  String? description;

  Category(
      {this.id,
        this.shopId,
        this.createdAt,
        this.updatedAt,
        this.disabled,
        this.parentId,
        this.userId,
        this.key,
        this.supportTicketTypeId,
        this.showInSupportTicket,
        this.slug,
        this.order,
        this.name,
        this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    disabled = json['disabled'];
    parentId = json['parent_id'];
    userId = json['user_id'];
    key = json['key'];
    supportTicketTypeId = json['support_ticket_type_id'];
    showInSupportTicket = json['show_in_support_ticket'];
    slug = json['slug'];
    order = json['order'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['disabled'] = this.disabled;
    data['parent_id'] = this.parentId;
    data['user_id'] = this.userId;
    data['key'] = this.key;
    data['support_ticket_type_id'] = this.supportTicketTypeId;
    data['show_in_support_ticket'] = this.showInSupportTicket;
    data['slug'] = this.slug;
    data['order'] = this.order;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}


class ProductPhysicalInventories {
  int? productInventoryId;
  int? id;
  String? name;
  double? lat;
  double? long;
  bool? main;
  String? addressLine1;
  List<CoverageZones>? coverageZones;
  ShopBranch? shopBranch;
  int? productWarehouseId;
  int? physicalStock;
  String? physicalStoragePlace;
  int? stock;
  String? storagePlace;
  int? realStock;

  ProductPhysicalInventories(
      {this.productInventoryId,
        this.id,
        this.name,
        this.lat,
        this.long,
        this.main,
        this.addressLine1,
        this.coverageZones,
        this.shopBranch,
        this.productWarehouseId,
        this.physicalStock,
        this.physicalStoragePlace,
        this.stock,
        this.storagePlace,
        this.realStock});

  ProductPhysicalInventories.fromJson(Map<String, dynamic> json) {
    productInventoryId = json['product_inventory_id'];
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    main = json['main'];
    addressLine1 = json['address_line1'];
    if (json['coverage_zones'] != null) {
      coverageZones = <CoverageZones>[];
      json['coverage_zones'].forEach((v) {
        coverageZones!.add(new CoverageZones.fromJson(v));
      });
    }
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    productWarehouseId = json['product_warehouse_id'];
    physicalStock = json['physical_stock'];
    physicalStoragePlace = json['physical_storage_place'];
    stock = json['stock'];
    storagePlace = json['storage_place'];
    realStock = json['real_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_inventory_id'] = this.productInventoryId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['main'] = this.main;
    data['address_line1'] = this.addressLine1;
    if (this.coverageZones != null) {
      data['coverage_zones'] =
          this.coverageZones!.map((v) => v.toJson()).toList();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['product_warehouse_id'] = this.productWarehouseId;
    data['physical_stock'] = this.physicalStock;
    data['physical_storage_place'] = this.physicalStoragePlace;
    data['stock'] = this.stock;
    data['storage_place'] = this.storagePlace;
    data['real_stock'] = this.realStock;
    return data;
  }
}

class CoverageZones {
  int? id;
  String? title;
  double? lat;
  double? long;
  int? radius;
  dynamic? freeShippingRadius;
  double? shippingCost;
  int? shopId;
  int? cityId;
  String? addressLine1;
  bool? disabled;
  String? currency;
  String? createdAt;
  String? updatedAt;
  Country? country;

  CoverageZones(
      {this.id,
        this.title,
        this.lat,
        this.long,
        this.radius,
        this.freeShippingRadius,
        this.shippingCost,
        this.shopId,
        this.cityId,
        this.addressLine1,
        this.disabled,
        this.currency,
        this.createdAt,
        this.updatedAt,
        this.country});

  CoverageZones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lat = json['lat'];
    long = json['long'];
    radius = json['radius'];
    freeShippingRadius = json['free_shipping_radius'];
    shippingCost = json['shipping_cost'];
    shopId = json['shop_id'];
    cityId = json['city_id'];
    addressLine1 = json['address_line_1'];
    disabled = json['disabled'];
    currency = json['currency'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['radius'] = this.radius;
    data['free_shipping_radius'] = this.freeShippingRadius;
    data['shipping_cost'] = this.shippingCost;
    data['shop_id'] = this.shopId;
    data['city_id'] = this.cityId;
    data['address_line_1'] = this.addressLine1;
    data['disabled'] = this.disabled;
    data['currency'] = this.currency;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? code;
  String? name;
  String? currency;
  String? countryCode;

  Country({this.id, this.code, this.name, this.currency, this.countryCode});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    currency = json['currency'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['country_code'] = this.countryCode;
    return data;
  }
}

class ShopBranch {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  bool? main;
  Names? names;
  Address? address;

  ShopBranch(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.main,
        this.names,
        this.address});

  ShopBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    main = json['main'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['main'] = this.main;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Names {
  String? en;
  String? ar;

  Names({this.en, this.ar});

  Names.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Address {
  int? id;
  String? name;
  int? countryId;
  int? cityId;
  int? areaId;
  String? addressLine1;
  String? addressLine2;
  double? lat;
  double? long;
  dynamic? zipCode;
  bool? isDefault;
  String? countryName;
  String? cityName;

  Address(
      {this.id,
        this.name,
        this.countryId,
        this.cityId,
        this.areaId,
        this.addressLine1,
        this.addressLine2,
        this.lat,
        this.long,
        this.zipCode,
        this.isDefault,
        this.countryName,
        this.cityName});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    lat = json['lat'];
    long = json['long'];
    zipCode = json['zip_code'];
    isDefault = json['is_default'];
    countryName = json['country_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['zip_code'] = this.zipCode;
    data['is_default'] = this.isDefault;
    data['country_name'] = this.countryName;
    data['city_name'] = this.cityName;
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
