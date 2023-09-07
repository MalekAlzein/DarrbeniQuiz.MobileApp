class TokenInfoModel {
  String? token;
  Specialization? specialization;

  TokenInfoModel({this.token, this.specialization});

  TokenInfoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    specialization = json['specialization'] != null
        ? new Specialization.fromJson(json['specialization'])
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

class Specialization {
  int? id;
  String? uuid;
  String? specializationName;
  bool? moreOption;
  String? image;
  int? collageId;

  Specialization(
      {this.id,
      this.uuid,
      this.specializationName,
      this.moreOption,
      this.image,
      this.collageId});

  Specialization.fromJson(Map<String, dynamic> json) {
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
}
