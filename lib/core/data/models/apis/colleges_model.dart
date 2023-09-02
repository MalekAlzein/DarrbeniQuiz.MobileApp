class CollegesModel {
  int? id;
  String? collageName;

  CollegesModel({this.id, this.collageName});

  CollegesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collageName = json['collage_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collage_name'] = this.collageName;
    return data;
  }
}
