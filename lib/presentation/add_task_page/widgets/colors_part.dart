import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/models/task_model.dart';

class ColorsPart extends StatefulWidget {
  final TextEditingController controller;
  final TaskModel? task;
  const ColorsPart({
    required this.controller,
    this.task,
    super.key,
  });

  @override
  State<ColorsPart> createState() => _ColorsPartState();
}

class _ColorsPartState extends State<ColorsPart> {
  late int selectedColorIndex;

  @override
  void initState() {
    selectedColorIndex = AppColors.taskColors
        .indexOf(widget.task?.color ?? AppColors.taskColors[0]);
    super.initState();
  }

  void changeColor(Color color, int index) {
    widget.controller.text = color.value.toString();
    selectedColorIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        AppColors.taskColors.length,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              changeColor(AppColors.taskColors[index], index);
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.taskColors[index],
              child: Visibility(
                visible: selectedColorIndex == index,
                child: const Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }
}
