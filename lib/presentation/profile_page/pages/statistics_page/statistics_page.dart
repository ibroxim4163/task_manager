import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../data/constants/extensions.dart';
import '../../../../data/l10n/app_localizations.dart';
import '../../../../data/models/statistics_model.dart';
import '../../../../logic/statistics_bloc/statistics_bloc.dart';
import '../../widgets/custom_app_bar.dart';
import 'statistics_part.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late final AppLocalizations localization;

  @override
  void didChangeDependencies() {
    localization = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettingsAppBar(
              text: localization.statistics,
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 15),
                      const StatiscticsPart(),
                      BlocBuilder<StatisticsBloc, StatisticsState>(
                        // buildWhen: (previous, current) {
                        //   return previous.statisticsManager.selectedYear !=
                        //       current.statisticsManager.selectedYear;
                        // },
                        builder: (context, state) {
                          return Wrap(
                            alignment: WrapAlignment.center,
                            spacing: size.width * .2,
                            runSpacing: 30,
                            children: List.generate(
                              12,
                              (index) {
                                return Builder(builder: (context) {
                                  List<StatisticsModel> temp =
                                      state.statisticsManager.statistics;

                                  return temp.isEmpty
                                      ? const SizedBox.square(
                                          dimension: 95,
                                          child:
                                               CircularProgressIndicator(
                                            backgroundColor:
                                                AppColors.greyColor,
                                            color: AppColors.redColor,
                                            value: 0,
                                          ),
                                        )
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(index.getMonthNames(
                                                index, context)),
                                            const SizedBox(height: 15),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox.square(
                                                  dimension: 95,
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: temp[index]
                                                        .progressValue,
                                                    color: AppColors.mainColor,
                                                    strokeWidth: 10,
                                                    backgroundColor:
                                                        AppColors.greyColor,
                                                  ),
                                                ),
                                                Text(
                                                  "${temp[index].percent.toString()}%",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                });
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
