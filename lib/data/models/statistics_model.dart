class StatisticsModel {
  final int percent;
  final double progressValue;

  const StatisticsModel({
    required this.percent,
    required this.progressValue,
  });

  @override
  String toString() =>
      'StatisticsModel(precent: $percent, progressValue: $progressValue)';
}
