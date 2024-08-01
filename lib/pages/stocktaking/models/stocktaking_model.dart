class StockItemsModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  StockItemsModel({this.code, this.status, this.data, this.message});

  StockItemsModel.fromJson( json) {
    print("json ${json}");
    code = json['code']==401?200 :json['code'];
    status = json['status'];
    data = json['data'] != null && json['data'].toString() != "[]"  ? new Data.fromJson(json['data']) : null;
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
  String? status;
  String? startAt;
  String? endsAt;
  String? startedAt;
  String? completedAt;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  ShopBranch? shopBranch;
  List<ProductCategories>? productCategories;
  ProductCategories? productCategory;

  Items(
      {this.id,
        this.name,
        this.status,
        this.startAt,
        this.endsAt,
        this.startedAt,
        this.completedAt,
        this.createdAt,
        this.updatedAt,
        this.expiresAt,
        this.shopBranch,
        this.productCategories,
        this.productCategory});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    startAt = json['start_at'];
    endsAt = json['ends_at'];
    startedAt = json['started_at'];
    completedAt = json['completed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    if (json['product_categories'] != null) {
      productCategories = <ProductCategories>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(new ProductCategories.fromJson(v));
      });
    }
    productCategory = json['product_category'] != null
        ? new ProductCategories.fromJson(json['product_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['start_at'] = this.startAt;
    data['ends_at'] = this.endsAt;
    data['started_at'] = this.startedAt;
    data['completed_at'] = this.completedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expires_at'] = this.expiresAt;
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    if (this.productCategories != null) {
      data['product_categories'] =
          this.productCategories!.map((v) => v.toJson()).toList();
    }
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
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
  Null? name;
  Null? countryId;
  Null? cityId;
  Null? areaId;
  String? addressLine1;
  Null? addressLine2;
  double? lat;
  double? long;
  Null? zipCode;
  bool? isDefault;
  Null? countryName;
  Null? cityName;

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

class ProductCategories {
  int? id;
  String? name;
  String? description;
  List<Translations>? translations;
  String? slug;
  int? parentId;
  bool? disabled;
  String? mainImage;
  String? createdAt;
  String? updatedAt;

  ProductCategories(
      {this.id,
        this.name,
        this.description,
        this.translations,
        this.slug,
        this.parentId,
        this.disabled,
        this.mainImage,
        this.createdAt,
        this.updatedAt});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    slug = json['slug'];
    parentId = json['parent_id'];
    disabled = json['disabled'];
    mainImage = json['main_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['parent_id'] = this.parentId;
    data['disabled'] = this.disabled;
    data['main_image'] = this.mainImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Translations {
  int? id;
  int? productCategoryId;
  String? locale;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;

  Translations(
      {this.id,
        this.productCategoryId,
        this.locale,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.description});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCategoryId = json['product_category_id'];
    locale = json['locale'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_category_id'] = this.productCategoryId;
    data['locale'] = this.locale;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
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
