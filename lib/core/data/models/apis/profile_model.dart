class ProfileModel {
  bool? status;
  String? message;
  Data? data;
  int? code;

  ProfileModel({this.status, this.message, this.data, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? name;
  int? mobilePhone;

  Data({this.name, this.mobilePhone});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobilePhone = json['mobile_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile_phone'] = this.mobilePhone;
    return data;
  }
}
