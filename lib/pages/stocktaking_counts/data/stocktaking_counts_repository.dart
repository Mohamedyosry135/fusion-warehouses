

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/stocktaking/models/stocktaking_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/updated_product_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/warehouses_model.dart';

import 'stocktaking_counts_api_provider.dart';

abstract class IStocktakingCountsRepository {
  Future<WarehousesModel> getWarehouses();
  Future<UpdatedProductModel> updateProduct(int physicalInventoryId, int warehouseId,String storageName, int amount, int idProduct, int? slotId);

  Future<UpdatedProductModel> matchProduct(
      int readStock, int idProduct, int? slotId);

}

class StocktakingCountsRepository extends BaseRepository implements IStocktakingCountsRepository {
  StocktakingCountsRepository({required this.provider});
  final IStocktakingCountsProvider provider;

  @override
  Future<WarehousesModel> getWarehouses()async{
    print("ere");
    final apiResponse = await provider.getWarehouses();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk ){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

  @override
  Future<UpdatedProductModel> updateProduct(int physicalInventoryId, int warehouseId,String storageName, int amount, int idProduct, int? slotId) async{
    print("ere");
    final apiResponse = await provider.updateProduct(physicalInventoryId, warehouseId, storageName, amount, idProduct,slotId);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk ){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

  @override
  Future<UpdatedProductModel> matchProduct(int readStock, int idProduct, int? slotId) async{
    print("ere");
    final apiResponse = await provider.matchProduct(readStock, idProduct,slotId);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk ){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

}
