import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/models/task_model.dart';
import '../../data/l10n/app_localizations.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_fields.dart';
import 'widgets/add_task_mixin.dart';
import 'widgets/colors_part.dart';
import 'widgets/date_part.dart';
import 'widgets/priority_part.dart';
import 'widgets/remind_part.dart';
import 'widgets/times_part.dart';

class TaskAddPage extends StatefulWidget {
  final TaskModel? taskmodel;
  const TaskAddPage({
    this.taskmodel,
    super.key,
  });

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> with TaskAddPageMixin {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              _Texts(
                text: localization.addTask,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: localization.taskName,
                controller: taskController,
              ),
              const SizedBox(height: 8),
              _Texts(
                text: localization.note,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: localization.taskNote,
                controller: noteController,
              ),
              const SizedBox(height: 8),
              _Texts(
                text: localization.date,
              ),
              const SizedBox(height: 8),
              DatePart(controller: dateController),
              const SizedBox(height: 12),
              TimesPart(
                controllers: [startTimeController, endTimeController],
              ),
              const SizedBox(height: 8),
              _Texts(
                text: localization.remind,
              ),
              const SizedBox(height: 8),
              RemindPart(controller: remindController),
              const SizedBox(height: 8),
              _Texts(
                text: localization.priority,
              ),
              const SizedBox(height: 8),
              PriorityPart(controller: priorityController),
              const SizedBox(height: 8),
              _Texts(
                text: localization.colors,
              ),
              const SizedBox(height: 5),
              ColorsPart(
                controller: colorController,
                task: widget.taskmodel,
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                  text: widget.taskmodel == null
                      ? localization.addTask
                      : localization.update,
                  onPressed: saveOrUpdateTask,
                  width: 140,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  final String text;
  const _Texts({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      padding: 15,
      text: text,
      fontSize: 18,
      textColor: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }
}
