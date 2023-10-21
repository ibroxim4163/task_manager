part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  final TasksManager tasksManager;
  const TaskState({
    required this.tasksManager,
  });

  @override
  List<Object?> get props => [tasksManager];
}

class LoadingState extends TaskState {
  const LoadingState({required super.tasksManager});

  @override
  List<Object?> get props => [tasksManager];
}

 class LoadedState extends TaskState {
  const LoadedState({required super.tasksManager});

  @override
  List<Object?> get props => [tasksManager];
}


class ErrorState extends TaskState {
  final String message;
  const ErrorState({
    required super.tasksManager,
    required this.message,
  });
}
