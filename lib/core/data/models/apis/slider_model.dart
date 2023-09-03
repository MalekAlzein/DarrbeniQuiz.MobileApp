class SliderModel {
  int? id;
  String? uuid;
  String? imageUrl;
  String? link;

  SliderModel({this.id, this.uuid, this.imageUrl, this.link});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    imageUrl = json['image_url'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['image_url'] = this.imageUrl;
    data['link'] = this.link;
    return data;
  }
}
