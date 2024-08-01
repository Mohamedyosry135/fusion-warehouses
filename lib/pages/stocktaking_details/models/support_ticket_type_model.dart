class SupportTicketTypeModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  SupportTicketTypeModel({this.code, this.status, this.data, this.message});

  SupportTicketTypeModel.fromJson(json) {
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
  List<SupportTicketTypeItem>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <SupportTicketTypeItem>[];
      json['items'].forEach((v) {
        items!.add(new SupportTicketTypeItem.fromJson(v));
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

class SupportTicketTypeItem {
  int? id;
  String? name;
  Names? names;
  List<Users>? users;
  List<ProductCategories>? productCategories;

  SupportTicketTypeItem({this.id, this.name, this.names, this.users, this.productCategories});

  SupportTicketTypeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    if (json['product_categories'] != null) {
      productCategories = <ProductCategories>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(new ProductCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.productCategories != null) {
      data['product_categories'] =
          this.productCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  String? ar;
  String? en;

  Names({this.ar, this.en});

  Names.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class Users {
  int? id;
  bool? authorized;
  String? name;
  String? imageUrl;
  bool? isMarketplace;
  double? rating;
  String? type;
  ShopBranch? shopBranch;
  dynamic? workshopCategory;
  bool? blocked;
  bool? active;
  bool? online;
  bool? isDriver;
  String? email;
  String? phone;
  int? languageId;
  int? countryId;
  String? createdAt;
  String? updatedAt;
  bool? workingInSupport;
  String? role;
  List<Roles>? roles;

  Users(
      {this.id,
        this.authorized,
        this.name,
        this.imageUrl,
        this.isMarketplace,
        this.rating,
        this.type,
        this.shopBranch,
        this.workshopCategory,
        this.blocked,
        this.active,
        this.online,
        this.isDriver,
        this.email,
        this.phone,
        this.languageId,
        this.countryId,
        this.createdAt,
        this.updatedAt,
        this.workingInSupport,
        this.role,
        this.roles});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorized = json['authorized'];
    name = json['name'];
    imageUrl = json['image_url'];
    isMarketplace = json['is_marketplace'];
    rating = json['rating'];
    type = json['type'];
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    workshopCategory = json['workshop_category'];
    blocked = json['blocked'];
    active = json['active'];
    online = json['online'];
    isDriver = json['is_driver'];
    email = json['email'];
    phone = json['phone'];
    languageId = json['language_id'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    workingInSupport = json['working_in_support'];
    role = json['role'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorized'] = this.authorized;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['is_marketplace'] = this.isMarketplace;
    data['rating'] = this.rating;
    data['type'] = this.type;
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['workshop_category'] = this.workshopCategory;
    data['blocked'] = this.blocked;
    data['active'] = this.active;
    data['online'] = this.online;
    data['is_driver'] = this.isDriver;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['language_id'] = this.languageId;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['working_in_support'] = this.workingInSupport;
    data['role'] = this.role;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
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

class Roles {
  int? id;
  String? name;
  String? key;

  Roles({this.id, this.name, this.key});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['key'] = this.key;
    return data;
  }
}

class ProductCategories {
  int? id;
  String? name;
  String? description;
  List<Translations>? translations;
  String? slug;
  dynamic? parentId;
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
