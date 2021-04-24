import 'package:devquiz/challenge/widgets/awnser/awnser_wisget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  final bool isLastQuestion;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
    required this.isLastQuestion,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            this.widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnsers(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) async {
                indexSelected = i;
                setState(() {});
                if (this.widget.isLastQuestion) {
                  this.widget.onSelected(value);
                } else {
                  await Future.delayed(Duration(seconds: 2))
                      .then((_) => this.widget.onSelected(value));
                }
              },
            ),
        ],
      ),
    );
  }
}
