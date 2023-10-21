import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../widgets/custom_text_fields.dart';

class PriorityPart extends StatelessWidget {
  final TextEditingController controller;
  const PriorityPart({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    List<String> priorities = [
      localization.none,
      localization.low,
      localization.medium,
      localization.high,
    ];
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
        itemBuilder: (context) {
          return List.generate(
            4,
            (index) => PopupMenuItem(
              value: priorities[index],
              child: Text(priorities[index]),
            ),
          ).toList();
        },
        onSelected: (value) {
          controller.text = value;
        },
      ),
    );
  }
}
