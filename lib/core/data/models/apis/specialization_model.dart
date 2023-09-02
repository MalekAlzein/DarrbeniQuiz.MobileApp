import 'dart:convert';

class SpecializationsModel {
  int? id;
  String? uuid;
  String? specializationName;
  bool? moreOption;
  String? image;
  int? collageId;

  SpecializationsModel(
      {this.id,
      this.uuid,
      this.specializationName,
      this.moreOption,
      this.image,
      this.collageId});

  SpecializationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    specializationName = json['specialization_name'];
    moreOption = json['more_option'];
    image = json['image'];
    collageId = json['collage_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['specialization_name'] = this.specializationName;
    data['more_option'] = this.moreOption;
    data['image'] = this.image;
    data['collage_id'] = this.collageId;
    return data;
  }

  static Map<String, dynamic> toMap(SpecializationsModel model) {
    return {
      'id': model.id,
      'uuid': model.uuid,
      'specialization_name': model.specializationName,
      'more_option': model.moreOption,
      'image': model.image,
      'collage_id': model.collageId,
    };
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
