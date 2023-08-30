import 'dart:convert';

import 'package:flutter_templete/core/data/models/apis/category_model.dart';

class CollegeModel {
  int? id;
  String? uuid;
  String? name;
  String? logo;
  bool? isMaster;
  CategoryModel? category;

  CollegeModel(
      {this.id, this.uuid, this.name, this.logo, this.isMaster, this.category});

  CollegeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    logo = json['logo'];
    isMaster = json['is_master'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['is_master'] = this.isMaster;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CollegeModel model) {
    return {
      'id': model.id,
      'uuid': model.uuid,
      'name': model.name,
      'logo': model.logo,
      'category': model.category,
    };
  }

  static String encode(List<CollegeModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CollegeModel.toMap(element))
            .toList(),
      );

  static List<CollegeModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CollegeModel>((item) => CollegeModel.fromJson(item))
          .toList();
}
