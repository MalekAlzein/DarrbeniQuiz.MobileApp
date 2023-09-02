class SubjectModel {
  int? id;
  String? uuid;
  String? name;
  int? specializationId;

  SubjectModel({this.id, this.uuid, this.name, this.specializationId});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    specializationId = json['specialization_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['specialization_id'] = this.specializationId;
    return data;
  }
}
