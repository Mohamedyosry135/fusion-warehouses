

import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/stocktaking/models/stocktaking_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';

import 'stocktaking_api_provider.dart';

abstract class IStocktakingRepository {
  Future<StockItemsModel> getStockItems(int page,String status);


}

class StocktakingRepository extends BaseRepository implements IStocktakingRepository {
  StocktakingRepository({required this.provider});
  final IStocktakingProvider provider;

  @override
  Future<StockItemsModel> getStockItems(int page,String status)async{
    print("ere");
    final apiResponse = await provider.getStockItems(page,status);
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
