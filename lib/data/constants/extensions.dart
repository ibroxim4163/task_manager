import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/language_and_password_bloc/language_and_password_bloc.dart';
import '../l10n/app_localizations.dart';
import '../l10n/app_localizations_en.dart';
import '../l10n/app_localizations_ru.dart';
import '../l10n/app_localizations_uz.dart';
import '../models/task_model.dart';
import 'app_colors.dart';

extension StringExtentions on String {
  TimeOfDay changeStringToTimeOfDay() {
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.tryParse(substring(0, 2)) ?? TimeOfDay.now().hour,
      minute: int.tryParse(substring(3)) ?? TimeOfDay.now().minute,
    );
    return timeOfDay;
  }
}

extension DateTimeExtensions on DateTime {
  String dateToString() {
    return "${day.toString().padLeft(2, "0")}"
        "/${month.toString().padLeft(2, "0")}/"
        "$year";
  }

  String changeDateToString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }

  bool isToday() {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  String changeTimeToString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }
}

extension IntExtensions on int {
  Color buttonColor() {
    return switch (this) {
      0 => AppColors.greenColor,
      1 => AppColors.redColor,
      2 => AppColors.lowPriorityColor,
      _ => AppColors.lowPriorityColor
    };
  }

  Locale languageIndex() {
    return switch (this) {
      0 => const Locale("en"),
      1 => const Locale("ru"),
      2 => const Locale("uz"),
      _ => const Locale("en")
    };
  }

  String getMonthNames(int index, BuildContext context) {
    final localization = AppLocalizations.of(context);
    return switch (this) {
      0 => localization.january,
      1 => localization.february,
      2 => localization.march,
      3 => localization.april,
      4 => localization.may,
      5 => localization.june,
      6 => localization.july,
      7 => localization.august,
      8 => localization.september,
      9 => localization.october,
      10 => localization.november,
      11 => localization.december,
      _ => localization.january,
    };
  }
}

extension TaskModelExtensions on TaskModel {
  String correctPriority(BuildContext context) {
    final ru = AppLocalizationsRu();
    final uz = AppLocalizationsUz();
    final en = AppLocalizationsEn();
    int languageIndex =
        context.watch<LanguageAndPasswordBloc>().state.languageIndex;

    String truPriority = "";

    if (priority == en.low && languageIndex == 1) {
      truPriority = ru.low;
    } else if (priority == en.medium && languageIndex == 1) {
      truPriority = ru.medium;
    } else if (priority == en.high && languageIndex == 1) {
      truPriority = ru.high;
    } else if (priority == en.low && languageIndex == 2) {
      truPriority = uz.low;
    } else if (priority == en.medium && languageIndex == 2) {
      truPriority = uz.medium;
    } else if (priority == en.high && languageIndex == 2) {
      truPriority = uz.high;
    } else if (priority == en.low && languageIndex == 0) {
      truPriority = en.low;
    } else if (priority == en.medium && languageIndex == 0) {
      truPriority = en.medium;
    } else if (priority == en.high && languageIndex == 0) {
      truPriority = en.high;
    }

    //
    else if (priority == ru.low && languageIndex == 0) {
      truPriority = en.low;
    } else if (priority == ru.medium && languageIndex == 0) {
      truPriority = en.medium;
    } else if (priority == ru.high && languageIndex == 0) {
      truPriority = en.high;
    } else if (priority == ru.low && languageIndex == 2) {
      truPriority = uz.low;
    } else if (priority == ru.medium && languageIndex == 2) {
      truPriority = uz.medium;
    } else if (priority == ru.high && languageIndex == 2) {
      truPriority = uz.high;
    } else if (priority == ru.low && languageIndex == 1) {
      truPriority = ru.low;
    } else if (priority == ru.medium && languageIndex == 1) {
      truPriority = ru.medium;
    } else if (priority == ru.high && languageIndex == 1) {
      truPriority = ru.high;
    }

    //
    else if (priority == uz.low && languageIndex == 1) {
      truPriority = ru.low;
    } else if (priority == uz.medium && languageIndex == 1) {
      truPriority = ru.medium;
    } else if (priority == uz.high && languageIndex == 1) {
      truPriority = ru.high;
    } else if (priority == uz.low && languageIndex == 0) {
      truPriority = en.low;
    } else if (priority == uz.medium && languageIndex == 0) {
      truPriority = en.medium;
    } else if (priority == uz.high && languageIndex == 0) {
      truPriority = en.high;
    } else if (priority == uz.low && languageIndex == 2) {
      truPriority = uz.low;
    } else if (priority == uz.medium && languageIndex == 2) {
      truPriority = uz.medium;
    } else if (priority == uz.high && languageIndex == 2) {
      truPriority = uz.high;
    }
    return truPriority;
  }
}
