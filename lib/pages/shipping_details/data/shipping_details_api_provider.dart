// ignore: one_member_abstracts

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/models/purchase_order_daily.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/buy_stock_model_request.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_mode_update.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/suppliers_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/update_state_purchase_order_request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class IShippingDetailsProvider {
  Future<Response<PurchaseOrderDetails>> getOrderDetails(int id, );
  Future<Response<PurchaseOrderDetails>> updateStateOrder(int id,UpdateStatePurchaseOrderRequest updateStatePurchaseOrderRequest,bool state);

  Future<Response<PurchaseOrderModelUpdateStock>> updateStockRecieved(int id,String num);
  Future<Response<SuppliersModel>> getSuppliers();

  Future<Response<PurchaseOrderModelUpdateStock>> buyStock(int id,BuyStockModel buyStockModel);
  Future<Response<PurchaseOrderModelUpdateStock>> refundStock(int id,String num);


}

class ShippingDetailsProvider extends BaseAuthProvider
    implements IShippingDetailsProvider {
  @override
  Future<Response<PurchaseOrderDetails>> getOrderDetails(int id) async {
    Response<PurchaseOrderDetails> resp = await get<PurchaseOrderDetails>(
      "${EndPoints.EXTERNAL_PURCHASE_ORDERS}/${id}",
      decoder: PurchaseOrderDetails.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<PurchaseOrderModelUpdateStock>> updateStockRecieved(int id,String num) async{
    Response<PurchaseOrderModelUpdateStock> resp = await put<PurchaseOrderModelUpdateStock>(
      "${EndPoints.PURCHASE_ORDERS}/${id}",
      {
        "purchase_order": {
          "update_stock_quantity": num
        }
      },
      decoder: PurchaseOrderModelUpdateStock.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<PurchaseOrderDetails>> updateStateOrder(int id, UpdateStatePurchaseOrderRequest updateStatePurchaseOrderRequest,bool state) async{
    print(updateStatePurchaseOrderRequest.toJson());
    Response<PurchaseOrderDetails> resp = await put<PurchaseOrderDetails>(
      "${EndPoints.EXTERNAL_PURCHASE_ORDERS}/${id}",
      state? {
        "external_purchase_order": {
          "state": updateStatePurchaseOrderRequest.externalPurchaseOrder?.state ??""
        }
      } :updateStatePurchaseOrderRequest.externalPurchaseOrder?.purchasedInvoiceDueDate == null ?
      {
        "external_purchase_order": {
          "purchased_invoice_number": updateStatePurchaseOrderRequest.externalPurchaseOrder?.purchasedInvoiceNumber,
          "purchased_invoice_date": updateStatePurchaseOrderRequest.externalPurchaseOrder?.purchasedInvoiceDate,
          "purchased_price": updateStatePurchaseOrderRequest.externalPurchaseOrder?.purchasedPrice,
          "product_supplier_id": updateStatePurchaseOrderRequest.externalPurchaseOrder?.productSupplierId,
          "payment_type": updateStatePurchaseOrderRequest.externalPurchaseOrder?.paymentType,
          "attachments_attributes": (updateStatePurchaseOrderRequest.externalPurchaseOrder?.attachmentsAttributes?.isEmpty ??true) ?[] : [
            {
              "name":updateStatePurchaseOrderRequest.externalPurchaseOrder?.attachmentsAttributes?.first.name,
              "file":updateStatePurchaseOrderRequest.externalPurchaseOrder?.attachmentsAttributes?.first.file
            }
          ],
          "state": "purchased"
        }
      }

          :updateStatePurchaseOrderRequest.toJson(),
      decoder: PurchaseOrderDetails.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<SuppliersModel>> getSuppliers()async {
    Response<SuppliersModel> resp = await get<SuppliersModel>(
      "${EndPoints.PRODUCT_SUPPLIERS}",
      query: {
        "without_pagination":"true"
      },
      decoder: SuppliersModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<PurchaseOrderModelUpdateStock>> buyStock(int id, BuyStockModel buyStockModel) async{
    Response<PurchaseOrderModelUpdateStock> resp = await put<PurchaseOrderModelUpdateStock>(
      "${EndPoints.PURCHASE_ORDERS}/${id}",
      buyStockModel.toJson(),
      decoder: PurchaseOrderModelUpdateStock.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<PurchaseOrderModelUpdateStock>> refundStock(int id, String num) async{
    Response<PurchaseOrderModelUpdateStock> resp = await put<PurchaseOrderModelUpdateStock>(
      "${EndPoints.PURCHASE_ORDERS}/${id}",
      {"purchase_order":{"refund_quantity":num}},
      decoder: PurchaseOrderModelUpdateStock.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }
}
