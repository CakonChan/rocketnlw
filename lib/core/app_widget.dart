import 'package:flutter/material.dart';
import 'package:rocketnlw/challenge/challenge_page.dart';
import 'package:rocketnlw/home/home_page.dart';
import 'package:rocketnlw/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      //home: ChallengePage(),
      home: SplashPage(),
    );
  }
}
