import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/models/statistics_manager.dart';
import 'package:task_manager/data/repositories/task_repository.dart';

import '../../data/models/statistics_model.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final TaskRepository repository;
  StatisticsBloc(this.repository)
      : super(
          StatisticsLoadingState(
            statisticsManager: StatisticsManager(
              statistics: const [],
              selectedYear: DateTime.now().year,
              yearTasks: 0,
              completedYearTasks: 0,
            ),
          ),
        ) {
    on<StatisticsEvent>(
      (event, emit) {
        return _statisticsEvent(event, emit);
      },
    );
  }

  void _statisticsEvent(
      StatisticsEvent e, Emitter<StatisticsState> emit) async {
    try {
      int year = state.statisticsManager.selectedYear;
      if (e.types == StatisticEventTypes.decrement) {
        year -= 1;
      } else if (e.types == StatisticEventTypes.inrement) {
        year += 1;
      }

      final int completedYearTasks =
          await repository.getCompletedTasksInSelectedYear(year);
      final yearTasks = await repository.getSelectedYearTasksLength(year);
      List<StatisticsModel> statistics = [
        for (int i = 0; i < 12; i++) await repository.getStatistics(i + 1, year)
      ];

      emit(
        StatisticsLoadingState(
          statisticsManager: StatisticsManager(
            statistics: statistics,
            selectedYear: year,
            completedYearTasks: completedYearTasks,
            yearTasks: yearTasks,
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          message: "Something went wrong",
          statisticsManager: state.statisticsManager.copyWith(),
        ),
      );
    }
  }
}
