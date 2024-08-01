class PurchaseOrdersDaily {
  int? code;
  String? status;
  Data? data;
  String? message;

  PurchaseOrdersDaily({this.code, this.status, this.data, this.message});

  PurchaseOrdersDaily.fromJson( json) {
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
  List<PurchaseOrderItem>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <PurchaseOrderItem>[];
      json['items'].forEach((v) {
        items!.add(new PurchaseOrderItem.fromJson(v));
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

class PurchaseOrderItem {
  int? id;
  String? number;
  String? state;
  int? askQuantity;
  double? askPrice;
  int? purchasedQuantity;
  double? purchasedPrice;
  dynamic purchasedInvoiceNumber;
  dynamic purchasedInvoiceDate;
  String? notes;
  String? createdAt;
  int? externalPurchaseOrderId;
  int? stockQuantity;
  int? refundQuantity;
  String? shipmentDate;
  String? barCode;
  dynamic rejectionReason;
  Shop? shop;
  User? user;
  AssignedTo? assignedTo;
  List<Attachments>? attachments;
  ProductSupplier? productSupplier;
  Product? product;
  ShopBranch? shopBranch;

  PurchaseOrderItem(
      {this.id,
        this.number,
        this.state,
        this.askQuantity,
        this.askPrice,
        this.purchasedQuantity,
        this.purchasedPrice,
        this.purchasedInvoiceNumber,
        this.purchasedInvoiceDate,
        this.notes,
        this.createdAt,
        this.externalPurchaseOrderId,
        this.stockQuantity,
        this.refundQuantity,
        this.shipmentDate,
        this.barCode,
        this.rejectionReason,
        this.shop,
        this.user,
        this.assignedTo,
        this.attachments,
        this.productSupplier,
        this.product,
        this.shopBranch});

  PurchaseOrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    state = json['state'];
    askQuantity = json['ask_quantity'];
    askPrice = json['ask_price'];
    purchasedQuantity = json['purchased_quantity'];
    purchasedPrice = json['purchased_price'];
    purchasedInvoiceNumber = json['purchased_invoice_number'];
    purchasedInvoiceDate = json['purchased_invoice_date'];
    notes = json['notes'];
    createdAt = json['created_at'];
    externalPurchaseOrderId = json['external_purchase_order_id'];
    stockQuantity = json['stock_quantity'];
    refundQuantity = json['refund_quantity'];
    shipmentDate = json['shipment_date'];
    barCode = json['bar_code'];
    rejectionReason = json['rejection_reason'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    assignedTo = json['assigned_to'] != null
        ? new AssignedTo.fromJson(json['assigned_to'])
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    productSupplier = json['product_supplier'] != null
        ? new ProductSupplier.fromJson(json['product_supplier'])
        : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['state'] = this.state;
    data['ask_quantity'] = this.askQuantity;
    data['ask_price'] = this.askPrice;
    data['purchased_quantity'] = this.purchasedQuantity;
    data['purchased_price'] = this.purchasedPrice;
    data['purchased_invoice_number'] = this.purchasedInvoiceNumber;
    data['purchased_invoice_date'] = this.purchasedInvoiceDate;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['external_purchase_order_id'] = this.externalPurchaseOrderId;
    data['stock_quantity'] = this.stockQuantity;
    data['refund_quantity'] = this.refundQuantity;
    data['shipment_date'] = this.shipmentDate;
    data['bar_code'] = this.barCode;
    data['rejection_reason'] = this.rejectionReason;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.productSupplier != null) {
      data['product_supplier'] = this.productSupplier!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
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

class User {
  int? id;
  String? name;
  String? email;
  String? phone;

  User({this.id, this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
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

class AssignedTo {
  int? id;
  String? name;
  String? email;
  String? phone;

  AssignedTo({this.id, this.name, this.email, this.phone});

  AssignedTo.fromJson(Map<String, dynamic> json) {
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

class ProductSupplier {
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
  Shop1? shop;
  Address? address;
  Country? country;

  ProductSupplier(
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
        this.country, this.shop});

  ProductSupplier.fromJson(Map<String, dynamic> json) {
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
    shop =
    json['shop'] != null ? new Shop1.fromJson(json['shop']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
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
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
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
  dynamic name;
  dynamic countryId;
  dynamic cityId;
  dynamic areaId;
  String? addressLine1;
  dynamic addressLine2;
  double? lat;
  double? long;
  dynamic zipCode;
  bool? isDefault;
  dynamic countryName;
  dynamic cityName;

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

class Product {
  int? id;
  String? name;
  String? createdAt;
  double? price;
  String? mainImage;
  dynamic mainPartNumber;
  int? stock;
  dynamic minStock;
  String? code;
  dynamic partNumber;

  Product(
      {this.id,
        this.name,
        this.createdAt,
        this.price,
        this.mainImage,
        this.mainPartNumber,
        this.stock,
        this.minStock,
        this.code,
        this.partNumber});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    price = json['price'];
    mainImage = json['main_image'];
    mainPartNumber = json['main_part_number'];
    stock = json['stock'];
    minStock = json['min_stock'];
    code = json['code'];
    partNumber = json['part_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['price'] = this.price;
    data['main_image'] = this.mainImage;
    data['main_part_number'] = this.mainPartNumber;
    data['stock'] = this.stock;
    data['min_stock'] = this.minStock;
    data['code'] = this.code;
    data['part_number'] = this.partNumber;
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


class Shop1 {
  int? id;
  String? name;
  dynamic description;
  String? email;
  String? phone;
  bool? authorized;
  String? imageUrl;
  dynamic coverImageUrl;
  dynamic bannerImageUrl;
  dynamic videoUrl;
  bool? isMarketplace;
  dynamic deliveryTime;
  double? rating;

  Shop1(
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

  Shop1.fromJson(Map<String, dynamic> json) {
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
