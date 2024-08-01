class BuyStockModel {
  PurchaseOrderRequest? purchaseOrder;

  BuyStockModel({this.purchaseOrder});

  BuyStockModel.fromJson(Map<String, dynamic> json) {
    purchaseOrder = json['purchase_order'] != null
        ? new PurchaseOrderRequest.fromJson(json['purchase_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.purchaseOrder != null) {
      data['purchase_order'] = this.purchaseOrder!.toJson();
    }
    return data;
  }
}

class PurchaseOrderRequest {
  double? purchasedPrice;
  int? newPurchasedQuantity;
  String? shipmentDate;
  int? productSupplierId;

  PurchaseOrderRequest(
      {this.purchasedPrice,
        this.newPurchasedQuantity,
        this.shipmentDate,
        this.productSupplierId});

  PurchaseOrderRequest.fromJson(Map<String, dynamic> json) {
    purchasedPrice = json['purchased_price'];
    newPurchasedQuantity = json['new_purchased_quantity'];
    shipmentDate = json['shipment_date'];
    productSupplierId = json['product_supplier_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchased_price'] = this.purchasedPrice;
    data['new_purchased_quantity'] = this.newPurchasedQuantity;
    data['shipment_date'] = this.shipmentDate;
    data['product_supplier_id'] = this.productSupplierId;
    return data;
  }
}