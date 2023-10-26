import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/extensions.dart';
import '../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/notification_service.dart';
import '../../../logic/task_bloc/task_bloc.dart';
import '../add_task.dart';

mixin TaskAddPageMixin on State<TaskAddPage> {
  late final TextEditingController taskController;
  late final TextEditingController noteController;
  late final TextEditingController dateController;
  late final TextEditingController colorController;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;
  late final TextEditingController remindController;
  late final TextEditingController priorityController;

  @override
  void initState() {
    taskController = TextEditingController();
    noteController = TextEditingController();
    dateController = TextEditingController();
    colorController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    remindController = TextEditingController();
    priorityController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    taskController.text = widget.taskmodel?.taskName ?? "";
    noteController.text = widget.taskmodel?.note ?? "";

    final selectedDate =
        context.watch<TaskBloc>().state.tasksManager.selectedDate;
    dateController.text = dateToString(widget.taskmodel?.date ?? selectedDate);
    priorityController.text =
        widget.taskmodel?.priority ?? AppLocalizations.of(context).none;
    remindController.text =
        "${widget.taskmodel?.remind ?? 5} ${AppLocalizations.of(context).minutes}";
    startTimeController.text = widget.taskmodel?.endTime != null
        ? (widget.taskmodel?.startTime?.changeDateToString() ??
            DateTime.now().changeDateToString())
        : (widget.taskmodel?.plannedStartTime.changeDateToString() ??
            DateTime.now().changeDateToString());
    endTimeController.text = widget.taskmodel?.endTime != null
        ? (widget.taskmodel?.endTime?.changeDateToString() ??
            DateTime.now().changeDateToString())
        : (widget.taskmodel?.plannedEndTime.changeDateToString() ??
            DateTime.now().changeDateToString());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    taskController.dispose();
    noteController.dispose();
    dateController.dispose();
    colorController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    priorityController.dispose();
    remindController.dispose();
    super.dispose();
  }

  void saveOrUpdateTask() {
    DateTime selectedDate =
        DateTime.tryParse(dateController.text.split("/").reversed.join("-")) ??
            DateTime.now();
    DateTime startTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        int.parse(startTimeController.text.substring(0, 2)),
        int.parse(startTimeController.text.substring(3)));
    DateTime endTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        int.parse(endTimeController.text.substring(0, 2)),
        int.parse(endTimeController.text.substring(3)));

    final localization = AppLocalizations.of(context);
    int remind =
        int.tryParse(remindController.text.substring(0, 2).trim()) ?? 5;
    if (startTime.isAfter(endTime)) {
      DateTime temp = endTime;
      endTime = startTime;
      startTime = temp;
    }
    final TaskModel task = TaskModel(
      id: 1,
      taskName: taskController.text.isEmpty
          ? "(${localization.noName})"
          : taskController.text,
      note: noteController.text,
      date: selectedDate,
      remind: remind,
      color: Color(
        int.tryParse(colorController.text) ?? AppColors.taskColors.first.value,
      ),
      plannedStartTime: startTime,
      plannedEndTime: endTime,
      priority: priorityController.text == localization.none
          ? null
          : priorityController.text,
      startTime: widget.taskmodel?.startTime,
      endTime: widget.taskmodel?.endTime,
    );
    if (widget.taskmodel == null) {
      context.read<TaskBloc>().add(CreateTask(task: task));
    } else {
      context
          .read<TaskBloc>()
          .add(UpdateTask(task: task, id: widget.taskmodel!.id));
    }

    context.read<TaskBloc>().add(const LoadingEvent());

    if (DateTime.now().isBefore(
      task.plannedStartTime.add(
        Duration(
          minutes: -task.remind - 2,
        ),
      ),
    )) {
      setNotification(task);
    }

    Navigator.pop(context);
  }

  String dateToString(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, "0")}"
        "/${dateTime.month.toString().padLeft(2, "0")}/"
        "${dateTime.year}";
  }

  void setNotification(TaskModel task) async {
    final permission = await NotificationService.getPermission();
    if (permission != null && permission) {
      await NotificationService.sendNotificationSchedule(
        title: task.taskName,
        description: task.note,
        dateTime: task.plannedStartTime.add(Duration(minutes: -task.remind)),
      );
    }
  }
}
