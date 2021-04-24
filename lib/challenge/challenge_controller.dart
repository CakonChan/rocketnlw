import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//CurrentPage


class ChallengeController{
  final currentPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
  int qtdAnwserRight = 0;
  //var currentPage = 3;

}