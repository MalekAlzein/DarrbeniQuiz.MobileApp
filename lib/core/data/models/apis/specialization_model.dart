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
}
