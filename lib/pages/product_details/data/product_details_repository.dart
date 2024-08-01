import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/product_details/models/bc_product_details_model.dart';
import 'package:fusion_warehouses/pages/product_details/models/sh_product_details_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';

import 'product_details_api_provider.dart';

abstract class IProductDetailsRepository {
  Future<BCProductDetailsModel> getProductDetails(String barcode);

  Future<SHProductDetailsModel> getSHProductDetails(String barcode);
}

class ProductDetailsRepository extends BaseRepository
    implements IProductDetailsRepository {
  ProductDetailsRepository({required this.provider});

  final IProductDetailsProvider provider;

  @override
  Future<BCProductDetailsModel> getProductDetails(String barcode) async {
    print("ere");
    final apiResponse = await provider.getProductDetails(barcode);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      final responseJson = const JsonDecoder().convert(apiResponse.bodyString!);
      if(responseJson['code'] == 404){
        throw(AppStrings.youDontHaveAccess) ;

      }else{
        throw(responseJson['error'].toString()) ;

      }
    }
  }

  @override
  Future<SHProductDetailsModel> getSHProductDetails(String barcode) async {
    print("ere");
    final apiResponse = await provider.getSHProductDetails(barcode);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk) {
      return apiResponse.body!;
    } else {
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
