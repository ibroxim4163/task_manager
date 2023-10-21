import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../widgets/custom_text_fields.dart';

enum Remind {
  five(5),
  ten(10),
  fifteen(15),
  twenty(20),
  twentyFive(25),
  thirty(30);

  final int minute;
  const Remind(this.minute);
}

class RemindPart extends StatelessWidget {
  final TextEditingController controller;
  const RemindPart({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return CustomTextField(
      readOnly: true,
      controller: controller,
      hintText: controller.text,
      suffix: PopupMenuButton(
        initialValue: controller.text,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.blackColor,
          size: 30,
        ),
        itemBuilder: (context) => List.generate(
          6,
          (index) => PopupMenuItem(
            value: "${Remind.values[index].minute} ${localization.minutes} ",
            child: Text("${Remind.values[index].minute} ${localization.minutes}"
                ),
          ),
        ).toList(),
        onSelected: (value) {
          controller.text = value;
        },
      ),
    );
  }
}
