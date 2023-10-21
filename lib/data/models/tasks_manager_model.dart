import 'package:equatable/equatable.dart';

import 'task_model.dart';

class TasksManager extends Equatable {
  final List<TaskModel> allTasks;
  final List<TaskModel> todaysTasks;
  final List<TaskModel> completedTasks;
  final List<TaskModel> inProgressTasks;
  final List<TaskModel> uncompletedTodaysTaks;
  final List<TaskModel> selectedDayTasks;
  final DateTime selectedDate;
  final int completedTasksQuantity;

  const TasksManager({
    required this.allTasks,
    required this.todaysTasks,
    required this.completedTasks,
    required this.inProgressTasks,
    required this.uncompletedTodaysTaks,
    required this.selectedDayTasks,
    required this.selectedDate,
    required this.completedTasksQuantity,
  });

  @override
  List<Object> get props {
    return [
      allTasks,
      todaysTasks,
      completedTasks,
      inProgressTasks,
      uncompletedTodaysTaks,
      selectedDayTasks,
      selectedDate,
      completedTasksQuantity,
    ];
  }

  @override
  bool get stringify => true;

  TasksManager copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? todaysTasks,
    List<TaskModel>? completedTasks,
    List<TaskModel>? inProgressTasks,
    List<TaskModel>? uncompletedTodaysTaks,
    List<TaskModel>? selectedDayTasks,
    DateTime? selectedDate,
    int? completedTasksQuantity,
  }) {
    return TasksManager(
      allTasks: allTasks ?? this.allTasks,
      todaysTasks: todaysTasks ?? this.todaysTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      inProgressTasks: inProgressTasks ?? this.inProgressTasks,
      uncompletedTodaysTaks:
          uncompletedTodaysTaks ?? this.uncompletedTodaysTaks,
      selectedDayTasks: selectedDayTasks ?? this.selectedDayTasks,
      selectedDate: selectedDate ?? this.selectedDate,
      completedTasksQuantity:
          completedTasksQuantity ?? this.completedTasksQuantity,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'allTasks': allTasks.map((x) => x.toJson()).toList(),
      'todaysTasks': todaysTasks.map((x) => x.toJson()).toList(),
      'completedTasks': completedTasks.map((x) => x.toJson()).toList(),
      'inProgressTasks': inProgressTasks.map((x) => x.toJson()).toList(),
      'uncompletedTodaysTaks':
          uncompletedTodaysTaks.map((x) => x.toJson()).toList(),
      'selectedDayTasks': selectedDayTasks.map((x) => x.toJson()).toList(),
      'selectedDate': selectedDate.toIso8601String(),
      'completedTasksQuantity': completedTasksQuantity,
    };
  }

  factory TasksManager.fromMap(Map<String, dynamic> map) {
    return TasksManager(
      allTasks: List<TaskModel>.from(
        (map['allTasks'] as List<TaskModel>).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      todaysTasks: List<TaskModel>.from(
        (map['todaysTasks'] as List<TaskModel>).map<TaskModel?>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      completedTasks: List<TaskModel>.from(
        (map['completedTasks'] as List<TaskModel>).map<TaskModel?>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      inProgressTasks: List<TaskModel>.from(
        (map['inProgressTasks'] as List<TaskModel>).map<TaskModel?>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      uncompletedTodaysTaks: List<TaskModel>.from(
        (map['uncompletedTodaysTaks'] as List<TaskModel>).map<TaskModel?>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      selectedDayTasks: List<TaskModel>.from(
        (map['selectedDayTasks'] as List<TaskModel>).map<TaskModel?>(
          (x) => TaskModel.fromMap(x as Map<String, Object?>),
        ),
      ),
      selectedDate:
          DateTime.tryParse(map['selectedDate'] as String) ?? DateTime.now(),
      completedTasksQuantity: map['completedTasksQuantity'] as int,
    );
  }
}
