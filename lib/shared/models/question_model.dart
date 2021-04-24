import 'dart:convert';

import 'package:rocketnlw/shared/models/awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({required this.title, required this.awnsers})
      : assert(
          awnsers.length == 4,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'],
      awnsers: List<AwnserModel>.from(
          map['awnsers']?.map((e) => AwnserModel.fromMap(e))),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': title,
      'awnsers': awnsers.map((e) => e.toMap()).toList(),
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
