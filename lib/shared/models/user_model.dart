import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({
    required this.name,
    required this.photoUrl,
    required this.score,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'photoUrl': this.photoUrl,
      'score': this.score,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
//
}
