import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../data/constants/app_icons.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../../logic/language_and_password_bloc/language_and_password_bloc.dart';
import '../widgets/custom_app_bar.dart';

class LanguagePickerPage extends StatefulWidget {
  const LanguagePickerPage({super.key});

  @override
  State<LanguagePickerPage> createState() => _LanguagePickerPageState();
}

class _LanguagePickerPageState extends State<LanguagePickerPage> {
  List<String> languageFlags = [
    AppIcons.ukFlag,
    AppIcons.ruFlag,
    AppIcons.uzFlag,
  ];

  @override
  Widget build(BuildContext newContext) {
    final screenSize = MediaQuery.sizeOf(context);
    final localization = AppLocalizations.of(context);
    List<String> languageNames = [
      localization.english,
      localization.russian,
      localization.uzbek,
    ];
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettingsAppBar(text: localization.language),
            Expanded(
              flex: 8,
              child: Builder(builder: (context) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * .1),
                      BlocBuilder<LanguageAndPasswordBloc,
                          LanguageAndPasswordState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: state.languageIndex == index
                                        ? Colors.lightBlue
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      languageNames[index],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    trailing: Image(
                                      image: AssetImage(languageFlags[index]),
                                      height: 40,
                                      width: 40,
                                    ),
                                    onTap: state.languageIndex == index
                                        ? null
                                        : () {
                                            context
                                                .read<LanguageAndPasswordBloc>()
                                                .add(
                                                  ChangeLanguage(index),
                                                );
                                            context
                                                .read<LanguageAndPasswordBloc>()
                                                .add(
                                                  LPLoadingEvent(),
                                                );
                                          },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
