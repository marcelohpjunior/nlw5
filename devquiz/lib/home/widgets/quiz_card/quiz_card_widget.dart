import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String completed;
  final double percent;
  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.completed,
    required this.percent,
  })   : assert(percent <= 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.border),
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(this.image),
          ),
          Text(
            this.title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  this.completed,
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                child: ProgressIndicatorWidget(value: this.percent),
              )
            ],
          )
        ],
      ),
    );
  }
}
