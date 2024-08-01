import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';

import 'login_api_provider.dart';

abstract class ILoginRepository {
  Future<LoginResponeModel> login(String phone, String password);
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository({required this.provider});

  final ILoginProvider provider;

  @override
  Future<LoginResponeModel> login(String phone, String password) async {
    print("ere");
    final apiResponse =
        await provider.loginWithEmailAndPassword(phone, password);
    // printInfo(info: apiResponse.statusCode.toString());
    print("apiResponse.isOk ${apiResponse.isOk}");
    print("apiResponse.isOk ${apiResponse.statusCode}");

    print("apiResponse.login ${apiResponse.bodyString}");

    if (apiResponse.isOk) {
      bool refuse= true;
      apiResponse.body?.data?.user?.roles?.forEach((element) {
        if (element.key!.contains("admin") || element.key!.contains("purchase_order_complete") ||
            element.key!.contains("warehouses_delivery")  || element.key!.contains("stocktaking")
            || element.key!.contains("purchasing_management")  || element.key!.contains("external_purchase_order_complete")  || element.key!.contains("sales_manager")) {
          print("in if  ${element.key}");

          AuthService.to.login(apiResponse.body!);
          refuse = false;
          return;
        }
        print("roleskeykey  ${element.key}");
      });
if(refuse){
  throw (AppStrings.youDontHaveAccessToLoginApp);
}
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      final responseJson = const JsonDecoder().convert(apiResponse.bodyString!);

      throw (responseJson['error']);
    }
  }
}
