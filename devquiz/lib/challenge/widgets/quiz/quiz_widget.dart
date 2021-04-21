import 'package:devquiz/challenge/widgets/awnser/awnser_wisget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(
            title: "Possibilita a criação de app nativamente",
            isRight: true,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Possibilita a criação de app nativamente",
            isRight: false,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Possibilita a criação de app nativamente",
            isRight: true,
            isSelected: false,
          ),
          AwnserWidget(
            title: "Possibilita a criação de app nativamente",
            isRight: false,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
