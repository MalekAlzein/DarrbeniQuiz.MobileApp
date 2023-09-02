class TermsModel {
  int? id;
  String? termName;
  int? specializationId;

  TermsModel({this.id, this.termName, this.specializationId});

  TermsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    termName = json['term_name'];
    specializationId = json['specialization_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['term_name'] = this.termName;
    data['specialization_id'] = this.specializationId;
    return data;
    //end model
  }
}
