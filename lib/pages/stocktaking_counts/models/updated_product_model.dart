class UpdatedProductModel {
  int? code;
  String? status;
  // Data? data;
  String? message;

  UpdatedProductModel({this.code, this.status, this.message});

  UpdatedProductModel.fromJson( json) {
    code = json['code'];
    status = json['status'];
    // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    // if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  dynamic? code;
  List<dynamic>? codes;
  double? price;
  bool? active;
  int? userId;
  String? shortDescription;
  String? createdAt;
  String? updatedAt;
  String? mainImage;
  bool? includeInDiscount;
  String? storedAt;
  double? weight;
  dynamic? minPrice;
  dynamic? minStock;
  String? videoUrl;
  dynamic? deliveryTime;
  double? shippingCost;
  dynamic? taxIncluded;
  bool? shippingCostByWeight;
  bool? shipmentCostMultiplied;
  bool? hasFreeShipping;
  int? supportTicketTypeId;
  dynamic? views;
  bool? hidePrice;
  double? purchasePrice;
  String? slug;
  dynamic? deletedAt;
  dynamic? assemblyPrice;
  dynamic? deletionReason;
  String? type;
  String? name;
  int? stock;
  String? description;
  int? quantity;
  dynamic? partNumber;
  dynamic? measurementUnit;
  bool? hasDiscount;
  Names? names;
  // List<dynamic>? partNumbers;
  // List<dynamic>? tags;
  Names? descriptions;
  Names? shortDescriptions;
  Category? category;
  SupportTicketType? supportTicketType;
  // List<dynamic>? attachments;
  Shop? shop;
  // List<dynamic>? discountRanges;
  // List<dynamic>? productCatalogs;
  // List<dynamic>? weightCosts;
  // List<dynamic>? productCoverageZones;
  dynamic? manufactureSupplier;
  // List<dynamic>? productSuppliers;
  // List<dynamic>? productGroups;
  List<Warehouses>? warehouses;
  List<ShopBranchesPrice>? shopBranchesPrice;
  Brand? brand;
  List<ProductPriceHistories>? productPriceHistories;
  List<ProductPurchasePriceHistories>? productPurchasePriceHistories;
  List<Machines>? machines;
  // List<dynamic>? machineParts;

  Data(
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
        this.assemblyPrice,
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
        // this.partNumbers,
        // this.tags,
        this.descriptions,
        this.shortDescriptions,
        this.category,
        this.supportTicketType,
        // this.attachments,
        this.shop,
        // this.discountRanges,
        // this.productCatalogs,
        // this.weightCosts,
        // this.productCoverageZones,
        this.manufactureSupplier,
        // this.productSuppliers,
        // this.productGroups,
        this.warehouses,
        this.shopBranchesPrice,
        this.brand,
        this.productPriceHistories,
        this.productPurchasePriceHistories,
        this.machines,
        // this.machineParts
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    // if (json['codes'] != null) {
    //   codes = <Null>[];
    //   json['codes'].forEach((v) {
    //     codes!.add(new Null.fromJson(v));
    //   });
    // }
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
    assemblyPrice = json['assembly_price'];
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
    // if (json['part_numbers'] != null) {
    //   partNumbers = <Null>[];
    //   json['part_numbers'].forEach((v) {
    //     partNumbers!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    descriptions = json['descriptions'] != null
        ? new Names.fromJson(json['descriptions'])
        : null;
    shortDescriptions = json['short_descriptions'] != null
        ? new Names.fromJson(json['short_descriptions'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    supportTicketType = json['support_ticket_type'] != null
        ? new SupportTicketType.fromJson(json['support_ticket_type'])
        : null;
    // if (json['attachments'] != null) {
    //   attachments = <Null>[];
    //   json['attachments'].forEach((v) {
    //     attachments!.add(new Null.fromJson(v));
    //   });
    // }
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
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
    manufactureSupplier = json['manufacture_supplier'];
    // if (json['product_suppliers'] != null) {
    //   productSuppliers = <Null>[];
    //   json['product_suppliers'].forEach((v) {
    //     productSuppliers!.add(new Null.fromJson(v));
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
    if (json['shop_branches_price'] != null) {
      shopBranchesPrice = <ShopBranchesPrice>[];
      json['shop_branches_price'].forEach((v) {
        shopBranchesPrice!.add(new ShopBranchesPrice.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['product_price_histories'] != null) {
      productPriceHistories = <ProductPriceHistories>[];
      json['product_price_histories'].forEach((v) {
        productPriceHistories!.add(new ProductPriceHistories.fromJson(v));
      });
    }
    if (json['product_purchase_price_histories'] != null) {
      productPurchasePriceHistories = <ProductPurchasePriceHistories>[];
      json['product_purchase_price_histories'].forEach((v) {
        productPurchasePriceHistories!
            .add(new ProductPurchasePriceHistories.fromJson(v));
      });
    }
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(new Machines.fromJson(v));
      });
    }
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
    if (this.codes != null) {
      data['codes'] = this.codes!.map((v) => v.toJson()).toList();
    }
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
    data['assembly_price'] = this.assemblyPrice;
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
    // if (this.partNumbers != null) {
    //   data['part_numbers'] = this.partNumbers!.map((v) => v.toJson()).toList();
    // }
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.toJson();
    }
    if (this.shortDescriptions != null) {
      data['short_descriptions'] = this.shortDescriptions!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.supportTicketType != null) {
      data['support_ticket_type'] = this.supportTicketType!.toJson();
    }
    // if (this.attachments != null) {
    //   data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    // }
    // if (this.shop != null) {
    //   data['shop'] = this.shop!.toJson();
    // }
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
    data['manufacture_supplier'] = this.manufactureSupplier;
    // if (this.productSuppliers != null) {
    //   data['product_suppliers'] =
    //       this.productSuppliers!.map((v) => v.toJson()).toList();
    // }
    // if (this.productGroups != null) {
    //   data['product_groups'] =
    //       this.productGroups!.map((v) => v.toJson()).toList();
    // }
    if (this.warehouses != null) {
      data['warehouses'] = this.warehouses!.map((v) => v.toJson()).toList();
    }
    if (this.shopBranchesPrice != null) {
      data['shop_branches_price'] =
          this.shopBranchesPrice!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.productPriceHistories != null) {
      data['product_price_histories'] =
          this.productPriceHistories!.map((v) => v.toJson()).toList();
    }
    if (this.productPurchasePriceHistories != null) {
      data['product_purchase_price_histories'] =
          this.productPurchasePriceHistories!.map((v) => v.toJson()).toList();
    }
    if (this.machines != null) {
      data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    }
    // if (this.machineParts != null) {
    //   data['machine_parts'] =
    //       this.machineParts!.map((v) => v.toJson()).toList();
    // }
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
  Null? key;
  Null? supportTicketTypeId;
  bool? showInSupportTicket;
  String? slug;
  Null? order;
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

class SupportTicketType {
  int? id;
  String? name;

  SupportTicketType({this.id, this.name});

  SupportTicketType.fromJson(Map<String, dynamic> json) {
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

class Warehouses {
  int? productWarehouseId;
  int? id;
  String? name;
  double? lat;
  double? long;
  bool? main;
  String? addressLine1;
  List<dynamic>? coverageZones;
  ShopBranch? shopBranch;
  int? stock;
  String? storagePlace;

  Warehouses(
      {this.productWarehouseId,
        this.id,
        this.name,
        this.lat,
        this.long,
        this.main,
        this.addressLine1,
        this.coverageZones,
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
    if (this.coverageZones != null) {
      data['coverage_zones'] =
          this.coverageZones!.map((v) => v.toJson()).toList();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['stock'] = this.stock;
    data['storage_place'] = this.storagePlace;
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

class ShopBranchesPrice {
  int? shopBranchProductPriceId;
  ShopBranch? shopBranch;
  int? price;

  ShopBranchesPrice(
      {this.shopBranchProductPriceId, this.shopBranch, this.price});

  ShopBranchesPrice.fromJson(Map<String, dynamic> json) {
    shopBranchProductPriceId = json['shop_branch_product_price_id'];
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_branch_product_price_id'] = this.shopBranchProductPriceId;
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['price'] = this.price;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? imageUrl;
  Names? names;

  Brand({this.id, this.name, this.imageUrl, this.names});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    return data;
  }
}

class ProductPriceHistories {
  int? price;
  String? createdAt;
  ShopBranch? shopBranch;
  UpdatedBy? updatedBy;

  ProductPriceHistories(
      {this.price, this.createdAt, this.shopBranch, this.updatedBy});

  ProductPriceHistories.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    createdAt = json['created_at'];
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    updatedBy = json['updated_by'] != null
        ? new UpdatedBy.fromJson(json['updated_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    if (this.updatedBy != null) {
      data['updated_by'] = this.updatedBy!.toJson();
    }
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

class ProductPurchasePriceHistories {
  int? price;
  String? createdAt;
  String? sourceType;
  int? sourceId;
  UpdatedBy? updatedBy;

  ProductPurchasePriceHistories(
      {this.price,
        this.createdAt,
        this.sourceType,
        this.sourceId,
        this.updatedBy});

  ProductPurchasePriceHistories.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    createdAt = json['created_at'];
    sourceType = json['source_type'];
    sourceId = json['source_id'];
    updatedBy = json['updated_by'] != null
        ? new UpdatedBy.fromJson(json['updated_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['source_type'] = this.sourceType;
    data['source_id'] = this.sourceId;
    if (this.updatedBy != null) {
      data['updated_by'] = this.updatedBy!.toJson();
    }
    return data;
  }
}

class Machines {
  int? productMachineProductId;
  int? id;
  String? name;
  String? imageUrl;
  Names? names;
  List<dynamic>? parts;

  Machines(
      {this.productMachineProductId,
        this.id,
        this.name,
        this.imageUrl,
        this.names,
        this.parts});

  Machines.fromJson(Map<String, dynamic> json) {
    productMachineProductId = json['product_machine_product_id'];
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    // if (json['parts'] != null) {
    //   parts = <Null>[];
    //   json['parts'].forEach((v) {
    //     parts!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_machine_product_id'] = this.productMachineProductId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
