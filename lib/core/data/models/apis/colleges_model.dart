import 'dart:convert';

class SpecializationsModel {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  SpecializationsModel({this.status, this.message, this.data, this.code});

  SpecializationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }

  static String encode(List<SpecializationsModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>(
                (element) => SpecializationsModel.toMap(element))
            .toList(),
      );

  static List<SpecializationsModel> decode(String strList) => (json
          .decode(strList) as List<dynamic>)
      .map<SpecializationsModel>((item) => SpecializationsModel.fromJson(item))
      .toList();
}

class Data {
  int? id;
  String? collageName;

  Data({this.id, this.collageName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collageName = json['collage_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collage_name'] = this.collageName;
    return data;
  }
}
