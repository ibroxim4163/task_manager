import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/presentation/home_page/widgets/home_shimmer.dart';

import '../../data/l10n/app_localizations.dart';
import '../../data/models/task_model.dart';
import '../../logic/task_bloc/task_bloc.dart';
import '../add_task_page/add_task.dart';
import '../widgets/no_tasks.dart';
import '../widgets/task_holder/task_holder.dart';
import 'widgets/sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLocalizations localization;
  final selectedSection = ValueNotifier<int>(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localization = AppLocalizations.of(context);
  }

  late List<String> sectionTexts = [
    localization.noTasks,
    localization.noTasks,
    localization.noCompletedTask,
    localization.noInProgressTask,
  ];

  void openTaskAddPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const TaskAddPage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset(0, 0);

          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.linear),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 125),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  localization.todayTasks,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: HomeSections(
                selectedSection: selectedSection,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        // buildWhen: (previous, current) =>
        //     previous.tasksManager.todaysTasks.length !=
        //     current.tasksManager.todaysTasks.length ,
        builder: (context, state) {
          if (state is LoadingState) {
            return const HomeShimmer();
          }
          if (state is LoadedState) {
            return ValueListenableBuilder(
              valueListenable: selectedSection,
              builder: (context, value, _) {
                List<TaskModel> tasks = switch (value) {
                  0 => state.tasksManager.todaysTasks,
                  1 => state.tasksManager.uncompletedTodaysTaks,
                  2 => state.tasksManager.completedTasks,
                  3 => state.tasksManager.inProgressTasks,
                  _ => state.tasksManager.todaysTasks,
                };

                return tasks.isEmpty
                    ? NoTasks(text: sectionTexts[value])
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return TaskHolder(task: task);
                        },
                        separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 12),
                        ),
                        itemCount: tasks.length,
                      );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}