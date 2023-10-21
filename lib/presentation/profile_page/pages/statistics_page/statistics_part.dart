import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../data/l10n/app_localizations.dart';
import '../../../../logic/statistics_bloc/statistics_bloc.dart';

class StatiscticsPart extends StatelessWidget {
  const StatiscticsPart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final localization = AppLocalizations.of(context);
    List<String> texts = [
      localization.totalTasks,
      localization.completedTasks,
    ];
    final tasks = [
      context.watch<StatisticsBloc>().state.statisticsManager.yearTasks,
      context
          .watch<StatisticsBloc>()
          .state
          .statisticsManager
          .completedYearTasks,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context.read<StatisticsBloc>().add(
                      const StatisticsEvent(
                        StatisticEventTypes.decrement,
                      ),
                    );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
                size: 20,
              ),
            ),
            BlocBuilder<StatisticsBloc, StatisticsState>(
              builder: (context, state) {
                return Text(
                  state.statisticsManager.selectedYear.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                context.read<StatisticsBloc>().add(
                      const  StatisticsEvent(
                        StatisticEventTypes.inrement,
                      ),
                    );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blackColor,
                size: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            2,
            (index) => SizedBox(
              width: screenSize.width > 400 ? 150 : 100,
              height: 100,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      texts[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      tasks[index].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            growable: false,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
