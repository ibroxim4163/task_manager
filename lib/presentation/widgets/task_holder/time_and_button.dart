import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/extensions.dart';
import '../../../../data/constants/app_colors.dart';
import '../../../../data/models/task_model.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../../logic/task_bloc/task_bloc.dart';

// ignore: must_be_immutable
class TimeAndButton extends StatelessWidget {
  TimeAndButton({
    required TaskModel task,
    super.key,
  }) {
    newTask = task.copyWith();
    if (task.startTime == null) {
      index = 0;
    } else if (task.endTime == null) {
      index = 1;
    } else {
      index = 2;
    }
  }

  late TaskModel newTask;

  int index = 0;

  String buttonText(int index, AppLocalizations localization) {
    return switch (index) {
      0 => localization.start,
      1 => localization.finish,
      2 => localization.completed,
      _ => localization.completed,
    };
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.watch_later,
                color: AppColors.whiteColor,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                changeTimesToString(newTask),
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: const Size(100, 20),
                backgroundColor: index.buttonColor(),
                disabledBackgroundColor: index.buttonColor(),
              ),
              onPressed: index == 2
                  ? null
                  : () {
                      if (index < 3) {
                        index++;
                      }
                      if (index == 1) {
                        newTask = newTask.copyWith(startTime: DateTime.now());
                        context
                            .read<TaskBloc>()
                            .add(UpdateTask(task: newTask, id: newTask.id));
                        context.read<TaskBloc>().add(
                              const LoadingEvent(),
                            );
                      }
                      if (index == 2) {
                        newTask = newTask.copyWith(endTime: DateTime.now());

                        context
                            .read<TaskBloc>()
                            .add(UpdateTask(task: newTask, id: newTask.id));
                        context.read<TaskBloc>().add(
                              const LoadingEvent(),
                            );
                      }
                    },
              child: Text(
                buttonText(index, localization),
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String changeTimesToString(TaskModel task) {
  if (task.startTime != null && task.endTime != null) {
    return "${task.startTime!.hour.toString().padLeft(2, "0")}"
        ":${task.startTime!.minute.toString().padLeft(2, "0")}"
        "-${task.endTime!.hour.toString().padLeft(2, "0")}"
        ":${task.endTime!.minute.toString().padLeft(2, "0")}";
  }
  return "${task.plannedStartTime.hour.toString().padLeft(2, "0")}"
      ":${task.plannedStartTime.minute.toString().padLeft(2, "0")}"
      "-${task.plannedEndTime.hour.toString().padLeft(2, "0")}"
      ":${task.plannedEndTime.minute.toString().padLeft(2, "0")}";
}
