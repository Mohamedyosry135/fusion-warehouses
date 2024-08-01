class LoginResponeModel {
  int? code;
  String? status;
  Data? data;
  String? message;

  LoginResponeModel({this.code, this.status, this.data, this.message});

  LoginResponeModel.fromJson(json) {
    // print("json ${json}");
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
  String? authToken;
  String? firebaseToken;
  User? user;

  Data({this.authToken, this.firebaseToken, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    firebaseToken = json['firebase_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['firebase_token'] = this.firebaseToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  bool? authorized;
  String? imageUrl;
  double? rating;
  String? type;
  String? email;
  String? phone;
  int? languageId;
  int? countryId;
  String? lastPaymentAt;
  bool? online;
  bool? profileCompleted;
  Ride? ride;
  // List<Null>? attachments;
  // List<Null>? packageTypes;
  // List<Null>? services;
  // List<Null>? cities;
  List<Roles>? roles;

  User(
      {this.id,
        this.name,
        this.authorized,
        this.imageUrl,
        this.rating,
        this.type,
        this.email,
        this.phone,
        this.languageId,
        this.countryId,
        this.lastPaymentAt,
        this.online,
        this.roles,
        this.profileCompleted,
        this.ride,
        // this.attachments,
        // this.packageTypes,
        // this.services,
        // this.cities
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    authorized = json['authorized'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    type = json['type'];
    email = json['email'];
    phone = json['phone'];
    languageId = json['language_id'];
    countryId = json['country_id'];
    lastPaymentAt = json['last_payment_at'];
    online = json['online'];
    profileCompleted = json['profile_completed'];
    ride = json['ride'] != null ? new Ride.fromJson(json['ride']) : null;
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    // if (json['attachments'] != null) {
    //   attachments = <Null>[];
    //   json['attachments'].forEach((v) {
    //     attachments!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['package_types'] != null) {
    //   packageTypes = <Null>[];
    //   json['package_types'].forEach((v) {
    //     packageTypes!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['services'] != null) {
    //   services = <Null>[];
    //   json['services'].forEach((v) {
    //     services!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['cities'] != null) {
    //   cities = <Null>[];
    //   json['cities'].forEach((v) {
    //     cities!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['authorized'] = this.authorized;
    data['image_url'] = this.imageUrl;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['language_id'] = this.languageId;
    data['country_id'] = this.countryId;
    data['last_payment_at'] = this.lastPaymentAt;
    data['online'] = this.online;
    data['profile_completed'] = this.profileCompleted;
    if (this.ride != null) {
      data['ride'] = this.ride!.toJson();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    // if (this.attachments != null) {
    //   data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    // }
    // if (this.packageTypes != null) {
    //   data['package_types'] =
    //       this.packageTypes!.map((v) => v.toJson()).toList();
    // }
    // if (this.services != null) {
    //   data['services'] = this.services!.map((v) => v.toJson()).toList();
    // }
    // if (this.cities != null) {
    //   data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    // }
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
class Ride {
  int? id;
  String? color;
  String? year;
  String? model;
  String? number;
  String? company;
  int? rideTypeId;
  Null? rideTypeCategoryId;
  RideType? rideType;
  List<Attachments>? attachments;

  Ride(
      {this.id,
        this.color,
        this.year,
        this.model,
        this.number,
        this.company,
        this.rideTypeId,
        this.rideTypeCategoryId,
        this.rideType,
        this.attachments});

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    year = json['year'];
    model = json['model'];
    number = json['number'];
    company = json['company'];
    rideTypeId = json['ride_type_id'];
    rideTypeCategoryId = json['ride_type_category_id'];
    rideType = json['ride_type'] != null
        ? new RideType.fromJson(json['ride_type'])
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['year'] = this.year;
    data['model'] = this.model;
    data['number'] = this.number;
    data['company'] = this.company;
    data['ride_type_id'] = this.rideTypeId;
    data['ride_type_category_id'] = this.rideTypeCategoryId;
    if (this.rideType != null) {
      data['ride_type'] = this.rideType!.toJson();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RideType {
  int? id;
  String? name;
  bool? disabled;
  Null? imageUrl;
  bool? general;
  int? order;
  bool? useInTrips;
  int? orderInTrips;
  Null? parentId;
  List<int>? tripPackageCategoriesIds;
  List<int>? servicesIds;
  List<ServiceCategories>? serviceCategories;

  RideType(
      {this.id,
        this.name,
        this.disabled,
        this.imageUrl,
        this.general,
        this.order,
        this.useInTrips,
        this.orderInTrips,
        this.parentId,
        this.tripPackageCategoriesIds,
        this.servicesIds,
        this.serviceCategories});

  RideType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    disabled = json['disabled'];
    imageUrl = json['image_url'];
    general = json['general'];
    order = json['order'];
    useInTrips = json['use_in_trips'];
    orderInTrips = json['order_in_trips'];
    parentId = json['parent_id'];
    tripPackageCategoriesIds = json['trip_package_categories_ids'].cast<int>();
    servicesIds = json['services_ids'].cast<int>();
    if (json['service_categories'] != null) {
      serviceCategories = <ServiceCategories>[];
      json['service_categories'].forEach((v) {
        serviceCategories!.add(new ServiceCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['disabled'] = this.disabled;
    data['image_url'] = this.imageUrl;
    data['general'] = this.general;
    data['order'] = this.order;
    data['use_in_trips'] = this.useInTrips;
    data['order_in_trips'] = this.orderInTrips;
    data['parent_id'] = this.parentId;
    data['trip_package_categories_ids'] = this.tripPackageCategoriesIds;
    data['services_ids'] = this.servicesIds;
    if (this.serviceCategories != null) {
      data['service_categories'] =
          this.serviceCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceCategories {
  int? id;
  String? name;
  String? key;
  List<Services>? services;

  ServiceCategories({this.id, this.name, this.key, this.services});

  ServiceCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['key'] = this.key;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? key;
  Null? imageUrl;

  Services({this.id, this.name, this.key, this.imageUrl});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['key'] = this.key;
    data['image_url'] = this.imageUrl;
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