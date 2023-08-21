class TokenInfoModel {
  String? token;

  TokenInfoModel({this.token});

  TokenInfoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

// class TokenInfoModel {
//   String? accessToken;

//   TokenInfoModel({this.accessToken});

//   TokenInfoModel.fromJson(Map<String, dynamic> json) {
//     accessToken = json['accessToken'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['accessToken'] = this.accessToken;
//     return data;
//   }
// }
