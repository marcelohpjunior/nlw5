import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController(initialPage: 0);

  @override
  void initState() {
    this.pageController.addListener(() {
      this.controller.currentPage = this.pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  nextPage() {
    if (this.controller.currentPage < this.widget.questions.length)
      this.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  onSelected(bool value) {
    if (value) {
      this.controller.qtdAwnserRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    onPressed: () => Navigator.pop(context)),
                ValueListenableBuilder<int>(
                  valueListenable: this.controller.currentPageNotifier,
                  builder: (context, value, _) {
                    return QuestionIndicatorWidget(
                      currentPage: value,
                      length: this.widget.questions.length,
                    );
                  },
                ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        // children:
        // widget.questions
        //     .map((e) => QuizWidget(
        //           question: e,
        //           onSelected: onSelected,
        //           isLastQuestion:  ==
        //               this.widget.questions.length ,
        //         ))
        //     .toList(),
        children: [
          for (var i = 0; i < this.widget.questions.length; i++)
            QuizWidget(
              question: this.widget.questions[i],
              onSelected: onSelected,
              isLastQuestion: i == this.widget.questions.length - 1,
            )
        ],
        controller: this.pageController,
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder<int>(
            valueListenable: this.controller.currentPageNotifier,
            builder: (context, int value, _) => SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value < this.widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      ),
                    ),
                  if (value == this.widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        title: this.widget.title,
                                        length: this.widget.questions.length,
                                        result: this.controller.qtdAwnserRight,
                                      )));
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
