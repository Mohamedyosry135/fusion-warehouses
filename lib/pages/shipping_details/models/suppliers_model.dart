class SuppliersModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  SuppliersModel({this.code, this.status, this.data, this.message});

  SuppliersModel.fromJson( json) {
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
  List<Supplier>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Supplier>[];
      json['items'].forEach((v) {
        items!.add(new Supplier.fromJson(v));
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

class Supplier {
  int? id;
  String? name;
  String? email;
  String? phone;
  double? credit;
  bool? active;
  double? totalInvoices;
  String? website;
  String? imageUrl;
  List<Attachments>? attachments;
  Address? address;
  Country? country;
  Shop? shop;

  Supplier(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.credit,
        this.active,
        this.totalInvoices,
        this.website,
        this.imageUrl,
        this.attachments,
        this.address,
        this.country,
        this.shop});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    credit = json['credit'];
    active = json['active'];
    totalInvoices = json['total_invoices'];
    website = json['website'];
    imageUrl = json['image_url'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['credit'] = this.credit;
    data['active'] = this.active;
    data['total_invoices'] = this.totalInvoices;
    data['website'] = this.website;
    data['image_url'] = this.imageUrl;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class Attachments {
  int? id;
  String? imageUrl;
  String? name;

  Attachments({this.id, this.imageUrl, this.name});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
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
  Null? zipCode;
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

class Shop {
  int? id;
  String? name;
  String? description;
  String? email;
  String? phone;
  bool? authorized;
  String? imageUrl;
  String? coverImageUrl;
  String? bannerImageUrl;
  String? videoUrl;
  bool? isMarketplace;
  double? deliveryTime;
  double? rating;

  Shop(
      {this.id,
        this.name,
        this.description,
        this.email,
        this.phone,
        this.authorized,
        this.imageUrl,
        this.coverImageUrl,
        this.bannerImageUrl,
        this.videoUrl,
        this.isMarketplace,
        this.deliveryTime,
        this.rating});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    email = json['email'];
    phone = json['phone'];
    authorized = json['authorized'];
    imageUrl = json['image_url'];
    coverImageUrl = json['cover_image_url'];
    bannerImageUrl = json['banner_image_url'];
    videoUrl = json['video_url'];
    isMarketplace = json['is_marketplace'];
    deliveryTime = json['delivery_time'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['authorized'] = this.authorized;
    data['image_url'] = this.imageUrl;
    data['cover_image_url'] = this.coverImageUrl;
    data['banner_image_url'] = this.bannerImageUrl;
    data['video_url'] = this.videoUrl;
    data['is_marketplace'] = this.isMarketplace;
    data['delivery_time'] = this.deliveryTime;
    data['rating'] = this.rating;
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
