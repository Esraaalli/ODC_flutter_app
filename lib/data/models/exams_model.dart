// ignore_for_file: public_member_api_docs, sort_constructors_first


class ExamsModel {
  String? examSubject;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  bool? examfinal;
  ExamsModel({
    required this.examSubject,
    required this.examDate,
    required this.examStartTime,
    required this.examEndTime,
    this.examfinal,
  });
  ExamsModel.fromJson(Map<String, dynamic> json) {
    examSubject = json['examSubject'];
    examDate = json['examDate'];
    examStartTime = json['examStartTime'];
    examEndTime = json['examEndTime'];
    examfinal = json['examfinal'];

  }
}
