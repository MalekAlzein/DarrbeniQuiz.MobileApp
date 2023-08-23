class ProfileModel {
  String? uuid;
  String? name;
  String? phone;
  String? photo;

  ProfileModel({this.uuid, this.name, this.phone, this.photo});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    phone = json['phone'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    return data;
  }
}
