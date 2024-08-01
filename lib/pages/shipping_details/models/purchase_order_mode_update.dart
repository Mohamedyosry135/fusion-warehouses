import 'package:fusion_warehouses/pages/daily_shipping_list/models/purchase_order_daily.dart';

class PurchaseOrderModelUpdateStock{
  int? code;
  String? status;
  PurchaseOrderItem? data;
  String? message;

  PurchaseOrderModelUpdateStock({this.code, this.status, this.data, this.message});


  PurchaseOrderModelUpdateStock.fromJson( json) {
    print(json);
    code = json['code'];
    status = json['status'];
    data = json['data'] != null&& json['data'].toString() != "[]" ? new PurchaseOrderItem.fromJson(json['data']) : null;
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