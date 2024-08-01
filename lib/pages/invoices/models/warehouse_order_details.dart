import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';

class WarehousesOrdersDetailsModel {
  int? code;
  String? status;
  WarehouseOrderDetails? data;
  String? message;

  WarehousesOrdersDetailsModel({this.code, this.status, this.data, this.message});

  WarehousesOrdersDetailsModel.fromJson( json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null&& json['data'].toString() != "[]"  ? new WarehouseOrderDetails.fromJson(json['data']) : null;
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