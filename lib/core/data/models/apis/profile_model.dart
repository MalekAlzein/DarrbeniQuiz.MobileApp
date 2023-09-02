class ProfileModel {
  String? name;
  int? mobilePhone;

  ProfileModel({this.name, this.mobilePhone});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
