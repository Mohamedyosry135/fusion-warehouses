
import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/data/daily_shipping_api_provider.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/models/purchase_order_daily.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';


abstract class IDailyShippingRepository {
  Future<PurchaseOrdersDaily> getDailyPurchaseOrders(int page,bool? shippedPurchaseOrdersHistory, String? shipmentDate,String barCode);

}

class DailyShippingRepository extends BaseRepository implements IDailyShippingRepository {
  DailyShippingRepository({required this.provider});
  final IDailyShippingProvider provider;

  @override
  Future<PurchaseOrdersDaily> getDailyPurchaseOrders(int page, bool? shippedPurchaseOrdersHistory, String? shipmentDate, String barCode) async{
    print("ere");
    final apiResponse = await provider.getDailyPurchaseOrders(page, shippedPurchaseOrdersHistory, shipmentDate, barCode);
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
