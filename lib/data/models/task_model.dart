import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskModel extends Equatable {
  final int id;
  final String taskName;
  final String note;
  final DateTime date;
  final int remind;
  final Color color;
  final String? priority;
  final DateTime plannedStartTime;
  final DateTime plannedEndTime;
  final DateTime? startTime;
  final DateTime? endTime;

  const TaskModel({
    required this.id,
    required this.taskName,
    required this.note,
    required this.date,
    required this.remind,
    required this.color,
    this.priority,
    required this.plannedStartTime,
    required this.plannedEndTime,
    this.startTime,
    this.endTime,
  });

  TaskModel copyWith({
    String? taskName,
    String? note,
    DateTime? date,
    int? remind,
    Color? color,
    String? priority,
    DateTime? plannedStartTime,
    DateTime? plannedEndTime,
    DateTime? startTime,
    DateTime? endTime,
    int? id,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      note: note ?? this.note,
      date: date ?? this.date,
      remind: remind ?? this.remind,
      color: color ?? this.color,
      priority: priority ?? this.priority,
      plannedStartTime: plannedStartTime ?? this.plannedStartTime,
      plannedEndTime: plannedEndTime ?? this.plannedEndTime,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      "id": id,
      'taskName': taskName,
      'note': note,
      'date': date.toIso8601String(),
      'remind': remind,
      'color': color.value,
      'priority': priority,
      'plannedStartTime': plannedStartTime.toIso8601String(),
      'plannedEndTime': plannedEndTime.toIso8601String(),
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, Object?> json) => TaskModel(
        id: json["id"] as int,
        taskName: json["taskName"] as String,
        note: json["note"] as String,
        date: DateTime.tryParse(json["date"] as String) ?? DateTime.now(),
        remind: json["remind"] as int,
        color: Color(json["color"] as int),
        priority: json["priority"] != null ? json["priority"] as String : null,
        plannedStartTime:
            DateTime.tryParse(json["plannedStartTime"] as String) ??
                DateTime.now(),
        plannedEndTime: DateTime.tryParse(json["plannedEndTime"] as String) ??
            DateTime.now(),
        startTime: json["startTime"] != null
            ? DateTime.tryParse(json["startTime"] as String)
            : null,
        endTime: json["endTime"] != null
            ? DateTime.tryParse(json["endTime"] as String)
            : null,
      );

  @override
  String toString() {
    return 'TodoModel(taskName: $taskName, note: $note, date: $date, remind: $remind, color: $color, priority: $priority, plannedStartTime: $plannedStartTime, plannedEndTime: $plannedEndTime, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.taskName == taskName &&
        other.note == note &&
        other.date == date &&
        other.remind == remind &&
        other.color == color &&
        other.priority == priority &&
        other.plannedStartTime == plannedStartTime &&
        other.plannedEndTime == plannedEndTime &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => Object.hashAll([
        taskName,
        note,
        date,
        remind,
        color,
        priority,
        plannedStartTime,
        plannedEndTime,
        startTime,
        endTime,
      ]);

  @override
  List<Object?> get props => [
        id,
        taskName,
        note,
        date,
        remind,
        color,
        priority,
        plannedStartTime,
        plannedEndTime,
        startTime,
        endTime,
      ];
}
