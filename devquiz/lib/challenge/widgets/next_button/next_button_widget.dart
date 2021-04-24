import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      child: TextButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                color: this.borderColor,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(this.backgroundColor)),
        onPressed: this.onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: this.fontColor,
          ),
        ),
      ),
    );
  }
}
