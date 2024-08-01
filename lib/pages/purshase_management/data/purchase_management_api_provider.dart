// ignore: one_member_abstracts

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/purshase_management/models/external_purchase_orders_model.dart';
import 'package:get/get.dart';


abstract class IPurchaseManagementProvider {
  Future<Response<ExternalPurchaseOrderModel>> getExternalPurchaseOrders(int page,int? productSupplierId, String? state,String? from, String? to,String barcode);
}

class PurchaseManagementProvider extends BaseAuthProvider implements IPurchaseManagementProvider {
  @override
  Future<Response<ExternalPurchaseOrderModel>> getExternalPurchaseOrders(int page,int? productSupplierId, String? state,String? from, String? to,String barcode)async{
    Response<ExternalPurchaseOrderModel> resp = await  get<ExternalPurchaseOrderModel>(
      EndPoints.EXTERNAL_PURCHASE_ORDERS,
      query: {
        "page":page.toString(),
        "from":from ??"",
        "to":to ??"",
        "state":state ??"",
        "product_supplier_id":productSupplierId ??"",
        "search_products" : barcode
      },
      decoder: ExternalPurchaseOrderModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

}
