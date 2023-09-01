class SubjectModel {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  SubjectModel({this.status, this.message, this.data, this.code});

  SubjectModel.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  int? id;
  String? uuid;
  String? name;
  Null? specializationId;
  int? hasMaster;
  int? hasGraduation;

  Data(
      {this.id,
      this.uuid,
      this.name,
      this.specializationId,
      this.hasMaster,
      this.hasGraduation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    specializationId = json['Specialization_id'];
    hasMaster = json['has_master'];
    hasGraduation = json['has_graduation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['Specialization_id'] = this.specializationId;
    data['has_master'] = this.hasMaster;
    data['has_graduation'] = this.hasGraduation;
    return data;
  }
}
