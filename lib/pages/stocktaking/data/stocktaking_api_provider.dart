

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/stocktaking/models/stocktaking_model.dart';
import 'package:get/get.dart';



abstract class IStocktakingProvider {
  Future<Response<StockItemsModel>> getStockItems(int page,String status);


}

class StocktakingProvider extends BaseAuthProvider implements IStocktakingProvider {
  @override
  Future<Response<StockItemsModel>> getStockItems(int page,String status) async{
    Response<StockItemsModel> resp = await  get<StockItemsModel>(
      EndPoints.STOCKITEMS,
      query: {
        "page":page.toString(),
        "status":status
      },
      decoder: StockItemsModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

}
