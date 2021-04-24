import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: widget.percent)
        .animate(animationController);
    animationController.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return Stack(
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      backgroundColor: AppColors.chartSecondary,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                      value: animation.value,
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  "${(animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ))
              ],
            );
          },
        ));
  }
}
