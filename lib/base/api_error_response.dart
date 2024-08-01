class ApiErrorResponse {
  int? code;
  String? status;
  Error? error;

  ApiErrorResponse({this.code, this.status,this.error});

  ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];

    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;

    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  List<String>? base;

  Error({this.base});

  Error.fromJson(Map<String, dynamic> json) {
    base = json['base'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    return data;
  }
}
