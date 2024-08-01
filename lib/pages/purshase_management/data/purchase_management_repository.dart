
import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/data/daily_shipping_api_provider.dart';
import 'package:fusion_warehouses/pages/purshase_management/data/purchase_management_api_provider.dart';
import 'package:fusion_warehouses/pages/purshase_management/models/external_purchase_orders_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';


abstract class IPurchaseManagementRepository {
  Future<ExternalPurchaseOrderModel> getExternalPurchaseOrders(int page,int? productSupplierId, String? state,String? from, String? to,String barcode);

}

class PurchaseManagementRepository extends BaseRepository implements IPurchaseManagementRepository {
  PurchaseManagementRepository({required this.provider});
  final IPurchaseManagementProvider provider;

  @override
  Future<ExternalPurchaseOrderModel> getExternalPurchaseOrders(int page,int? productSupplierId, String? state,String? from, String? to,String barcode) async{
    // TODO: implement getExternalPurchaseOrders
    print("ere");
    final apiResponse = await provider.getExternalPurchaseOrders(page, productSupplierId, state, from, to, barcode);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk ){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      final responseJson = const JsonDecoder().convert(apiResponse.bodyString!);
      if(responseJson['code'] == 404){
        throw(AppStrings.youDontHaveAccess) ;

      }else{
        throw(responseJson['error'].toString()) ;

      }
    }
  }


}
