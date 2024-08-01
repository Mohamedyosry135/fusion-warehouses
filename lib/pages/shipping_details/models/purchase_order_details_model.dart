import 'package:fusion_warehouses/pages/login/model/individual.dart';

class PurchaseOrderDetails {
  int? code;
  String? status;
  Data? data;
  String? message;

  PurchaseOrderDetails({this.code, this.status, this.data, this.message});

  PurchaseOrderDetails.fromJson( json) {
    print("dsfdsf ${json}");
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
  int? id;
  String? number;
  String? state;
  String? notes;
  double? purchasedPrice;
  dynamic purchasedInvoiceNumber;
  dynamic purchasedInvoiceDate;
  String? createdAt;
  bool? emailSent;
  bool? wholeSales;
  dynamic expire;
  bool? wasWholesale;
  dynamic wholesaleNumber;
  dynamic purchasedAt;
  dynamic processingAt;
  dynamic completedAt;
  String? cancelledAt;
  dynamic rejectedAt;
  String? rejectionReason;
  List<PurchaseOrders>? purchaseOrders;
  List<PurchaseOrdersRemoveHistories>? purchaseOrdersRemoveHistories;
  User? user;
  User? assignedTo;
  User? cancelledBy;
  List<Attachments>? attachments;
  ProductSupplier? productSupplier;
  List<SupplierInvoices>? supplierInvoices;
  List<dynamic>? offers;
  dynamic acceptedOffer;

  Data(
      {this.id,
        this.number,
        this.state,
        this.notes,
        this.purchasedPrice,
        this.purchasedInvoiceNumber,
        this.purchasedInvoiceDate,
        this.createdAt,
        this.emailSent,
        this.wholeSales,
        this.expire,
        this.wasWholesale,
        this.wholesaleNumber,
        this.purchasedAt,
        this.processingAt,
        this.completedAt,
        this.cancelledAt,
        this.rejectedAt,
        this.rejectionReason,
        this.purchaseOrders,
        this.purchaseOrdersRemoveHistories,
        this.user,
        this.assignedTo,
        this.cancelledBy,
        this.attachments,
        this.productSupplier,
        this.supplierInvoices,
        this.offers,
        this.acceptedOffer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    state = json['state'];
    notes = json['notes'];
    purchasedPrice = json['purchased_price'];
    purchasedInvoiceNumber = json['purchased_invoice_number'];
    purchasedInvoiceDate = json['purchased_invoice_date'];
    createdAt = json['created_at'];
    emailSent = json['email_sent'];
    wholeSales = json['whole_sales'];
    expire = json['expire'];
    wasWholesale = json['was_wholesale'];
    wholesaleNumber = json['wholesale_number'];
    purchasedAt = json['purchased_at'];
    processingAt = json['processing_at'];
    completedAt = json['completed_at'];
    cancelledAt = json['cancelled_at'];
    rejectedAt = json['rejected_at'];
    rejectionReason = json['rejection_reason'];
    if (json['purchase_orders'] != null) {
      purchaseOrders = <PurchaseOrders>[];
      json['purchase_orders'].forEach((v) {
        purchaseOrders!.add(new PurchaseOrders.fromJson(v));
      });
    }
    if (json['purchase_orders_remove_histories'] != null) {
      purchaseOrdersRemoveHistories = <PurchaseOrdersRemoveHistories>[];
      json['purchase_orders_remove_histories'].forEach((v) {
        purchaseOrdersRemoveHistories!
            .add(new PurchaseOrdersRemoveHistories.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    assignedTo = json['assigned_to'] != null
        ? new User.fromJson(json['assigned_to'])
        : null;
    cancelledBy = json['cancelled_by'] != null
        ? new User.fromJson(json['cancelled_by'])
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
    if (json['supplier_invoices'] != null) {
      supplierInvoices = <SupplierInvoices>[];
      json['supplier_invoices'].forEach((v) {
        supplierInvoices!.add(new SupplierInvoices.fromJson(v));
      });
    }
    offers = json['offers'];
    // if (json['offers'] != null) {
    //   offers = <Null>[];
    //   json['offers'].forEach((v) {
    //     offers!.add(new Null.fromJson(v));
    //   });
    // }
    acceptedOffer = json['accepted_offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['state'] = this.state;
    data['notes'] = this.notes;
    data['purchased_price'] = this.purchasedPrice;
    data['purchased_invoice_number'] = this.purchasedInvoiceNumber;
    data['purchased_invoice_date'] = this.purchasedInvoiceDate;
    data['created_at'] = this.createdAt;
    data['email_sent'] = this.emailSent;
    data['whole_sales'] = this.wholeSales;
    data['expire'] = this.expire;
    data['was_wholesale'] = this.wasWholesale;
    data['wholesale_number'] = this.wholesaleNumber;
    data['purchased_at'] = this.purchasedAt;
    data['processing_at'] = this.processingAt;
    data['completed_at'] = this.completedAt;
    data['cancelled_at'] = this.cancelledAt;
    data['rejected_at'] = this.rejectedAt;
    data['rejection_reason'] = this.rejectionReason;
    if (this.purchaseOrders != null) {
      data['purchase_orders'] =
          this.purchaseOrders!.map((v) => v.toJson()).toList();
    }
    if (this.purchaseOrdersRemoveHistories != null) {
      data['purchase_orders_remove_histories'] =
          this.purchaseOrdersRemoveHistories!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    if (this.cancelledBy != null) {
      data['cancelled_by'] = this.cancelledBy!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.productSupplier != null) {
      data['product_supplier'] = this.productSupplier!.toJson();
    }
    if (this.supplierInvoices != null) {
      data['supplier_invoices'] =
          this.supplierInvoices!.map((v) => v.toJson()).toList();
    }
    data['offers'] = this.offers;
    // if (this.offers != null) {
    //   data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    // }
    data['accepted_offer'] = this.acceptedOffer;
    return data;
  }
}

class PurchaseOrders {
  dynamic id;
  String? number;
  String? state;
  dynamic askQuantity;
  dynamic askPrice;
  dynamic purchasedQuantity;
  double? purchasedPrice;
  dynamic purchasedInvoiceNumber;
  dynamic purchasedInvoiceDate;
  String? notes;
  String? createdAt;
  dynamic externalPurchaseOrderId;
  dynamic stockQuantity;
  dynamic refundQuantity;
  String? shipmentDate;
  String? barCode;
  dynamic rejectionReason;
  Shop? shop;
  User? user;
  User? assignedTo;
  List<Attachments>? attachments;
  ProductSupplier? productSupplier;
  Product? product;
  ShopBranch? shopBranch;

  PurchaseOrders(
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

  PurchaseOrders.fromJson(Map<String, dynamic> json) {
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
        ? new User.fromJson(json['assigned_to'])
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
  dynamic id;
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
  dynamic id;
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
  dynamic id;
  String? name;
  dynamic email;
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
  dynamic id;
  String? name;
  String? email;
  String? phone;
  dynamic credit;
  bool? active;
  dynamic totalInvoices;
  String? website;
  dynamic imageUrl;
  List<Attachments>? attachments;
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
        this.country});

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
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Attachments {
  dynamic id;
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
  dynamic id;
  dynamic name;
  dynamic countryId;
  dynamic cityId;
  dynamic areaId;
  String? addressLine1;
  dynamic addressLine2;
  dynamic lat;
  dynamic long;
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
  dynamic id;
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
  dynamic id;
  String? name;
  String? createdAt;
  dynamic price;
  dynamic mainImage;
  dynamic mainPartNumber;
  dynamic stock;
  dynamic minStock;
  dynamic code;
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
  dynamic id;
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





class PurchaseOrdersRemoveHistories {
  dynamic id;
  String? createdAt;
  String? reason;
  User? user;
  PurchaseOrder? purchaseOrder;
  ShopBranch? shopBranch;

  PurchaseOrdersRemoveHistories(
      {this.id,
        this.createdAt,
        this.reason,
        this.user,
        this.purchaseOrder,
        this.shopBranch});

  PurchaseOrdersRemoveHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    reason = json['reason'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    purchaseOrder = json['purchase_order'] != null
        ? new PurchaseOrder.fromJson(json['purchase_order'])
        : null;
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['reason'] = this.reason;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.purchaseOrder != null) {
      data['purchase_order'] = this.purchaseOrder!.toJson();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    return data;
  }
}

class PurchaseOrder {
  dynamic id;
  String? number;
  String? state;
  dynamic askQuantity;
  double? askPrice;
  dynamic purchasedQuantity;
  dynamic purchasedPrice;
  dynamic purchasedInvoiceNumber;
  dynamic purchasedInvoiceDate;
  String? notes;
  dynamic rejectionReason;
  String? createdAt;
  User? user;
  User? assignedTo;
  Product? product;

  PurchaseOrder(
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
        this.rejectionReason,
        this.createdAt,
        this.user,
        this.assignedTo,
        this.product});

  PurchaseOrder.fromJson(Map<String, dynamic> json) {
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
    rejectionReason = json['rejection_reason'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    assignedTo = json['assigned_to'] != null
        ? new User.fromJson(json['assigned_to'])
        : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
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
    data['rejection_reason'] = this.rejectionReason;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}



class SupplierInvoices {
  dynamic purchasedPrice;
  String? purchasedInvoiceNumber;
  String? purchasedInvoiceDate;
  String? invoiceType;
  String? productSupplierName;
  String? paymentType;
  dynamic attachment;

  SupplierInvoices(
      {this.purchasedPrice,
        this.purchasedInvoiceNumber,
        this.purchasedInvoiceDate,
        this.invoiceType,
        this.productSupplierName,
        this.paymentType,
        this.attachment});

  SupplierInvoices.fromJson(Map<String, dynamic> json) {
    purchasedPrice = json['purchased_price'];
    purchasedInvoiceNumber = json['purchased_invoice_number'];
    purchasedInvoiceDate = json['purchased_invoice_date'];
    invoiceType = json['invoice_type'];
    productSupplierName = json['product_supplier_name'];
    paymentType = json['payment_type'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchased_price'] = this.purchasedPrice;
    data['purchased_invoice_number'] = this.purchasedInvoiceNumber;
    data['purchased_invoice_date'] = this.purchasedInvoiceDate;
    data['invoice_type'] = this.invoiceType;
    data['product_supplier_name'] = this.productSupplierName;
    data['payment_type'] = this.paymentType;
    data['attachment'] = this.attachment;
    return data;
  }
}
