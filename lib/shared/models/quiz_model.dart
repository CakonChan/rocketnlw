import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocketnlw/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: 'facil',
        Level.medio: 'medio',
        Level.dificil: 'dificil',
        Level.perito: 'perito'
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return new QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(
          map['questions']?.map((e) => QuestionModel.fromMap(e))),
      questionAnswered: map['questionAnswered'] as int,
      imagem: map['imagem'] as String,
      level: map['level'].toString().parse,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'questions': questions.map((e) => e.toMap()).toList(),
      'questionAnswered': this.questionAnswered,
      'imagem': this.imagem,
      'level': this.level.parse,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
