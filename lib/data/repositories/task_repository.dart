import 'package:flutter/material.dart';

import 'package:task_manager/data/constants/extensions.dart';
import 'package:task_manager/data/models/statistics_model.dart';

import '../models/task_model.dart';
import '../services/local_sqflite_storage.dart';

abstract interface class ITaskRepository {
  Future<bool> createTask(TaskModel task);

  Future<bool> updateTask({required TaskModel task, required int id});

  Future<bool> deleteTask(int id);

  Future<List<TaskModel>> getFilteredTasks(DateTime date);

  Future<List<TaskModel>> getAllTasks();

  Future<List<TaskModel>> getCompletedTasks();

  Future<List<TaskModel>> getInProgressTasks();

  Future<List<TaskModel>> getUnCompletedTasks();

  Future<int> getAllCompletedTasks();

  Future<TaskModel> getOneTask(int id);

  Future<StatisticsModel> getStatistics(int month, int year);

  Future<int> getSelectedYearTasksLength(int year);

  Future<int> getCompletedTasksInSelectedYear(int year);
}

class TaskRepository implements ITaskRepository {
  final TaskLocalSqfliteStorage localStorage;
  const TaskRepository(this.localStorage);

  @override
  Future<bool> createTask(TaskModel task) async {
    try {

      // Map<String, Object?> data = task.toJson()..remove("id");

      await localStorage.insert(task.toJson());
      return true;
    } catch (e, s) {
      debugPrint("$e,$s");
      return false;
    }
  }

  @override
  Future<bool> updateTask({
    required TaskModel task,
    required int id,
  }) async {
    try {
      await localStorage.update(task.toJson(), id);
      print("Went to UPdate");
      return true;
    } catch (e, s) {
      debugPrint("$e,$s");
      return false;
    }
  }

  @override
  Future<bool> deleteTask(int id) async {
    try {
      await localStorage.delete(id);
      return true;
    } catch (e, s) {
      debugPrint("$e,$s");
      return false;
    }
  }

  @override
  Future<List<TaskModel>> getFilteredTasks(DateTime date) async {
    try {
      final todos = await localStorage.readFilteredData(date);
      return todos.map(TaskModel.fromMap).toList();
    } catch (e, s) {
      debugPrint("$e,$s");
      return [];
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      final all = await localStorage.readAll();
      return all.map(TaskModel.fromMap).toList();
    } catch (e, s) {
      debugPrint("$e,$s");
      return [];
    }
  }

  @override
  Future<List<TaskModel>> getCompletedTasks() async {
    List<TaskModel> allTasks = await getAllTasks();

    return allTasks
        .where((element) => element.date.isToday() && element.endTime != null)
        .toList();
  }

  @override
  Future<List<TaskModel>> getInProgressTasks() async {
    List<TaskModel> allTasks = await getAllTasks();

    return allTasks
        .where((element) =>
            element.date.isToday() &&
            element.endTime == null &&
            element.startTime != null)
        .toList();
  }

  @override
  Future<List<TaskModel>> getUnCompletedTasks() async {
    List<TaskModel> allTasks = await getAllTasks();

    return allTasks
        .where((element) =>
            element.date.isToday() &&
            element.endTime == null &&
            element.startTime == null)
        .toList();
  }

  @override
  Future<int> getAllCompletedTasks() async {
    List<TaskModel> allTasks = await getAllTasks();

    return allTasks
        .where(
            (element) => element.endTime != null && element.startTime != null)
        .toList()
        .length;
  }

  @override
  Future<TaskModel> getOneTask(int id) async {
    final task = await localStorage.read(id);
    return TaskModel.fromMap(task);
  }

  @override
  Future<StatisticsModel> getStatistics(int month, int selectedYear) async {
    final List<TaskModel> tasks = await getAllTasks();
    int completedTasks = tasks
        .where(
          (element) =>
              element.startTime != null &&
              element.endTime != null &&
              element.date.year == selectedYear &&
              identical(element.date.month, month),
        )
        .toList()
        .length;
    int allTasks = tasks
        .where(
          (element) =>
              element.date.year == selectedYear &&
              identical(element.date.month, month),
        )
        .toList()
        .length;
    int percent = completedTasks != 0 ? (completedTasks * 100) ~/ allTasks : 0;
    double progressValue = percent != 0 ? percent / 100 : 0;
    return StatisticsModel(
      percent: percent,
      progressValue: progressValue,
    );
  }

  @override
  Future<int> getSelectedYearTasksLength(int year) async {
    final List<TaskModel> tasks = await getAllTasks();
    return tasks
        .where(
          (element) => identical(element.date.year, year),
        )
        .length;
  }

  @override
  Future<int> getCompletedTasksInSelectedYear(int year) async {
    final List<TaskModel> tasks = await getAllTasks();
    return tasks
        .where(
          (element) =>
              identical(element.date.year, year) &&
              element.endTime != null &&
              element.startTime != null,
        )
        .length;
  }
}
