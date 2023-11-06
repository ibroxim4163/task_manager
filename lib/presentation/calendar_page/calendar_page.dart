import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/models/task_model.dart';
import '../../../data/models/time_model.dart';
import '../../logic/task_bloc/task_bloc.dart';
import '../widgets/custom_horizontal_calendar.dart';
import 'widgets/custom_painter.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: CustomHorizontalCalendar(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              height: 2880,
              child: CustomPaint(
                painter: CustomCalendarPainter(),
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Stack(
                        children: state.tasksManager.selectedDayTasks.map(
                      (task) {
                        Time time = changeTimes(task);
                        return Padding(
                          padding: EdgeInsets.only(
                            top: time.first * 2,
                            left: 60,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: task.color,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: SizedBox(
                                height: time.difference * 2,
                                width: MediaQuery.sizeOf(context).width - 80,
                                child: Center(
                                  child: Align(
                                    alignment: const Alignment(-.8, 0),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Text(
                                        task.taskName,
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Time changeTimes(TaskModel task) {
  double first = 0;
  double second = 0;
  double difference = 0;
  if (task.startTime != null && task.endTime != null) {
    first = ((task.startTime!.hour * 60 + task.startTime!.minute)).toDouble();
    second = (task.endTime!.hour * 60 + task.endTime!.minute).toDouble();
    difference = (second - (first)).abs();
  } else {
    TaskModel newTask = task.copyWith();
    if (task.plannedStartTime.isAfter(task.plannedEndTime)) {
      newTask = newTask.copyWith(
        plannedStartTime: newTask.plannedEndTime,
        plannedEndTime: newTask.plannedStartTime,
      );
    }
    first =
        ((newTask.plannedStartTime.hour * 60 + newTask.plannedStartTime.minute))
            .toDouble();
    second = (newTask.plannedEndTime.hour * 60 + newTask.plannedEndTime.minute)
        .toDouble();
    difference = (second - (first)).abs();
  }
  final Time time = Time(
    first: first,
    second: second,
    difference: difference,
  );
  return time;
}
