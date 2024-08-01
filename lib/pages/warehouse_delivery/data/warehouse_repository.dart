
import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';

import 'warehouse_api_provider.dart';


abstract class IWarehousesRepository {
  Future<WarehousesOrdersModel> getWarehousesOrder(int page,String type, String status);

}

class WarehousesRepository extends BaseRepository implements IWarehousesRepository {
  WarehousesRepository({required this.provider});
  final IWarehousesProvider provider;

  @override
  Future<WarehousesOrdersModel> getWarehousesOrder(int page, String type, String status) async{
    print("ere");
    final apiResponse = await provider.getWarehousesOrder(page, type, status);
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
