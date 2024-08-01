// ignore: one_member_abstracts

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/models/purchase_order_daily.dart';
import 'package:fusion_warehouses/pages/purshase_management/models/external_purchase_orders_model.dart';
import 'package:get/get.dart';


abstract class IDailyShippingProvider {
  Future<Response<PurchaseOrdersDaily>> getDailyPurchaseOrders(int page,bool? shippedPurchaseOrdersHistory, String? shipmentDate,String barCode);

}

class DailyShippingProvider extends BaseAuthProvider implements IDailyShippingProvider {
  @override
  Future<Response<PurchaseOrdersDaily>> getDailyPurchaseOrders(int page, bool? shippedPurchaseOrdersHistory, String? shipmentDate, String barCode) async{
    print({
      "page":page.toString(),
      "shipped_purchase_orders":true,
      "shipment_date":shipmentDate ??"",
      "bar_code":barCode ??"",
      "shipped_purchase_orders_history":shippedPurchaseOrdersHistory
    });
    try{
      Response<PurchaseOrdersDaily> resp = await  get<PurchaseOrdersDaily>(
        EndPoints.PURCHASE_ORDERS,
        query: {
          "page":page.toString(),
          "shipped_purchase_orders":true.toString(),
          "shipment_date":shipmentDate ??"",
          "bar_code":barCode ??"",
          "shipped_purchase_orders_history":shippedPurchaseOrdersHistory! ? shippedPurchaseOrdersHistory.toString() : ""
        },
        decoder: PurchaseOrdersDaily.fromJson,
      );
      print("get");
      print("lol${resp.bodyString}");

      return resp;
    }catch(e){
      print(e.toString());
      throw(e);
    }

  }
  // PURCHASE_ORDERS

}
