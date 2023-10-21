part of 'statistics_bloc.dart';

sealed class StatisticsState extends Equatable {
  final StatisticsManager statisticsManager;
  const StatisticsState({
    required this.statisticsManager,
  });

  @override
  List<Object> get props => [statisticsManager];
}

final class StatisticsLoadingState extends StatisticsState {
  const StatisticsLoadingState({
    required super.statisticsManager,
  });
}

final class ErrorState extends StatisticsState {
  final String message;
  const ErrorState({
    required super.statisticsManager,
    required this.message,
  });
}
