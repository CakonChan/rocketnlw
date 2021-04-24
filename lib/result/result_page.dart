import 'package:flutter/material.dart';
import 'package:rocketnlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:rocketnlw/core/app_images.dart';
import 'package:rocketnlw/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.lenght,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Parabéns!',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Você Concluiu',
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: '\n$title',
                            style: AppTextStyles.bodyBold,
                            children: [
                              TextSpan(
                                text: '\nCom $result de $lenght Acertos.',
                                style: AppTextStyles.body,
                              ),
                            ]),
                      ]),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Até...',
                  style: AppTextStyles.heading40,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share('check out my website');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Começo',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
