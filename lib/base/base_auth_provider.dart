import 'package:fusion_warehouses/base/base_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../consts/urls.dart';



class BaseAuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit() ;
    httpClient.baseUrl = EndPoints.BASE_URL;
    // httpClient.baseUrl = "https://api.fusionksa.com/shops/api/v1/";
    //http://apistaging.farmersglobe.com/shops/api/v1/
  }
}
