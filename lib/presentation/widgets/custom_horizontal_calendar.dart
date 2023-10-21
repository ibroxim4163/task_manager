import 'package:flutter/material.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/constants/extensions.dart';

import '../../../data/constants/app_colors.dart';
import '../../logic/language_and_password_bloc/language_and_password_bloc.dart';
import '../../logic/task_bloc/task_bloc.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  const CustomHorizontalCalendar({super.key});

  @override
  State<CustomHorizontalCalendar> createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  // DateTime selectedDate = DateTime.now();
  late final DatePickerController datePickerController;

  @override
  void initState() {
    datePickerController = DatePickerController();
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        datePickerController.jumpToSelection();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: DatePicker(
              DateTime(2023, 8, 5),
              height: 70,
              width: 55,
              dateTextStyle: const TextStyle(
                fontSize: 13,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
              onDateChange: (newDate) {
                datePickerController.animateToDate(newDate);
                context.read<TaskBloc>().add(ChangeDateEvent(newDate));
                context.read<TaskBloc>().add(const LoadingEvent());
              },
              locale: context
                  .watch<LanguageAndPasswordBloc>()
                  .state
                  .languageIndex
                  .languageIndex()
                  .languageCode,
              selectionColor: Colors.blue,
              initialSelectedDate:
                  context.watch<TaskBloc>().state.tasksManager.selectedDate,
              controller: datePickerController,
            ),
          ),
        );
      },
    );
  }
}
