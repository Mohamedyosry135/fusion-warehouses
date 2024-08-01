class OrderInvoiceModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  OrderInvoiceModel({this.code, this.status, this.data, this.message});

  OrderInvoiceModel.fromJson( json) {
    print("ksdjlfksdf ${json}");
    code = json['code'];
    status = json['status'];
    data = json['data'] != null&& json['data'].toString() != "[]"   ? new Data.fromJson(json['data']) : null;
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
  String? status;
  dynamic date;
  dynamic workshopId;
  String? issueDate;
  String? createdAt;
  String? updatedAt;
  String? refundAt;
  String? invoiceType;
  double? interest;
  String? invoicePaymentMethod;
  double? total;
  String? paymentType;
  dynamic? profit;
  bool? hasLaterInterest;
  double? duration;
  String? paymentMethod;
  dynamic notes;
  String? refundReason;
  Customer? customer;
  ShopBranch? shopBranch;
  dynamic otherData;
  dynamic termsAndConditions;
  double? discount;
  dynamic attachmentUrl;
  double? taxValue;
  double? totalBeforeDiscount;
  double? totalDiscount;
  double? totalAfterDiscount;
  double? totalTaxValue;
  int? taxId;
  dynamic bankId;
  int? orderId;
  int? downloadCount;
  dynamic parentInvoiceId;
  // List<dynamic>? childIds;
  double? totalBeforeDiscountAfterRefund;
  double? totalDiscountAfterRefund;
  double? totalAfterDiscountAfterRefund;
  double? totalTaxValueAfterRefund;
  double? totalAfterRefund;
  String? slug;
  dynamic audio;
  dynamic recordingUrl;
  dynamic notesCreatedAt;
  bool? warrintyExpired;
  dynamic warrintiesExpirationDate;
  String? orderNumber;
  ShippingInfo? shippingInfo;
  Quotation? quotation;
  User? user;
  dynamic laterLimitExceededAt;
  List<InvoiceItems>? invoiceItems;
  // List<dynamic>? payments;
  RefundBy? refundBy;
  Warehouse? warehouse;
  Workshop? workshop;
  // List<dynamic>? workshops;
  Tax? tax;
  List<InvoiceDownloadHistories>? invoiceDownloadHistories;
  // List<dynamic>? refundInvoices;
  // List<dynamic>? attachments;
  // List<dynamic>? invoiceWarranties;
  dynamic review;
  // List<dynamic>? invoiceNotes;

  Data(
      {this.id,
        this.number,
        this.status,
        this.date,
        this.workshopId,
        this.issueDate,
        this.createdAt,
        this.updatedAt,
        this.refundAt,
        this.invoiceType,
        this.interest,
        this.invoicePaymentMethod,
        this.total,
        this.paymentType,
        this.profit,
        this.hasLaterInterest,
        this.duration,
        this.paymentMethod,
        this.notes,
        this.refundReason,
        this.customer,
        this.shopBranch,
        this.otherData,
        this.termsAndConditions,
        this.discount,
        this.attachmentUrl,
        this.taxValue,
        this.totalBeforeDiscount,
        this.totalDiscount,
        this.totalAfterDiscount,
        this.totalTaxValue,
        this.taxId,
        this.bankId,
        this.orderId,
        this.downloadCount,
        this.parentInvoiceId,
        this.totalBeforeDiscountAfterRefund,
        this.totalDiscountAfterRefund,
        this.totalAfterDiscountAfterRefund,
        this.totalTaxValueAfterRefund,
        this.totalAfterRefund,
        this.slug,
        this.audio,
        this.recordingUrl,
        this.notesCreatedAt,
        this.warrintyExpired,
        this.warrintiesExpirationDate,
        this.orderNumber,
        this.shippingInfo,
        this.quotation,
        this.user,
        this.laterLimitExceededAt,
        this.invoiceItems,
        this.refundBy,
        this.warehouse,
        this.workshop,
        this.tax,
        this.invoiceDownloadHistories,
        this.review,
     });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'].toString();
    status = json['status'].toString();
    date = json['date'];
    workshopId = json['workshop_id'];
    issueDate = json['issue_date'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    refundAt = json['refund_at'];
    invoiceType = json['invoice_type'].toString();
    interest = json['interest'];
    invoicePaymentMethod = json['invoice_payment_method'].toString();
    total = json['total'];
    paymentType = json['payment_type'].toString();
    profit = json['profit'];
    hasLaterInterest = json['has_later_interest'];
    duration = json['duration'];
    paymentMethod = json['payment_method'];
    notes = json['notes'];
    refundReason = json['refund_reason'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    shopBranch = json['shop_branch'] != null
        ? new ShopBranch.fromJson(json['shop_branch'])
        : null;
    otherData = json['other_data'];
    termsAndConditions = json['terms_and_conditions'];
    discount = json['discount'];
    attachmentUrl = json['attachment_url'];
    taxValue = json['tax_value'];
    totalBeforeDiscount = json['total_before_discount'];
    totalDiscount = json['total_discount'];
    totalAfterDiscount = json['total_after_discount'];
    totalTaxValue = json['total_tax_value'];
    taxId = json['tax_id'];
    bankId = json['bank_id'];
    orderId = json['order_id'];
    downloadCount = json['download_count'];
    parentInvoiceId = json['parent_invoice_id'];
    // if (json['child_ids'] != null) {
    //   childIds = <Null>[];
    //   json['child_ids'].forEach((v) {
    //     childIds!.add(new Null.fromJson(v));
    //   });
    // }
    totalBeforeDiscountAfterRefund = json['total_before_discount_after_refund'];
    totalDiscountAfterRefund = json['total_discount_after_refund'];
    totalAfterDiscountAfterRefund = json['total_after_discount_after_refund'];
    totalTaxValueAfterRefund = json['total_tax_value_after_refund'];
    totalAfterRefund = json['total_after_refund'];
    slug = json['slug'];
    audio = json['audio'];
    recordingUrl = json['recording_url'];
    notesCreatedAt = json['notes_created_at'];
    warrintyExpired = json['warrinty_expired'];
    warrintiesExpirationDate = json['warrinties_expiration_date'];
    orderNumber = json['order_number'];
    shippingInfo = json['shipping_info'] != null
        ? new ShippingInfo.fromJson(json['shipping_info'])
        : null;
    quotation = json['quotation'] != null
        ? new Quotation.fromJson(json['quotation'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    laterLimitExceededAt = json['later_limit_exceeded_at'];
    if (json['invoice_items'] != null) {
      invoiceItems = <InvoiceItems>[];
      json['invoice_items'].forEach((v) {
        invoiceItems!.add(new InvoiceItems.fromJson(v));
      });
    }
    // if (json['payments'] != null) {
    //   payments = <Null>[];
    //   json['payments'].forEach((v) {
    //     payments!.add(new Null.fromJson(v));
    //   });
    // }
    refundBy = json['refund_by'] != null
        ? new RefundBy.fromJson(json['refund_by'])
        : null;
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    workshop = json['workshop'] != null
        ? new Workshop.fromJson(json['workshop'])
        : null;
    // if (json['workshops'] != null) {
    //   workshops = <Null>[];
    //   json['workshops'].forEach((v) {
    //     workshops!.add(new Null.fromJson(v));
    //   });
    // }
    tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
    if (json['invoice_download_histories'] != null) {
      invoiceDownloadHistories = <InvoiceDownloadHistories>[];
      json['invoice_download_histories'].forEach((v) {
        invoiceDownloadHistories!.add(new InvoiceDownloadHistories.fromJson(v));
      });
    }
    // if (json['refund_invoices'] != null) {
    //   refundInvoices = <Null>[];
    //   json['refund_invoices'].forEach((v) {
    //     refundInvoices!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['attachments'] != null) {
    //   attachments = <Null>[];
    //   json['attachments'].forEach((v) {
    //     attachments!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['invoice_warranties'] != null) {
    //   invoiceWarranties = <Null>[];
    //   json['invoice_warranties'].forEach((v) {
    //     invoiceWarranties!.add(new Null.fromJson(v));
    //   });
    // }
    review = json['review'];
    // if (json['invoice_notes'] != null) {
    //   invoiceNotes = <Null>[];
    //   json['invoice_notes'].forEach((v) {
    //     invoiceNotes!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['status'] = this.status;
    data['date'] = this.date;
    data['workshop_id'] = this.workshopId;
    data['issue_date'] = this.issueDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['refund_at'] = this.refundAt;
    data['invoice_type'] = this.invoiceType;
    data['interest'] = this.interest;
    data['invoice_payment_method'] = this.invoicePaymentMethod;
    data['total'] = this.total;
    data['payment_type'] = this.paymentType;
    data['profit'] = this.profit;
    data['has_later_interest'] = this.hasLaterInterest;
    data['duration'] = this.duration;
    data['payment_method'] = this.paymentMethod;
    data['notes'] = this.notes;
    data['refund_reason'] = this.refundReason;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.shopBranch != null) {
      data['shop_branch'] = this.shopBranch!.toJson();
    }
    data['other_data'] = this.otherData;
    data['terms_and_conditions'] = this.termsAndConditions;
    data['discount'] = this.discount;
    data['attachment_url'] = this.attachmentUrl;
    data['tax_value'] = this.taxValue;
    data['total_before_discount'] = this.totalBeforeDiscount;
    data['total_discount'] = this.totalDiscount;
    data['total_after_discount'] = this.totalAfterDiscount;
    data['total_tax_value'] = this.totalTaxValue;
    data['tax_id'] = this.taxId;
    data['bank_id'] = this.bankId;
    data['order_id'] = this.orderId;
    data['download_count'] = this.downloadCount;
    data['parent_invoice_id'] = this.parentInvoiceId;

    data['total_before_discount_after_refund'] =
        this.totalBeforeDiscountAfterRefund;
    data['total_discount_after_refund'] = this.totalDiscountAfterRefund;
    data['total_after_discount_after_refund'] =
        this.totalAfterDiscountAfterRefund;
    data['total_tax_value_after_refund'] = this.totalTaxValueAfterRefund;
    data['total_after_refund'] = this.totalAfterRefund;
    data['slug'] = this.slug;
    data['audio'] = this.audio;
    data['recording_url'] = this.recordingUrl;
    data['notes_created_at'] = this.notesCreatedAt;
    data['warrinty_expired'] = this.warrintyExpired;
    data['warrinties_expiration_date'] = this.warrintiesExpirationDate;
    data['order_number'] = this.orderNumber;
    if (this.shippingInfo != null) {
      data['shipping_info'] = this.shippingInfo!.toJson();
    }
    if (this.quotation != null) {
      data['quotation'] = this.quotation!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['later_limit_exceeded_at'] = this.laterLimitExceededAt;
    if (this.invoiceItems != null) {
      data['invoice_items'] =
          this.invoiceItems!.map((v) => v.toJson()).toList();
    }
    // if (this.payments != null) {
    //   data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    // }
    if (this.refundBy != null) {
      data['refund_by'] = this.refundBy!.toJson();
    }
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.toJson();
    }
    if (this.workshop != null) {
      data['workshop'] = this.workshop!.toJson();
    }

    if (this.tax != null) {
      data['tax'] = this.tax!.toJson();
    }
    if (this.invoiceDownloadHistories != null) {
      data['invoice_download_histories'] =
          this.invoiceDownloadHistories!.map((v) => v.toJson()).toList();
    }

    data['review'] = this.review;

    return data;
  }
}

class Customer {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? taxNumber;
  double? customerInterest;

  Customer(
      {this.customerId,
        this.customerName,
        this.customerEmail,
        this.customerPhone,
        this.taxNumber,
        this.customerInterest});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    taxNumber = json['tax_number'];
    customerInterest = json['customer_interest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['tax_number'] = this.taxNumber;
    data['customer_interest'] = this.customerInterest;
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

class ShippingInfo {
  double? shippingFees;
  dynamic shippingDriverName;
  dynamic shippingMobile;
  dynamic shippingAddress;
  dynamic shippingDate;
  dynamic shippingTrackingNumber;
  dynamic shippingTrackingLink;

  ShippingInfo(
      {this.shippingFees,
        this.shippingDriverName,
        this.shippingMobile,
        this.shippingAddress,
        this.shippingDate,
        this.shippingTrackingNumber,
        this.shippingTrackingLink});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    shippingFees = json['shipping_fees'];
    shippingDriverName = json['shipping_driver_name'];
    shippingMobile = json['shipping_mobile'];
    shippingAddress = json['shipping_address'];
    shippingDate = json['shipping_date'];
    shippingTrackingNumber = json['shipping_tracking_number'];
    shippingTrackingLink = json['shipping_tracking_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_fees'] = this.shippingFees;
    data['shipping_driver_name'] = this.shippingDriverName;
    data['shipping_mobile'] = this.shippingMobile;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_date'] = this.shippingDate;
    data['shipping_tracking_number'] = this.shippingTrackingNumber;
    data['shipping_tracking_link'] = this.shippingTrackingLink;
    return data;
  }
}

class Quotation {
  dynamic quotationId;
  dynamic createdBy;

  Quotation({this.quotationId, this.createdBy});

  Quotation.fromJson(Map<String, dynamic> json) {
    quotationId = json['quotation_id'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotation_id'] = this.quotationId;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class User {
  int? id;
  bool? authorized;
  String? name;
  String? imageUrl;
  bool? isMarketplace;
  double? rating;
  String? type;
  ShopBranch? shopBranch;
  dynamic workshopCategory;
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
  bool? workingOverTime;
  dynamic workshopBlocked;
  String? role;
  List<Attachments>? attachments;
  Country? country;
  String? languageCode;
  List<CoverageZones>? coverageZones;
  // List<Null>? countries;
  List<Warehouses>? warehouses;
  // List<Null>? categories;
  List<Roles>? roles;
  bool? pendingAuthorization;
  dynamic workShifts;
  LastApiRequest? lastApiRequest;

  User(
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
        this.workingOverTime,
        this.workshopBlocked,
        this.role,
        this.attachments,
        this.country,
        this.languageCode,
        this.coverageZones,
        this.warehouses,
        this.roles,
        this.pendingAuthorization,
        this.workShifts,
        this.lastApiRequest});

  User.fromJson(Map<String, dynamic> json) {
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
    workingOverTime = json['working_over_time'];
    workshopBlocked = json['workshop_blocked'];
    role = json['role'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    languageCode = json['language_code'];
    if (json['coverage_zones'] != null) {
      coverageZones = <CoverageZones>[];
      json['coverage_zones'].forEach((v) {
        coverageZones!.add(new CoverageZones.fromJson(v));
      });
    }
    // if (json['countries'] != null) {
    //   countries = <Null>[];
    //   json['countries'].forEach((v) {
    //     countries!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouses.fromJson(v));
      });
    }
    // if (json['categories'] != null) {
    //   categories = <Null>[];
    //   json['categories'].forEach((v) {
    //     categories!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    pendingAuthorization = json['pending_authorization'];
    workShifts = json['work_shifts'];
    lastApiRequest = json['last_api_request'] != null
        ? new LastApiRequest.fromJson(json['last_api_request'])
        : null;
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
    data['working_over_time'] = this.workingOverTime;
    data['workshop_blocked'] = this.workshopBlocked;
    data['role'] = this.role;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['language_code'] = this.languageCode;
    if (this.coverageZones != null) {
      data['coverage_zones'] =
          this.coverageZones!.map((v) => v.toJson()).toList();
    }
    // if (this.countries != null) {
    //   data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    // }
    if (this.warehouses != null) {
      data['warehouses'] = this.warehouses!.map((v) => v.toJson()).toList();
    }
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['pending_authorization'] = this.pendingAuthorization;
    data['work_shifts'] = this.workShifts;
    if (this.lastApiRequest != null) {
      data['last_api_request'] = this.lastApiRequest!.toJson();
    }
    return data;
  }
}

class Attachments {
  String? name;
  String? url;

  Attachments({this.name, this.url});

  Attachments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
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

class CoverageZones {
  int? id;
  String? title;
  double? lat;
  double? long;
  int? radius;
  dynamic freeShippingRadius;
  double? shippingCost;
  int? shopId;
  dynamic cityId;
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

class Warehouses {
  int? id;
  String? name;
  double? lat;
  double? long;
  bool? main;
  String? addressLine1;
  List<CoverageZones>? coverageZones;
  ShopBranch? shopBranch;

  Warehouses(
      {this.id,
        this.name,
        this.lat,
        this.long,
        this.main,
        this.addressLine1,
        this.coverageZones,
        this.shopBranch});

  Warehouses.fromJson(Map<String, dynamic> json) {
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

class Roles {
  dynamic id;
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

class LastApiRequest {
  String? requestStatus;
  String? requestedSource;
  int? requestedSourceId;
  String? requestEndpoint;
  String? requestMethod;
  String? responseMessage;
  String? createdAt;
  String? updatedAt;
  String? browserName;
  String? platformName;
  String? platformVersion;
  String? deviceName;

  LastApiRequest(
      {this.requestStatus,
        this.requestedSource,
        this.requestedSourceId,
        this.requestEndpoint,
        this.requestMethod,
        this.responseMessage,
        this.createdAt,
        this.updatedAt,
        this.browserName,
        this.platformName,
        this.platformVersion,
        this.deviceName});

  LastApiRequest.fromJson(Map<String, dynamic> json) {
    requestStatus = json['request_status'];
    requestedSource = json['requested_source'];
    requestedSourceId = json['requested_source_id'];
    requestEndpoint = json['request_endpoint'];
    requestMethod = json['request_method'];
    responseMessage = json['response_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    browserName = json['browser_name'];
    platformName = json['platform_name'];
    platformVersion = json['platform_version'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_status'] = this.requestStatus;
    data['requested_source'] = this.requestedSource;
    data['requested_source_id'] = this.requestedSourceId;
    data['request_endpoint'] = this.requestEndpoint;
    data['request_method'] = this.requestMethod;
    data['response_message'] = this.responseMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['browser_name'] = this.browserName;
    data['platform_name'] = this.platformName;
    data['platform_version'] = this.platformVersion;
    data['device_name'] = this.deviceName;
    return data;
  }
}

class InvoiceItems {
  dynamic id;
  dynamic productId;
  dynamic description;
  String? name;
  dynamic code;
  dynamic unitPrice;
  dynamic quantity;
  dynamic refundQuantity;
  dynamic purchasePrice;
  dynamic originalQuantity;
  dynamic workshopId;
  ProductCategory? productCategory;
  String? partNumber;
  dynamic review;

  InvoiceItems(
      {this.id,
        this.productId,
        this.description,
        this.name,
        this.code,
        this.unitPrice,
        this.quantity,
        this.refundQuantity,
        this.purchasePrice,
        this.originalQuantity,
        this.workshopId,
        this.productCategory,
        this.partNumber,
        this.review});

  InvoiceItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    description = json['description'];
    name = json['name'];
    code = json['code'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    refundQuantity = json['refund_quantity'];
    purchasePrice = json['purchase_price'];
    originalQuantity = json['original_quantity'];
    workshopId = json['workshop_id'];
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    partNumber = json['part_number'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['name'] = this.name;
    data['code'] = this.code;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['refund_quantity'] = this.refundQuantity;
    data['purchase_price'] = this.purchasePrice;
    data['original_quantity'] = this.originalQuantity;
    data['workshop_id'] = this.workshopId;
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
    data['part_number'] = this.partNumber;
    data['review'] = this.review;
    return data;
  }
}

class ProductCategory {
  dynamic id;
  dynamic shopId;
  String? createdAt;
  String? updatedAt;
  bool? disabled;
  dynamic parentId;
  dynamic userId;
  dynamic key;
  dynamic supportTicketTypeId;
  bool? showInSupportTicket;
  String? slug;
  dynamic order;
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

class RefundBy {
  int? id;
  String? name;
  String? email;
  String? phone;

  RefundBy({this.id, this.name, this.email, this.phone});

  RefundBy.fromJson(Map<String, dynamic> json) {
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

class Workshop {
  dynamic name;
  dynamic phone;
  dynamic email;

  Workshop({this.name, this.phone, this.email});

  Workshop.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class Tax {
  int? id;
  String? name;
  dynamic value;
  bool? defaultTax;
  String? createdAt;
  String? updatedAt;

  Tax(
      {this.id,
        this.name,
        this.value,
        this.defaultTax,
        this.createdAt,
        this.updatedAt});

  Tax.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    defaultTax = json['default_tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['default_tax'] = this.defaultTax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class InvoiceDownloadHistories {
  int? id;
  String? createdAt;
  String? reason;
  RefundBy? user;

  InvoiceDownloadHistories({this.id, this.createdAt, this.reason, this.user});

  InvoiceDownloadHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    reason = json['reason'];
    user = json['user'] != null ? new RefundBy.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['reason'] = this.reason;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
