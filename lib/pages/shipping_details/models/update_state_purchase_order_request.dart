class UpdateStatePurchaseOrderRequest {
  ExternalPurchaseOrder? externalPurchaseOrder;

  UpdateStatePurchaseOrderRequest({this.externalPurchaseOrder});

  UpdateStatePurchaseOrderRequest.fromJson(Map<String, dynamic> json) {
    externalPurchaseOrder = json['external_purchase_order'] != null
        ? new ExternalPurchaseOrder.fromJson(json['external_purchase_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalPurchaseOrder != null) {
      data['external_purchase_order'] = this.externalPurchaseOrder!.toJson();
    }
    return data;
  }
}

class ExternalPurchaseOrder {
  String? purchasedInvoiceNumber;
  String? purchasedInvoiceDate;
  double? purchasedPrice;
  int? productSupplierId;
  String? paymentType;
  String? purchasedInvoiceDueDate;
  List<AttachmentsAttributes>? attachmentsAttributes;
  String? state;

  ExternalPurchaseOrder(
      {this.purchasedInvoiceNumber,
        this.purchasedInvoiceDate,
        this.purchasedPrice,
        this.productSupplierId,
        this.paymentType,
        this.purchasedInvoiceDueDate,
        this.attachmentsAttributes,
        this.state});

  ExternalPurchaseOrder.fromJson(Map<String, dynamic> json) {
    purchasedInvoiceNumber = json['purchased_invoice_number'];
    purchasedInvoiceDate = json['purchased_invoice_date'];
    purchasedPrice = json['purchased_price'];
    productSupplierId = json['product_supplier_id'];
    paymentType = json['payment_type'];
    purchasedInvoiceDueDate = json['purchased_invoice_due_date'];
    if (json['attachments_attributes'] != null) {
      attachmentsAttributes = <AttachmentsAttributes>[];
      json['attachments_attributes'].forEach((v) {
        attachmentsAttributes!.add(new AttachmentsAttributes.fromJson(v));
      });
    }
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchased_invoice_number'] = this.purchasedInvoiceNumber;
    data['purchased_invoice_date'] = this.purchasedInvoiceDate;
    data['purchased_price'] = this.purchasedPrice;
    data['product_supplier_id'] = this.productSupplierId;
    data['payment_type'] = this.paymentType;
    data['purchased_invoice_due_date'] = this.purchasedInvoiceDueDate;
    if (this.attachmentsAttributes != null) {
      data['attachments_attributes'] =
          this.attachmentsAttributes!.map((v) => v.toJson()).toList();
    }
    data['state'] = this.state;
    return data;
  }
}

class AttachmentsAttributes {
  String? name;
  String? file;

  AttachmentsAttributes({this.name, this.file});

  AttachmentsAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}
