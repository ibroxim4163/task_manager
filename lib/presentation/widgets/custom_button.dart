import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final void Function()? onPressed;
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.color = AppColors.mainColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: color,
          fixedSize: Size(width, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
