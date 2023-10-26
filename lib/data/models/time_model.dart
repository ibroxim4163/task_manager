class Time {
  double first;
  double second;
  double difference;
  Time({
    required this.first,
    required this.second,
    required this.difference,
  });

  @override
  String toString() =>
      'Time(first: $first, second: $second, difference: $difference)';
}
