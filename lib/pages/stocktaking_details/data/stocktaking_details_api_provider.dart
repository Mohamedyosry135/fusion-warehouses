import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_brands_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_category_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_of_stock_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/stocktaking_details_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/support_ticket_type_model.dart';
import 'package:get/get.dart';

abstract class IStocktakingDetailsProvider {
  Future<Response<StocktakingDetailsModel>> getStockDetails(int id);

  Future<Response<ProductCategoriesModel>> getProductCategories();

  Future<Response<ProductBrandsModel>> getProductBrands();

  Future<Response<ProductsOfStockModel>> getProductsOfStock(
      int physicalInventoryId, int page, int perPage,String search,String productCategoryId,String supportTicketTypeId, String outOfStock, String brandId);

  Future<Response<StocktakingDetailsModel>> updateStockState(
      int id, String status);
  Future<Response<SupportTicketTypeModel>> getSupportTicketTypes();
}

class StocktakingDetailsProvider extends BaseAuthProvider
    implements IStocktakingDetailsProvider {
  @override
  Future<Response<StocktakingDetailsModel>> getStockDetails(int id) async {
    Response<StocktakingDetailsModel> resp = await get<StocktakingDetailsModel>(
      "${EndPoints.STOCKITEMS}/${id}",
      decoder: StocktakingDetailsModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<ProductCategoriesModel>> getProductCategories() async {
    Response<ProductCategoriesModel> resp = await get<ProductCategoriesModel>(
        "${EndPoints.ProductCategory}",
        query: {"all": "true"},
        decoder: ProductCategoriesModel.fromJson);
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<ProductBrandsModel>> getProductBrands() async {
    Response<ProductBrandsModel> resp = await get<ProductBrandsModel>(
      "${EndPoints.ProductBrand}",
      query: {"all": "true"},
      decoder: ProductBrandsModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<ProductsOfStockModel>> getProductsOfStock(
      int physicalInventoryId, int page, int perPage,String search,String productCategoryId,String supportTicketTypeId, String outOfStock, String brandId) async {
    Response<ProductsOfStockModel> resp = await get<ProductsOfStockModel>(
      "${EndPoints.PRODUCTS_OF_STOCK}",
      query: {
        "product_groups": "true",
        "physical_inventory_id": physicalInventoryId.toString(),
        "page": page.toString(),
        "per_page": perPage.toString(),
        "search":search.toString(),
        "product_category_id":productCategoryId.toString(),
        "support_ticket_type_id":supportTicketTypeId.toString(),
        "out_of_stock":outOfStock.toString(),
        "brand_id":brandId.toString()

      },
      decoder: ProductsOfStockModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<StocktakingDetailsModel>> updateStockState(
      int id, String status) async {

    Response<StocktakingDetailsModel> resp = await put<StocktakingDetailsModel>(
      "${EndPoints.STOCKITEMS}/${id}",
      {
          "physical_inventory": {"status": status}
      },
      decoder: StocktakingDetailsModel.fromJson,
    );
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<SupportTicketTypeModel>> getSupportTicketTypes() async{
    Response<SupportTicketTypeModel> resp = await get<SupportTicketTypeModel>(
      "${EndPoints.SUPPORT_TICKET_TYPES}",
      query: {"all": "true"},
      decoder: SupportTicketTypeModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }
}
