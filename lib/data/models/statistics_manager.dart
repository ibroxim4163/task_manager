import 'package:equatable/equatable.dart';

import 'statistics_model.dart';

class StatisticsManager extends Equatable {
  final List<StatisticsModel> statistics;
  final int selectedYear;
  final int yearTasks;
  final int completedYearTasks;

  const StatisticsManager({
    required this.statistics,
    required this.selectedYear,
    required this.yearTasks,
    required this.completedYearTasks,
  });

  StatisticsManager copyWith({
    List<StatisticsModel>? statistics,
    int? selectedYear,
    int? yearTasks,
    int? completedYearTasks,
  }) {
    return StatisticsManager(
      statistics: statistics ?? this.statistics,
      selectedYear: selectedYear ?? this.selectedYear,
      yearTasks: yearTasks ?? this.yearTasks,
      completedYearTasks: completedYearTasks ?? this.completedYearTasks,
    );
  }

  @override
  List<Object?> get props =>
      [statistics, selectedYear, yearTasks, completedYearTasks];
}
