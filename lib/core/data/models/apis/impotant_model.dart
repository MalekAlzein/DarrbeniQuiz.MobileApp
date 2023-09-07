// class ImportantModel {
//   int? id;
//   String? uuid;
//   String? questionContent;
//   String? reference;
//   int? subjectId;
//   int? termId;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;
//   List<Answers>? answers;

//   ImportantModel(
//       {this.id,
//       this.uuid,
//       this.questionContent,
//       this.reference,
//       this.subjectId,
//       this.termId,
//       this.createdAt,
//       this.updatedAt,
//       this.pivot,
//       this.answers});

//   ImportantModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     uuid = json['uuid'];
//     questionContent = json['question_content'];
//     reference = json['reference'];
//     subjectId = json['subject_id'];
//     termId = json['term_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//     if (json['answers'] != null) {
//       answers = <Answers>[];
//       json['answers'].forEach((v) {
//         answers!.add(new Answers.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['uuid'] = this.uuid;
//     data['question_content'] = this.questionContent;
//     data['reference'] = this.reference;
//     data['subject_id'] = this.subjectId;
//     data['term_id'] = this.termId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     if (this.answers != null) {
//       data['answers'] = this.answers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Pivot {
//   int? userId;
//   int? questionId;
//   String? createdAt;
//   String? updatedAt;

//   Pivot({this.userId, this.questionId, this.createdAt, this.updatedAt});

//   Pivot.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     questionId = json['question_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['question_id'] = this.questionId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Answers {
//   int? id;
//   String? uuid;
//   String? answerContent;
//   int? questionId;
//   int? isCorrect;
//   Null createdAt;
//   Null updatedAt;

//   Answers(
//       {this.id,
//       this.uuid,
//       this.answerContent,
//       this.questionId,
//       this.isCorrect,
//       this.createdAt,
//       this.updatedAt});

//   Answers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     uuid = json['uuid'];
//     answerContent = json['answer_content'];
//     questionId = json['question_id'];
//     isCorrect = json['is_correct'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['uuid'] = this.uuid;
//     data['answer_content'] = this.answerContent;
//     data['question_id'] = this.questionId;
//     data['is_correct'] = this.isCorrect;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
