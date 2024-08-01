import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';

import 'package:fusion_warehouses/pages/profile/data/profile_api_provider.dart';
import 'package:fusion_warehouses/pages/profile/models/certificate_zakat_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_update_model.dart';
import 'package:fusion_warehouses/pages/profile/models/zatca_certificates_resp.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

abstract class IProfileRepository {
  Future<ProfileModel> getProfile() ;
  // Future<ZatcaCertificateResp> getZatacaCertifi();
  // Future<CertificateRespModel> postZatacaCertifi(String otp,String vatNumber);
  Future<ProfileModel>updateProfile(ProfileUpdateModel data);

}

class ProfileRepository extends BaseRepository
    implements IProfileRepository {
  ProfileRepository({required this.provider});

  final IProfileProvider provider;

  @override
  Future<ProfileModel> getProfile() async{
    print("hello profile");
    final apiResponse = await provider.getProfile() ;
    printInfo(info: apiResponse.statusCode.toString());
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
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
  Future<ProfileModel> updateProfile(ProfileUpdateModel data) async{
    final apiResponse = await provider.updateProfile(data) ;
    printInfo(info: apiResponse.statusCode.toString());
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.statusCode}");
      final responseJson = const JsonDecoder().convert(apiResponse.bodyString!);
      if(responseJson['code'] == 404){
        throw(AppStrings.youDontHaveAccess) ;

      }else{
        throw(responseJson['error'].toString()) ;

      }
    }
  }

  // @override
  // Future<ZatcaCertificateResp> getZatacaCertifi()async {
  //   final apiResponse = await provider.getZatacaCertifi() ;
  //   printInfo(info: apiResponse.statusCode.toString());
  //   print("ZatcaCertificateResp.isOk ${apiResponse.isOk}");
  //   if(apiResponse.isOk && apiResponse.body != null){
  //     return apiResponse.body! ;
  //   }else {
  //     print("ZatcaCertificateResp.body!.msg ${apiResponse.statusCode}");
  //     throw(getErrorMessage(apiResponse.bodyString!)) ;
  //   }
  // }
  //
  // @override
  // Future<CertificateRespModel> postZatacaCertifi(String otp,String vatNumber) async{
  //   final apiResponse = await provider.postZatacaCertifi(otp,vatNumber) ;
  //   printInfo(info: apiResponse.statusCode.toString());
  //   print("ZatcaCertificateResp.isOk ${apiResponse.isOk}");
  //   if(apiResponse.isOk && apiResponse.body != null){
  //     return apiResponse.body! ;
  //   }else {
  //     print("ZatcaCertificateResp.body!.msg ${apiResponse.statusCode}");
  //     throw(getErrorMessage(apiResponse.bodyString!)) ;
  //   }
  // }
}
