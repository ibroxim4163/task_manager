import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task_model.dart';
import '../../data/models/tasks_manager_model.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;
  TaskBloc(this.repository)
      : super(
          LoadingState(
            tasksManager: TasksManager(
              allTasks: const [],
              todaysTasks: const [],
              completedTasks: const [],
              inProgressTasks: const [],
              uncompletedTodaysTaks: const [],
              selectedDate: DateTime.now(),
              completedTasksQuantity: 0,
              selectedDayTasks: const [],
            ),
          ),
        ) {
    on<TaskEvent>(
      (event, emit) => switch (event) {
        LoadingEvent e => _loading(e, emit),
        ErrorEvent _ => () {},
        CreateTask e => _create(e, emit),
        UpdateTask e => _update(e, emit),
        DeleteTask e => _delete(e, emit),
        ChangeDateEvent e => _changeDate(e, emit),
      },
    );
  }

  void _loading(LoadingEvent event, Emitter<TaskState> emit) async {
    if (event.firstLoading || state.tasksManager.todaysTasks.isEmpty) {
      emit(
        LoadingState(
          tasksManager: state.tasksManager,
        ),
      );
    }
    try {
      List<TaskModel> allTasks = await repository.getAllTasks();

      List<TaskModel> filteredTask = await repository.getFilteredTasks(
        state.tasksManager.selectedDate,
      );
      List<TaskModel> todaysTasks = await repository.getFilteredTasks(
        DateTime.now(),
      );
      debugPrint(todaysTasks.toString());
      List<TaskModel> completedTasks = await repository.getCompletedTasks();
      List<TaskModel> inProgressTasks = await repository.getInProgressTasks();
      List<TaskModel> uncompletedTodaysTaks =
          await repository.getUnCompletedTasks();
      int completedTasksQuantity = await repository.getAllCompletedTasks();

      emit(
        LoadedState(
          tasksManager: TasksManager(
            allTasks: allTasks,
            todaysTasks: todaysTasks,
            completedTasks: completedTasks,
            inProgressTasks: inProgressTasks,
            uncompletedTodaysTaks: uncompletedTodaysTaks,
            selectedDate: state.tasksManager.selectedDate,
            completedTasksQuantity: completedTasksQuantity,
            selectedDayTasks: filteredTask,
          ),
        ),
      );
    } catch (e, s) {
      debugPrint("$e,$s");
      emit(
        ErrorState(tasksManager: state.tasksManager, message: "$e"),
      );
    }
  }

  Future<void> _create(CreateTask event, Emitter<TaskState> emit) async {
    try {
      await repository.createTask(event.task);
    } catch (e) {
      emit(ErrorState(
        tasksManager: state.tasksManager,
        message: "$e",
      ));
    }
  }

  void _update(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await repository.updateTask( task: event.task);
    } catch (e) {
      emit(ErrorState(tasksManager: state.tasksManager, message: "$e"));
    }
  }

  void _delete(DeleteTask e, Emitter<TaskState> emit) async {
    try {
      await repository.deleteTask(e.id);
    } catch (e) {
      emit(ErrorState(tasksManager: state.tasksManager, message: "$e"));
    }
  }

  void _changeDate(ChangeDateEvent e, Emitter<TaskState> emit) async {
    final List<TaskModel> filteredTasks =
        await repository.getFilteredTasks(e.selectedDate);
    emit(
      LoadingState(
        tasksManager: state.tasksManager.copyWith(
          selectedDate: e.selectedDate,
          selectedDayTasks: filteredTasks,
        ),
      ),
    );
  }
}
