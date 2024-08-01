class NotificationsModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  NotificationsModel({this.code, this.status, this.data, this.message});

  NotificationsModel.fromJson(json) {
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
  List<NotificationItem>? notificationItems;
  Pagination? pagination;

  Data({this.notificationItems, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      notificationItems = <NotificationItem>[];
      json['items'].forEach((v) {
        notificationItems!.add(new NotificationItem.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationItems != null) {
      data['items'] = this.notificationItems!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class NotificationItem {
  int? id;
  Payload? payload;
  bool? seen;
  String? name;
  int? notifiableId;
  String? notifiableType;
  String? createdAt;

  NotificationItem(
      {this.id,
        this.payload,
        this.seen,
        this.name,
        this.notifiableId,
        this.notifiableType,
        this.createdAt});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    seen = json['seen'];
    name = json['name'];
    notifiableId = json['notifiable_id'];
    notifiableType = json['notifiable_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['seen'] = this.seen;
    data['name'] = this.name;
    data['notifiable_id'] = this.notifiableId;
    data['notifiable_type'] = this.notifiableType;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Payload {
  int? orderId;
  String? orderType;
  String? name;
  String? contents;
  String? heading;
  int? unreadCount;

  Payload(
      {this.orderId,
        this.orderType,
        this.name,
        this.contents,
        this.heading,
        this.unreadCount});

  Payload.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderType = json['order_type'];
    name = json['name'];
    contents = json['contents'];
    heading = json['heading'];
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_type'] = this.orderType;
    data['name'] = this.name;
    data['contents'] = this.contents;
    data['heading'] = this.heading;
    data['unread_count'] = this.unreadCount;
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