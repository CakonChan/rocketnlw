import 'package:flutter/material.dart';
import 'package:rocketnlw/core/app_gradients.dart';
import 'package:rocketnlw/core/app_text_styles.dart';
import 'package:rocketnlw/home/widgets/score_card/score_card_widget.dart';
import 'package:rocketnlw/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.all(5),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold,
                              ),
                            ]),
                      ),
                      /*
                  Text('Olá, Caio', style: AppTextStyles.title),
                  Text('Dev Flutter + Dar', style: AppTextStyles.titleBold,
                  Fica ruim Então text.rich sera util
                   */
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 55,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.photoUrl,
                              /*"https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg"*/
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1.0), child: ScoreCardWidget(
                  percent: user.score/100,
                )),
              ],
            ),
          ),
        );
}
