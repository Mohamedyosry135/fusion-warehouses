class WarehousesModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  WarehousesModel({this.code, this.status, this.data, this.message});

  WarehousesModel.fromJson(json) {
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
  String? name;
  double? lat;
  double? long;
  bool? main;
  String? addressLine1;
  List<CoverageZones>? coverageZones;
  ShopBranch? shopBranch;

  Items(
      {this.id,
        this.name,
        this.lat,
        this.long,
        this.main,
        this.addressLine1,
        this.coverageZones,
        this.shopBranch});

  Items.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  int? shippingCost;
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
