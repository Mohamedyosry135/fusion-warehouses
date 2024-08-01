import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_brands_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_category_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_of_stock_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/stocktaking_details_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/support_ticket_type_model.dart';

import 'stocktaking_details_api_provider.dart';

abstract class IStocktakingDetailsRepository {
  Future<StocktakingDetailsModel> getStockDetails(int id);

  Future<ProductCategoriesModel> getProductCategories();

  Future<ProductBrandsModel> getProductBrands();

  Future<ProductsOfStockModel> getProductsOfStock(
      int physicalInventoryId, int page, int perPage,String search,String productCategoryId,String supportTicketTypeId, String outOfStock, String brandId);

  Future<StocktakingDetailsModel> updateStockState(
      int id, String status);

  Future<SupportTicketTypeModel> getSupportTicketTypes();

}

class StocktakingDetailsRepository extends BaseRepository
    implements IStocktakingDetailsRepository {
  StocktakingDetailsRepository({required this.provider});

  final IStocktakingDetailsProvider provider;

  @override
  Future<StocktakingDetailsModel> getStockDetails(int id) async {
    final apiResponse = await provider.getStockDetails(id);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<ProductBrandsModel> getProductBrands() async {
    final apiResponse = await provider.getProductBrands();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<ProductCategoriesModel> getProductCategories() async {
    final apiResponse = await provider.getProductCategories();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<ProductsOfStockModel> getProductsOfStock(
      int physicalInventoryId, int page, int perPage,String search,String productCategoryId,String supportTicketTypeId, String outOfStock, String brandId) async {
    print("ere");
    final apiResponse =
        await provider.getProductsOfStock(physicalInventoryId, page, perPage, search, productCategoryId, supportTicketTypeId, outOfStock, brandId);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<StocktakingDetailsModel> updateStockState(int id, String status) async{
    final apiResponse = await provider.updateStockState(id, status);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<SupportTicketTypeModel> getSupportTicketTypes() async{
    final apiResponse = await provider.getSupportTicketTypes();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }
}
