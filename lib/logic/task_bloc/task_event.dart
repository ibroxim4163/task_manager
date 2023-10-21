part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();
}

class CreateTask extends TaskEvent {
  final TaskModel task;
  const CreateTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  final int id;
  const UpdateTask({
    required this.task,
    required this.id,
  });

  @override
  List<Object?> get props => [task, id];
}

class DeleteTask extends TaskEvent {
  final int id;
  const DeleteTask({required this.id});

  @override
  List<Object?> get props => [id];
}

class ChangeDateEvent extends TaskEvent {
  final DateTime selectedDate;
  const ChangeDateEvent(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];
}

class LoadingEvent extends TaskEvent {
  final bool firstLoading;
  const LoadingEvent({
    this.firstLoading = false,
  });

  @override
  List<Object?> get props => [];
}

class ErrorEvent extends TaskEvent {
  final String message;
  const ErrorEvent(this.message);

  @override
  List<Object?> get props => [message];
}
