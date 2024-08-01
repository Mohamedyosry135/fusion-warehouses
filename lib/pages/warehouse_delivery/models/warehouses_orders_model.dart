import 'package:get/get.dart';

class WarehousesOrdersModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  WarehousesOrdersModel({this.code, this.status, this.data, this.message});

  WarehousesOrdersModel.fromJson(json) {
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
  List<WarehouseOrderDetails>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <WarehouseOrderDetails>[];
      json['items'].forEach((v) {
        items!.add(new WarehouseOrderDetails.fromJson(v));
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

class WarehouseOrderDetails {
  int? id;
  String? number;
  String? status;
  String? orderType;
  int? invoiceId;
  String? createdAt;
  String? updatedAt;
  Warehouse? warehouse;
  Invoice? invoice;
  AssignedTo? assignedTo;
  ShopBranch? shopBranch;
  List<WarehouseOrderItems>? warehouseOrderItems;

  WarehouseOrderDetails(
      {this.id,
        this.number,
        this.status,
        this.orderType,
        this.invoiceId,
        this.createdAt,
        this.updatedAt,
        this.warehouse,
        this.invoice,
        this.assignedTo,
        this.shopBranch,
        this.warehouseOrderItems});

  WarehouseOrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    status = json['status'];
    orderType = json['order_type'];
    invoiceId = json['invoice_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    invoice =
    json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
    assignedTo = json['assigned_to'] != null
        ? new AssignedTo.fromJson(json['assigned_to'])
        : null;
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    if (json['warehouse_order_items'] != null) {
      warehouseOrderItems = <WarehouseOrderItems>[];
      json['warehouse_order_items'].forEach((v) {
        warehouseOrderItems!.add(new WarehouseOrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['invoice_id'] = this.invoiceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.toJson();
    }
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    if (this.warehouseOrderItems != null) {
      data['warehouse_order_items'] =
          this.warehouseOrderItems!.map((v) => v.toJson()).toList();
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

class Invoice {
  String? number;
  Customer? customer;

  Invoice({this.number, this.customer});

  Invoice.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;

  Customer(
      {this.customerId,
        this.customerName,
        this.customerEmail,
        this.customerPhone});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
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

class WarehouseOrderItems {
  int? id;
  String? description;
  String? name;
  String? code;
  double? unitPrice;
  int? quantity;
  String? mainImage;
  ProductCategory? productCategory;
  String? partNumber;
  List<PartNumbers>? partNumbers;
  String? storagePlace;
  RxBool isChecked = false.obs;
  WarehouseOrderItems(
      {this.id,
        this.description,
        this.name,
        this.code,
        this.unitPrice,
        this.quantity,
        this.mainImage,
        this.productCategory,
        this.partNumber,
        this.partNumbers,
        this.storagePlace,

      } );

  WarehouseOrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    name = json['name'];
    code = json['code'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    mainImage = json['main_image'];
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    partNumber = json['part_number'];
    if (json['part_numbers'] != null) {
      partNumbers = <PartNumbers>[];
      json['part_numbers'].forEach((v) {
        partNumbers!.add(new PartNumbers.fromJson(v));
      });
    }
    storagePlace = json['storage_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['name'] = this.name;
    data['code'] = this.code;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['main_image'] = this.mainImage;
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
    data['part_number'] = this.partNumber;
    if (this.partNumbers != null) {
      data['part_numbers'] = this.partNumbers!.map((v) => v.toJson()).toList();
    }
    data['storage_place'] = this.storagePlace;
    return data;
  }
}

class ProductCategory {
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

  ProductCategory(
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

  ProductCategory.fromJson(Map<String, dynamic> json) {
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

class PartNumbers {
  int? id;
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
