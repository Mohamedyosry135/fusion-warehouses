// ignore: one_member_abstracts
import 'dart:convert';

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/pages/profile/models/certificate_zakat_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_update_model.dart';
import 'package:fusion_warehouses/pages/profile/models/zatca_certificates_resp.dart';
import 'package:get/get.dart';

abstract class IProfileProvider {
  Future<Response<ProfileModel>> getProfile();

  Future<Response<ZatcaCertificateResp>> getZatacaCertifi();

  Future<Response<CertificateRespModel>> postZatacaCertifi(String otp,String vatNumber);

  Future<Response<ProfileModel>> updateProfile(ProfileUpdateModel data);
}

class ProfileProvider extends BaseAuthProvider implements IProfileProvider {
  @override
  Future<Response<ProfileModel>> getProfile() async {
    try {
      Response<ProfileModel> resp = await get<ProfileModel>(
        "profile/",
        decoder: ProfileModel.fromJson,
      );
      return resp;
    } catch (error) {
      print(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<Response<ProfileModel>> updateProfile(data) async {
    printInfo(info: jsonEncode(data.toJson()));
    final resp = await put<ProfileModel>(
      "profile/",
      data.toJson(),
      decoder: ProfileModel.fromJson,
    );

    print(resp.bodyString);
    print(resp.statusCode);

    return resp;
  }

  @override
  Future<Response<ZatcaCertificateResp>> getZatacaCertifi() async {
    try {
      Response<ZatcaCertificateResp> resp = await get<ZatcaCertificateResp>(
        "zatca_certificates",
        decoder: ZatcaCertificateResp.fromJson,
      );
      return resp;
    } catch (error) {
      print(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<Response<CertificateRespModel>> postZatacaCertifi(String otp,String vatNumber) async {
    print({
      "zatca_certificate": {"otp": otp},
      "vat_number":vatNumber
    });
    try {
      Response<CertificateRespModel> resp = await post<CertificateRespModel>(
        "zatca_certificates",
        {
          "zatca_certificate": {"otp": otp},
          "vat_number":vatNumber
        },
        decoder: CertificateRespModel.fromJson,
      );
      return resp;
    } catch (error) {
      print(error.toString());
      throw Exception(error.toString());
    }
  }
}
