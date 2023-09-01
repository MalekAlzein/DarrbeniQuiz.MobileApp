class QuestionModel {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  QuestionModel({this.status, this.message, this.data, this.code});

  QuestionModel.fromJson(Map<String, dynamic> json) {
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
  String? questionText;
  String? reference;
  List<Answers>? answers;
  int? correctId;

  Data({this.questionText, this.reference, this.answers, this.correctId});

  Data.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    reference = json['reference'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
    correctId = json['correct_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionText'] = this.questionText;
    data['reference'] = this.reference;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_id'] = this.correctId;
    return data;
  }
}

class Answers {
  String? text;
  int? id;

  Answers({this.text, this.id});

  Answers.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['id'] = this.id;
    return data;
  }
}
