// ignore: one_member_abstracts

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/product_details/models/bc_product_details_model.dart';
import 'package:fusion_warehouses/pages/product_details/models/sh_product_details_model.dart';
import 'package:get/get.dart';


abstract class IProductDetailsProvider {
  Future<Response<BCProductDetailsModel>> getProductDetails(String barcode);

  Future<Response<SHProductDetailsModel>> getSHProductDetails(String barcode);

}

class ProductDetailsProvider extends BaseAuthProvider implements IProductDetailsProvider {
  @override
  Future<Response<BCProductDetailsModel>> getProductDetails(String barcode) async{
    Response<BCProductDetailsModel> resp = await  get<BCProductDetailsModel>(
      "${EndPoints.PRODUCT_DETAILS_BC}",
      query: {
        "search":barcode,
        "page":"1"
      },
      decoder: BCProductDetailsModel.fromJson,
    );
     print("statusCodestatusCode ${resp.statusCode}");
     print("lolbodyStringbodyString ${resp.body}");
     print("lolbodyStringbodyString ${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<SHProductDetailsModel>> getSHProductDetails(String barcode)async{
    Response<SHProductDetailsModel> resp = await  get<SHProductDetailsModel>(
      "${EndPoints.PRODUCT_DETAILS_SH}",
      query: {
        "bar_code":barcode,
        "page":"1"
      },
      decoder: SHProductDetailsModel.fromJson,
    );
    print("statusCodestatusCode ${resp.statusCode}");
    print("lolbodyStringbodyString ${resp.body}");
    print("lolbodyStringbodyString ${resp.bodyString}");

    return resp;
  }

}
// http://apistaging.farmersglobe.com/drivers/api/v1/initial_data/user_data