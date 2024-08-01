class ProfileModel {
  dynamic? code;
  String? status;
  Data? data;
  String? message;

  ProfileModel({this.code, this.status, this.data, this.message});

  ProfileModel.fromJson(json) {
    print("json ${json}");
    code = json['code']==401?200 :json['code'];
    status = json['status'];
    data = json['data'] != null && json['data'].toString() != "[]" && json['data'].toString() != "[]"  ? new Data.fromJson(json['data']) : null;
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
  dynamic? id;
  String? name;
  String? imageUrl;
  bool? blocked;
  String? email;
  String? phone;
  dynamic? languageId;
  dynamic? countryId;
  bool? isWholesale;
  String? role;
  List<Roles>? roles;
  Shop? shop;
  Data(
      {this.id,
        this.name,
        this.imageUrl,
        this.blocked,
        this.email,
        this.phone,
        this.languageId,
        this.countryId,
        this.isWholesale,
        this.role,
        this.roles,
      this.shop
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    blocked = json['blocked'];
    email = json['email'];
    phone = json['phone'];
    languageId = json['language_id'];
    countryId = json['country_id'];
    isWholesale = json['is_wholesale'];
    role = json['role'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['blocked'] = this.blocked;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['language_id'] = this.languageId;
    data['country_id'] = this.countryId;
    data['is_wholesale'] = this.isWholesale;
    data['role'] = this.role;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class Roles {
  dynamic? id;
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


class Shop {
  dynamic? id;
  bool? stopCanaryOrders;
  bool? online;
  bool? active;
  bool? authorized;
  String? bankName;
  String? bankIban;
  String? bankAccountNumber;
  String? accountHolderName;
  String? taxNumber;
  List<Taxes>? taxes;
  dynamic? lat;
  dynamic? long;
  String? imageUrl;
  String? coverImageUrl;
  String? bannerImageUrl;
  String? videoUrl;
  String? name;
  String? description;
  String? businessCategory;
  bool? isZatcaReady;
  String? phone;
  String? email;
  bool? hasStoreMenu;
  dynamic? invoiceFooterUrl;
  dynamic? invoiceHeaderUrl;
  List<DeliveryMethods>? deliveryMethods;
  bool? hasDelivery;
  bool? hasOnlinePayment;
  String? slug;
  bool? isMarketplace;
  bool? isWholesale;
  bool? isMarketplaceOnly;
  dynamic? deliveryTime;
  Country? country;
  bool? profileCompleted;
  dynamic? rating;
  List<ShopNames>? shopNames;
  // List<Null>? menuItems;
  List<ShopCategories>? shopCategories;
  List<Roles>? roles;
  Address? address;
  List<ProductsSlots>? productsSlots;

  Shop(
      {this.id,
        this.stopCanaryOrders,
        this.online,
        this.active,
        this.authorized,
        this.bankName,
        this.bankIban,
        this.bankAccountNumber,
        this.accountHolderName,
        this.taxNumber,
        this.taxes,
        this.lat,
        this.long,
        this.imageUrl,
        this.coverImageUrl,
        this.bannerImageUrl,
        this.videoUrl,
        this.name,
        this.description,
        this.businessCategory,
        this.isZatcaReady,
        this.phone,
        this.email,
        this.hasStoreMenu,
        this.invoiceFooterUrl,
        this.invoiceHeaderUrl,
        this.deliveryMethods,
        this.hasDelivery,
        this.hasOnlinePayment,
        this.slug,
        this.isMarketplace,
        this.isWholesale,
        this.isMarketplaceOnly,
        this.deliveryTime,
        this.country,
        this.profileCompleted,
        this.rating,
        this.shopNames,
        // this.menuItems,
        this.shopCategories,
        this.roles,
        this.address,
      this.productsSlots
      });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stopCanaryOrders = json['stop_canary_orders'];
    online = json['online'];
    active = json['active'];
    authorized = json['authorized'];
    bankName = json['bank_name'];
    bankIban = json['bank_iban'];
    bankAccountNumber = json['bank_account_number'];
    accountHolderName = json['account_holder_name'];
    taxNumber = json['tax_number'];
    if (json['taxes'] != null) {
      taxes = <Taxes>[];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
    lat = json['lat'];
    long = json['long'];
    imageUrl = json['image_url'];
    coverImageUrl = json['cover_image_url'];
    bannerImageUrl = json['banner_image_url'];
    videoUrl = json['video_url'];
    name = json['name'];
    description = json['description'];
    businessCategory = json['business_category'];
    isZatcaReady = json['is_zatca_ready'];
    phone = json['phone'];
    email = json['email'];
    hasStoreMenu = json['has_store_menu'];
    invoiceFooterUrl = json['invoice_footer_url'];
    invoiceHeaderUrl = json['invoice_header_url'];
    if (json['delivery_methods'] != null) {
      deliveryMethods = <DeliveryMethods>[];
      json['delivery_methods'].forEach((v) {
        deliveryMethods!.add(new DeliveryMethods.fromJson(v));
      });
    }
    hasDelivery = json['has_delivery'];
    hasOnlinePayment = json['has_online_payment'];
    slug = json['slug'];
    isMarketplace = json['is_marketplace'];
    isWholesale = json['is_wholesale'];
    isMarketplaceOnly = json['is_marketplace_only'];
    deliveryTime = json['delivery_time'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    profileCompleted = json['profile_completed'];
    rating = json['rating'];
    if (json['shop_names'] != null) {
      shopNames = <ShopNames>[];
      json['shop_names'].forEach((v) {
        shopNames!.add(new ShopNames.fromJson(v));
      });
    }
    // if (json['menu_items'] != null) {
    //   menuItems = <Null>[];
    //   json['menu_items'].forEach((v) {
    //     menuItems!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['shop_categories'] != null) {
      shopCategories = <ShopCategories>[];
      json['shop_categories'].forEach((v) {
        shopCategories!.add(new ShopCategories.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['products_slots'] != null) {
      productsSlots = <ProductsSlots>[];
      json['products_slots'].forEach((v) {
        productsSlots!.add(new ProductsSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stop_canary_orders'] = this.stopCanaryOrders;
    data['online'] = this.online;
    data['active'] = this.active;
    data['authorized'] = this.authorized;
    data['bank_name'] = this.bankName;
    data['bank_iban'] = this.bankIban;
    data['bank_account_number'] = this.bankAccountNumber;
    data['account_holder_name'] = this.accountHolderName;
    data['tax_number'] = this.taxNumber;
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['image_url'] = this.imageUrl;
    data['cover_image_url'] = this.coverImageUrl;
    data['banner_image_url'] = this.bannerImageUrl;
    data['video_url'] = this.videoUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['business_category'] = this.businessCategory;
    data['is_zatca_ready'] = this.isZatcaReady;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['has_store_menu'] = this.hasStoreMenu;
    data['invoice_footer_url'] = this.invoiceFooterUrl;
    data['invoice_header_url'] = this.invoiceHeaderUrl;
    if (this.deliveryMethods != null) {
      data['delivery_methods'] =
          this.deliveryMethods!.map((v) => v.toJson()).toList();
    }
    data['has_delivery'] = this.hasDelivery;
    data['has_online_payment'] = this.hasOnlinePayment;
    data['slug'] = this.slug;
    data['is_marketplace'] = this.isMarketplace;
    data['is_wholesale'] = this.isWholesale;
    data['is_marketplace_only'] = this.isMarketplaceOnly;
    data['delivery_time'] = this.deliveryTime;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['profile_completed'] = this.profileCompleted;
    data['rating'] = this.rating;
    if (this.shopNames != null) {
      data['shop_names'] = this.shopNames!.map((v) => v.toJson()).toList();
    }
    // if (this.menuItems != null) {
    //   data['menu_items'] = this.menuItems!.map((v) => v.toJson()).toList();
    // }
    if (this.shopCategories != null) {
      data['shop_categories'] =
          this.shopCategories!.map((v) => v.toJson()).toList();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.productsSlots != null) {
      data['products_slots'] =
          this.productsSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Taxes {
  dynamic? id;
  dynamic? shopId;
  String? name;
  dynamic? value;
  bool? defaultTax;
  String? createdAt;
  String? updatedAt;

  Taxes(
      {this.id,
        this.shopId,
        this.name,
        this.value,
        this.defaultTax,
        this.createdAt,
        this.updatedAt});

  Taxes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    value = json['value'];
    defaultTax = json['default_tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['value'] = this.value;
    data['default_tax'] = this.defaultTax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DeliveryMethods {
  dynamic? id;
  bool? disabled;
  String? code;
  dynamic? order;
  dynamic? key;
  String? name;

  DeliveryMethods(
      {this.id, this.disabled, this.code, this.order, this.key, this.name});

  DeliveryMethods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    disabled = json['disabled'];
    code = json['code'];
    order = json['order'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['disabled'] = this.disabled;
    data['code'] = this.code;
    data['order'] = this.order;
    data['key'] = this.key;
    data['name'] = this.name;
    return data;
  }
}

class Country {
  dynamic? id;
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

class ShopNames {
  dynamic? id;
  dynamic? shopId;
  String? locale;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? businessCategory;

  ShopNames(
      {this.id,
        this.shopId,
        this.locale,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.description,
        this.businessCategory});

  ShopNames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    locale = json['locale'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    businessCategory = json['business_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['locale'] = this.locale;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['business_category'] = this.businessCategory;
    return data;
  }
}

class ShopCategories {
  dynamic? id;
  String? key;
  String? homeType;
  List<NamesLang>? names;

  ShopCategories({this.id, this.key, this.homeType, this.names});

  ShopCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    homeType = json['home_type'];
    if (json['names'] != null) {
      names = <NamesLang>[];
      json['names'].forEach((v) {
        names!.add(new NamesLang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['home_type'] = this.homeType;
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NamesLang {
  String? language;
  String? name;

  NamesLang({this.language, this.name});

  NamesLang.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['name'] = this.name;
    return data;
  }
}

class Address {
  dynamic? id;
  dynamic? name;
  dynamic? countryId;
  dynamic? cityId;
  dynamic? areaId;
  String? addressLine1;
  dynamic? addressLine2;
  dynamic? lat;
  dynamic? long;
  dynamic? zipCode;
  bool? isDefault;
  dynamic? countryName;
  dynamic? cityName;

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

class ProductsSlots {
  dynamic? id;
  dynamic? name;
  dynamic? order;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  ProductsSlots(
      {this.id,
        this.name,
        this.order,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
      this.products
      });

  ProductsSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Products {
  dynamic? id;
  String? code;
  List<String>? codes;
  dynamic? price;
  bool? active;
  dynamic? userId;
  dynamic? shortDescription;
  String? createdAt;
  String? updatedAt;
  String? mainImage;
  bool? includeInDiscount;
  dynamic? storedAt;
  dynamic? weight;
  dynamic? minPrice;
  dynamic? minStock;
  String? videoUrl;
  dynamic? deliveryTime;
  dynamic? shippingCost;
  bool? taxIncluded;
  bool? shippingCostByWeight;
  bool? shipmentCostMultiplied;
  bool? hasFreeShipping;
  dynamic? supportTicketTypeId;
  dynamic? views;
  bool? hidePrice;
  dynamic? purchasePrice;
  String? slug;
  dynamic? deletedAt;
  dynamic? deletionReason;
  String? type;
  String? name;
  dynamic? stock;
  String? description;
  dynamic? quantity;
  String? partNumber;
  String? measurementUnit;
  bool? hasDiscount;
  Names? names;
  List<PartNumbers>? partNumbers;
  // List<Null>? tags;
  UnitType? unitType;
  Names? descriptions;
  ShortDescriptions? shortDescriptions;
  Category? category;
  List<Attachments>? attachments;
  ShopBranch? shop;
  // List<Null>? discountRanges;
  // List<Null>? productCatalogs;
  // List<Null>? weightCosts;
  // List<Null>? productCoverageZones;
  // List<Null>? productGroups;
  List<Warehouses>? warehouses;
  // List<Null>? productPriceHistories;
  // List<Null>? productPurchasePriceHistories;
  // List<Null>? machines;
  // List<Null>? machineParts;

  Products(
      {this.id,
        this.code,
        this.codes,
        this.price,
        this.active,
        this.userId,
        this.shortDescription,
        this.createdAt,
        this.updatedAt,
        this.mainImage,
        this.includeInDiscount,
        this.storedAt,
        this.weight,
        this.minPrice,
        this.minStock,
        this.videoUrl,
        this.deliveryTime,
        this.shippingCost,
        this.taxIncluded,
        this.shippingCostByWeight,
        this.shipmentCostMultiplied,
        this.hasFreeShipping,
        this.supportTicketTypeId,
        this.views,
        this.hidePrice,
        this.purchasePrice,
        this.slug,
        this.deletedAt,
        this.deletionReason,
        this.type,
        this.name,
        this.stock,
        this.description,
        this.quantity,
        this.partNumber,
        this.measurementUnit,
        this.hasDiscount,
        this.names,
        this.partNumbers,
        // this.tags,
        this.unitType,
        this.descriptions,
        this.shortDescriptions,
        this.category,
        this.attachments,
        this.shop,
        // this.discountRanges,
        // this.productCatalogs,
        // this.weightCosts,
        // this.productCoverageZones,
        // this.productGroups,
        this.warehouses,
        // this.productPriceHistories,
        // this.productPurchasePriceHistories,
        // this.machines,
        // this.machineParts
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    codes = json['codes'].cast<String>();
    price = json['price'];
    active = json['active'];
    userId = json['user_id'];
    shortDescription = json['short_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mainImage = json['main_image'];
    includeInDiscount = json['include_in_discount'];
    storedAt = json['stored_at'];
    weight = json['weight'];
    minPrice = json['min_price'];
    minStock = json['min_stock'];
    videoUrl = json['video_url'];
    deliveryTime = json['delivery_time'];
    shippingCost = json['shipping_cost'];
    taxIncluded = json['tax_included'];
    shippingCostByWeight = json['shipping_cost_by_weight'];
    shipmentCostMultiplied = json['shipment_cost_multiplied'];
    hasFreeShipping = json['has_free_shipping'];
    supportTicketTypeId = json['support_ticket_type_id'];
    views = json['views'];
    hidePrice = json['hide_price'];
    purchasePrice = json['purchase_price'];
    slug = json['slug'];
    deletedAt = json['deleted_at'];
    deletionReason = json['deletion_reason'];
    type = json['type'];
    name = json['name'];
    stock = json['stock'];
    description = json['description'];
    quantity = json['quantity'];
    partNumber = json['part_number'];
    measurementUnit = json['measurement_unit'];
    hasDiscount = json['has_discount'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    if (json['part_numbers'] != null) {
      partNumbers = <PartNumbers>[];
      json['part_numbers'].forEach((v) {
        partNumbers!.add(new PartNumbers.fromJson(v));
      });
    }
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    unitType = json['unit_type'] != null
        ? new UnitType.fromJson(json['unit_type'])
        : null;
    descriptions = json['descriptions'] != null
        ? new Names.fromJson(json['descriptions'])
        : null;
    shortDescriptions = json['short_descriptions'] != null
        ? new ShortDescriptions.fromJson(json['short_descriptions'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    shop = json['shop'] != null ? new ShopBranch.fromJson(json['shop']) : null;
    // if (json['discount_ranges'] != null) {
    //   discountRanges = <Null>[];
    //   json['discount_ranges'].forEach((v) {
    //     discountRanges!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['product_catalogs'] != null) {
    //   productCatalogs = <Null>[];
    //   json['product_catalogs'].forEach((v) {
    //     productCatalogs!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['weight_costs'] != null) {
    //   weightCosts = <Null>[];
    //   json['weight_costs'].forEach((v) {
    //     weightCosts!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['product_coverage_zones'] != null) {
    //   productCoverageZones = <Null>[];
    //   json['product_coverage_zones'].forEach((v) {
    //     productCoverageZones!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['product_groups'] != null) {
    //   productGroups = <Null>[];
    //   json['product_groups'].forEach((v) {
    //     productGroups!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouses.fromJson(v));
      });
    }
    // if (json['product_price_histories'] != null) {
    //   productPriceHistories = <Null>[];
    //   json['product_price_histories'].forEach((v) {
    //     productPriceHistories!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['product_purchase_price_histories'] != null) {
    //   productPurchasePriceHistories = <Null>[];
    //   json['product_purchase_price_histories'].forEach((v) {
    //     productPurchasePriceHistories!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['machines'] != null) {
    //   machines = <Null>[];
    //   json['machines'].forEach((v) {
    //     machines!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['machine_parts'] != null) {
    //   machineParts = <Null>[];
    //   json['machine_parts'].forEach((v) {
    //     machineParts!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['codes'] = this.codes;
    data['price'] = this.price;
    data['active'] = this.active;
    data['user_id'] = this.userId;
    data['short_description'] = this.shortDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['main_image'] = this.mainImage;
    data['include_in_discount'] = this.includeInDiscount;
    data['stored_at'] = this.storedAt;
    data['weight'] = this.weight;
    data['min_price'] = this.minPrice;
    data['min_stock'] = this.minStock;
    data['video_url'] = this.videoUrl;
    data['delivery_time'] = this.deliveryTime;
    data['shipping_cost'] = this.shippingCost;
    data['tax_included'] = this.taxIncluded;
    data['shipping_cost_by_weight'] = this.shippingCostByWeight;
    data['shipment_cost_multiplied'] = this.shipmentCostMultiplied;
    data['has_free_shipping'] = this.hasFreeShipping;
    data['support_ticket_type_id'] = this.supportTicketTypeId;
    data['views'] = this.views;
    data['hide_price'] = this.hidePrice;
    data['purchase_price'] = this.purchasePrice;
    data['slug'] = this.slug;
    data['deleted_at'] = this.deletedAt;
    data['deletion_reason'] = this.deletionReason;
    data['type'] = this.type;
    data['name'] = this.name;
    data['stock'] = this.stock;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['part_number'] = this.partNumber;
    data['measurement_unit'] = this.measurementUnit;
    data['has_discount'] = this.hasDiscount;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    if (this.partNumbers != null) {
      data['part_numbers'] = this.partNumbers!.map((v) => v.toJson()).toList();
    }
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    if (this.unitType != null) {
      data['unit_type'] = this.unitType!.toJson();
    }
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.toJson();
    }
    if (this.shortDescriptions != null) {
      data['short_descriptions'] = this.shortDescriptions!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    // if (this.discountRanges != null) {
    //   data['discount_ranges'] =
    //       this.discountRanges!.map((v) => v.toJson()).toList();
    // }
    // if (this.productCatalogs != null) {
    //   data['product_catalogs'] =
    //       this.productCatalogs!.map((v) => v.toJson()).toList();
    // }
    // if (this.weightCosts != null) {
    //   data['weight_costs'] = this.weightCosts!.map((v) => v.toJson()).toList();
    // }
    // if (this.productCoverageZones != null) {
    //   data['product_coverage_zones'] =
    //       this.productCoverageZones!.map((v) => v.toJson()).toList();
    // }
    // if (this.productGroups != null) {
    //   data['product_groups'] =
    //       this.productGroups!.map((v) => v.toJson()).toList();
    // }
    if (this.warehouses != null) {
      data['warehouses'] = this.warehouses!.map((v) => v.toJson()).toList();
    }
    // if (this.productPriceHistories != null) {
    //   data['product_price_histories'] =
    //       this.productPriceHistories!.map((v) => v.toJson()).toList();
    // }
    // if (this.productPurchasePriceHistories != null) {
    //   data['product_purchase_price_histories'] =
    //       this.productPurchasePriceHistories!.map((v) => v.toJson()).toList();
    // }
    // if (this.machines != null) {
    //   data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    // }
    // if (this.machineParts != null) {
    //   data['machine_parts'] =
    //       this.machineParts!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}



class PartNumbers {
  dynamic? id;
  String? code;
  bool? isMain;

  PartNumbers({this.id, this.code, this.isMain});

  PartNumbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    isMain = json['is_main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['is_main'] = this.isMain;
    return data;
  }
}

class UnitType {
  dynamic? id;
  String? name;

  UnitType({this.id, this.name});

  UnitType.fromJson(Map<String, dynamic> json) {
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

class ShortDescriptions {
  dynamic? en;
  dynamic? ar;

  ShortDescriptions({this.en, this.ar});

  ShortDescriptions.fromJson(Map<String, dynamic> json) {
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

class Category {
  dynamic? id;
  dynamic? shopId;
  String? createdAt;
  String? updatedAt;
  bool? disabled;
  dynamic? parentId;
  dynamic? userId;
  dynamic? key;
  dynamic? supportTicketTypeId;
  bool? showInSupportTicket;
  String? slug;
  dynamic? order;
  String? name;
  dynamic? description;

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

class Attachments {
  dynamic? id;
  String? imageUrl;

  Attachments({this.id, this.imageUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    return data;
  }
}



class Names {
  dynamic? ur;
  String? en;
  String? ar;

  Names({this.ur, this.en, this.ar});

  Names.fromJson(Map<String, dynamic> json) {
    ur = json['ur'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ur'] = this.ur;
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Warehouses {
  dynamic? productWarehouseId;
  dynamic? id;
  String? name;
  dynamic? lat;
  dynamic? long;
  bool? main;
  String? addressLine1;
  // List<Null>? coverageZones;
  ShopBranch? shopBranch;
  dynamic? stock;
  dynamic? storagePlace;

  Warehouses(
      {this.productWarehouseId,
        this.id,
        this.name,
        this.lat,
        this.long,
        this.main,
        this.addressLine1,
        // this.coverageZones,
        this.shopBranch,
        this.stock,
        this.storagePlace});

  Warehouses.fromJson(Map<String, dynamic> json) {
    productWarehouseId = json['product_warehouse_id'];
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    main = json['main'];
    addressLine1 = json['address_line1'];
    // if (json['coverage_zones'] != null) {
    //   coverageZones = <Null>[];
    //   json['coverage_zones'].forEach((v) {
    //     coverageZones!.add(new Null.fromJson(v));
    //   });
    // }
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    stock = json['stock'];
    storagePlace = json['storage_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_warehouse_id'] = this.productWarehouseId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['main'] = this.main;
    data['address_line1'] = this.addressLine1;
    // if (this.coverageZones != null) {
    //   data['coverage_zones'] =
    //       this.coverageZones!.map((v) => v.toJson()).toList();
    // }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['stock'] = this.stock;
    data['storage_place'] = this.storagePlace;
    return data;
  }
}

class ShopBranch {
  dynamic? id;
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


