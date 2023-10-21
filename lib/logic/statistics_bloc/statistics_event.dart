part of 'statistics_bloc.dart';

enum StatisticEventTypes { decrement, inrement, loading }

 class StatisticsEvent extends Equatable {
  final StatisticEventTypes types;
  const StatisticsEvent(this.types);

  @override
  List<Object> get props => [];
}
