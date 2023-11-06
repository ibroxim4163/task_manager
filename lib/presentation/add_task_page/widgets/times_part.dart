import 'package:flutter/material.dart';

import '../../../data/constants/extensions.dart';
import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_fields.dart';

class TimesPart extends StatelessWidget {
  final List<TextEditingController> controllers;
  const TimesPart({
    required this.controllers,
    super.key,
  });

  void taskTimePressed(
      {required int index, required BuildContext context}) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: controllers[index].text.changeStringToTimeOfDay(),
    );
    if (selectedTime != null) {
      controllers[index].text = selectedTime.changeTimeToString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    final List<String> texts = [
      localization.startTime,
      localization.endTime,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        2,
        (index) {
          return Column(
            children: [
              CustomText(
                text: texts[index],
                fontSize: 15,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  taskTimePressed(index: index, context: context);
                },
                child: CustomTextField(
                  enabled: false,
                  width: 100,
                  controller: controllers[index],
                  hintText: controllers[index].text,
                  suffix: const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.mainColor,
                    size: 25,
                  ),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
