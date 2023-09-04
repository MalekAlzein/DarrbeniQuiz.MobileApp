import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';

class TokenInfoModel {
  String? token;
  SpecializationsModel? specialization;

  TokenInfoModel({
    this.token,
    this.specialization,
  });

  TokenInfoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    specialization = json['specialization'] != null
        ? new SpecializationsModel.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.specialization != null) {
      data['specialization'] = this.specialization!.toJson();
    }
    return data;
  }
}
