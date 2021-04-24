import 'package:flutter/material.dart';
import 'package:rocketnlw/challenge/challenge_controller.dart';
import 'package:rocketnlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:rocketnlw/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:rocketnlw/challenge/widgets/quiz/quiz_widget.dart';
import 'package:rocketnlw/result/result_page.dart';
import 'package:rocketnlw/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
//_ChallengePageState createState() => _ChallengePageState(questions);
}

class _ChallengePageState extends State<ChallengePage> {
  //final List<QuestionModel> questions;

  //_ChallengePageState(this.questions);

  final controller = ChallengeController();

  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnwserRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      /*
      body: QuizWidget(
        question: widget.questions[0],
      ),
       */
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value <= widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.white(
                              label: 'Pular',
                              onTap: nextPage,
                            ),
                          ),
                        if (value == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                              label: 'Confirmar',
                              onTap: () {
                                //Navigator.pop(context);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                      title: widget.title,
                                      lenght: widget.questions.length,
                                      result: controller.qtdAnwserRight,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ))),
      ),
    );
  }
}
