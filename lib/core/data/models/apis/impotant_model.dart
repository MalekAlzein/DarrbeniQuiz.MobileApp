class ImportantModel {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  ImportantModel({this.status, this.message, this.data, this.code});

  ImportantModel.fromJson(Map<String, dynamic> json) {
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
  String? questionContent;
  String? reference;
  int? subjectId;
  int? specializationId;
  int? correctId;
  List<Answers>? answers;

  Data(
      {this.id,
      this.uuid,
      this.questionContent,
      this.reference,
      this.subjectId,
      this.specializationId,
      this.correctId,
      this.answers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    questionContent = json['question_content'];
    reference = json['reference'];
    subjectId = json['subject_id'];
    specializationId = json['specialization_id'];
    correctId = json['correct_id'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['question_content'] = this.questionContent;
    data['reference'] = this.reference;
    data['subject_id'] = this.subjectId;
    data['specialization_id'] = this.specializationId;
    data['correct_id'] = this.correctId;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
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
