import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/updated_product_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/warehouses_model.dart';
import 'package:get/get.dart';

abstract class IStocktakingCountsProvider {
  Future<Response<WarehousesModel>> getWarehouses();

  Future<Response<UpdatedProductModel>> updateProduct(
      int physicalInventoryId,
      int warehouseId,
      String storageName,
      int amount,
      int idProduct,
      int? slotId);

  Future<Response<UpdatedProductModel>> matchProduct(
      int readStock, int idProduct, int? slotId);
}

class StocktakingCountsProvider extends BaseAuthProvider
    implements IStocktakingCountsProvider {
  @override
  Future<Response<WarehousesModel>> getWarehouses() async {
    Response<WarehousesModel> resp = await get<WarehousesModel>(
      "${EndPoints.WAREHOUSES}",
      query: {
        "all": "true",
      },
      decoder: WarehousesModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<UpdatedProductModel>> updateProduct(
      int physicalInventoryId,
      int warehouseId,
      String storageName,
      int amount,
      int idProduct,
      int? slotId) async {
    Response<UpdatedProductModel> resp = await put<UpdatedProductModel>(
      "${EndPoints.PRODUCTS_TITLE}/${idProduct}",
      {
        "product": {
          "product_physical_inventories_attributes": [
            {
              "stock": amount,
              "storage_place": storageName,
              "warehouse_id": warehouseId,
              "physical_inventory_id": "${physicalInventoryId}",
              "id": slotId
            }
          ]
        }
      },
      decoder: UpdatedProductModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<UpdatedProductModel>> matchProduct(
      int readStock, int idProduct, int? slotId) async {
    Response<UpdatedProductModel> resp = await put<UpdatedProductModel>(
      "${EndPoints.PRODUCTS_TITLE}/${idProduct}",
      {
        "product": {
          "product_physical_inventories_attributes": [
            {"id": slotId.toString(), "real_stock": readStock.toString()}
          ]
        }
      },
      decoder: UpdatedProductModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }
}
