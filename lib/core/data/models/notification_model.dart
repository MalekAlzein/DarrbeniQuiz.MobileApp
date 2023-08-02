class NotifictionModel {
  String? notifctionType;
  String? title;
  String? text;
  String? subStatus;

  NotifictionModel(
      {this.notifctionType, this.title, this.text, this.subStatus});

  NotifictionModel.fromJson(Map<String, dynamic> json) {
    notifctionType = json['notifction_type'];
    title = json['title'];
    text = json['text'];
    subStatus = json['sub_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifction_type'] = this.notifctionType;
    data['title'] = this.title;
    data['text'] = this.text;
    data['sub_status'] = this.subStatus;
    return data;
  }
}
