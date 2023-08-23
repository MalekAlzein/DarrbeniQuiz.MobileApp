class SilderModel {
  int? id;
  String? imageUrl;
  String? link;

  SilderModel({this.id, this.imageUrl, this.link});

  SilderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['link'] = this.link;
    return data;
  }
}
