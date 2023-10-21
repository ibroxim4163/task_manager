import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_icons.dart';
import '../../data/l10n/app_localizations.dart';
import '../../data/repositories/task_repository.dart';
import '../../data/services/local_sqflite_storage.dart';
import '../../logic/statistics_bloc/statistics_bloc.dart';
import 'pages/about_page.dart';
import 'pages/language_page.dart';
import 'pages/security_page/security_page.dart';
import 'pages/statistics_page/statistics_page.dart';
import 'widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void changePage(Widget route, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext newContext) {
    final localization = AppLocalizations.of(newContext);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  localization.profile,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    CustomListTile(
                      onTap: () {
                        changePage(
                          const LanguagePickerPage(),
                          newContext,
                        );
                      },
                      title: localization.language,
                      icon: Icons.language,
                      size: 25,
                    ),
                    CustomListTile(
                      onTap: () {
                        changePage(
                          BlocProvider(
                            create: (context) => StatisticsBloc(
                              const TaskRepository(
                                TaskLocalSqfliteStorage(),
                              ),
                            )..add(
                                const StatisticsEvent(
                                  StatisticEventTypes.loading,
                                ),
                              ),
                            child: const StatisticsPage(),
                          ),
                          newContext,
                        );
                      },
                      title: localization.statistics,
                      iconUrl: AppIcons.chart,
                      size: 25,
                    ),
                    CustomListTile(
                      onTap: () {
                        changePage(
                          const ProfileSecurityPage(),
                          newContext,
                        );
                      },
                      title: localization.security,
                      icon: Icons.lock,
                      size: 25,
                    ),
                    CustomListTile(
                      onTap: () {
                        changePage(
                          const AboutPage(),
                          newContext,
                        );
                      },
                      title: localization.about,
                      icon: CupertinoIcons.info_circle_fill,
                      size: 25,
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

