// ignore: one_member_abstracts
import 'dart:convert';
import 'dart:developer';

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/storage.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';


abstract class ILoginProvider {
  Future<Response<LoginResponeModel>> loginWithEmailAndPassword(
      String phone, String password);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {
  @override
  Future<Response<LoginResponeModel>> loginWithEmailAndPassword(
      String phone, String password) async{
    print(jsonEncode({
      "phone":phone,
      "password":password,
      "device_type":"android",
      "app_type":"shopmanagerandroid",
      "device_token":token,
      "language_id":AuthService.to.language == "ar" ?2 : 1,
      "is_fusion":true,
    }));
    Response<LoginResponeModel> loginResp = await  post<LoginResponeModel>(
        EndPoints.LOGIN,
      {"phone":phone,
        "password":password,
        "device_type":"android",
        "app_type":"shopmanagerandroid",
        "device_token":token,
        "language_id":AuthService.to.language == "ar" ?2 : 1,
        "is_fusion":true,
      },
        decoder: LoginResponeModel.fromJson,
    );
 log("bodyStringbodyStringbodyString ${loginResp.bodyString}");
 log("bodyStringbodyStringbodyString ${  EndPoints.LOGIN}");
    return loginResp;
  }
}
