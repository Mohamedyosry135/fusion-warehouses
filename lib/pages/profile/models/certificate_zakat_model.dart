import 'package:fusion_warehouses/pages/profile/models/zatca_certificates_resp.dart';

class CertificateRespModel{
  int? code;
  String? status;
  CertificateZakat? data;
  String? message;

  CertificateRespModel({this.code, this.status, this.data, this.message});

  CertificateRespModel.fromJson(json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null && json['data'].toString() != "[]" ? new CertificateZakat.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
