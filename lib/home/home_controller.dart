import 'package:flutter/material.dart';
import 'package:rocketnlw/core/app_images.dart';
import 'package:rocketnlw/home/home_repository.dart';
import 'package:rocketnlw/home/home_state.dart';
import 'package:rocketnlw/shared/models/awnser_model.dart';
import 'package:rocketnlw/shared/models/question_model.dart';
import 'package:rocketnlw/shared/models/quiz_model.dart';
import 'package:rocketnlw/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final respository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await respository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await respository.getQuizzes();
    state = HomeState.sucess;
  }
}
