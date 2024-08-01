class ProductCategoriesModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  ProductCategoriesModel({this.code, this.status, this.data, this.message});ProductCategoriesModel.fromJson(json) {
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
  List<CategoryFilter>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CategoryFilter>[];
      json['items'].forEach((v) {
        items!.add(new CategoryFilter.fromJson(v));
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

class CategoryFilter {
  int? id;
  String? name;
  String? description;
  List<Translations>? translations;
  String? slug;
  int? parentId;
  bool? disabled;
  String? mainImage;
  bool? isAssigned;
  String? createdAt;
  String? updatedAt;
  bool? showInSupportTicket;
  dynamic supportTicketType;
  List<CategoryFilter>? children;

  CategoryFilter(
      {this.id,
        this.name,
        this.description,
        this.translations,
        this.slug,
        this.parentId,
        this.disabled,
        this.mainImage,
        this.isAssigned,
        this.createdAt,
        this.updatedAt,
        this.showInSupportTicket,
        this.supportTicketType,
        this.children});

  CategoryFilter.fromJson(Map<String, dynamic> json) {
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
    isAssigned = json['is_assigned'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    showInSupportTicket = json['show_in_support_ticket'];
    supportTicketType = json['support_ticket_type'];
    if (json['children'] != null) {
      children = <CategoryFilter>[];
      json['children'].forEach((v) {
        children!.add(new CategoryFilter.fromJson(v));
      });
    }
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
    data['is_assigned'] = this.isAssigned;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['show_in_support_ticket'] = this.showInSupportTicket;
    data['support_ticket_type'] = this.supportTicketType;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
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