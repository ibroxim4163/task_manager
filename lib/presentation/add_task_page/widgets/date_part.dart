import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../widgets/custom_text_fields.dart';

class DatePart extends StatelessWidget {
  final TextEditingController controller;
  const DatePart({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void openDatePicker(
        BuildContext context, TextEditingController controller) async {
      DateTime? time = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2500),
      );
      if (time != null) {
        controller.text = "${time.day.toString().padLeft(2, "0")}"
            "/${time.month.toString().padLeft(2, "0")}/${time.year}";
      }
    }

    return GestureDetector(
      onTap: () {
        openDatePicker(context, controller);
      },
      child: CustomTextField(
        controller: controller,
        enabled: false,
        hintText: controller.text,
        suffix: const Icon(
          Icons.calendar_month,
          color: AppColors.mainColor,
          size: 25,
        ),
      ),
    );
  }
}
