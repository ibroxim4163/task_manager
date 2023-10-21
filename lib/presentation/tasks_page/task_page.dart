import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/l10n/app_localizations.dart';
import '../../logic/task_bloc/task_bloc.dart';
import '../widgets/custom_horizontal_calendar.dart';
import '../widgets/no_tasks.dart';
import '../widgets/task_holder/task_holder.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 80),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 80),
              child: const CustomHorizontalCalendar(),
            ),
          ),
          body: SafeArea(
            child: state.tasksManager.selectedDayTasks.isEmpty
                ? NoTasks(
                    text: AppLocalizations.of(context).noTasks,
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final task = state.tasksManager.selectedDayTasks[index];
                      return TaskHolder(task: task);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.tasksManager.selectedDayTasks.length,
                  ),
          ),
        );
      },
    );
  }
}
