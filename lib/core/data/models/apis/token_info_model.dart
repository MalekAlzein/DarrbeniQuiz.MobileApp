class TokenInfoModel {
  String? token;
  int? specializationId;

  TokenInfoModel({this.token, this.specializationId});

  TokenInfoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    specializationId = json['specialization_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['specialization_id'] = this.specializationId;
    return data;
  }
}
