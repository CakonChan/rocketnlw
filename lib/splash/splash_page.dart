import 'package:flutter/material.dart';
import 'package:rocketnlw/core/app_gradients.dart';
import 'package:rocketnlw/core/app_images.dart';
import 'package:rocketnlw/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
