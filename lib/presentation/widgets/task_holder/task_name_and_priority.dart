import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/data/constants/extensions.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/local_shared_preferences_storage.dart';
import '../../../logic/language_and_password_bloc/language_and_password_bloc.dart';

class TaskNameAndPriority extends StatelessWidget {
  final TaskModel task;
  const TaskNameAndPriority({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String priority = task.correctPriority(context);
    return BlocProvider(
      create: (context) => LanguageAndPasswordBloc(
        LocalSharedPreferencesStorage(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: task.priority == null
                ? MediaQuery.sizeOf(context).width * .85
                : MediaQuery.sizeOf(context).width * .65,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                task.taskName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.clip,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          task.priority == null
              ? const SizedBox()
              : SizedBox(
                  height: 27,
                  width: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: findColor(priority, context),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        priority,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

Color findColor(String priority, BuildContext context) {
  final localization = AppLocalizations.of(context);
  Color result = AppColors.transparent;
  if (priority == localization.high) {
    result = AppColors.highPriorityColor;
  } else if (priority == localization.medium) {
    result = AppColors.mediumPriorityColor;
  } else if (priority == localization.low) {
    result = AppColors.lowPriorityColor;
  }
  return result;
}

// String correctPriority(BuildContext context, TaskModel task) {
//   final ru = AppLocalizationsRu();
//   final uz = AppLocalizationsUz();
//   final en = AppLocalizationsEn();
//   int languageIndex =
//       context.watch<LanguageAndPasswordBloc>().state.languageIndex;

//   String priority = "";

//   if (task.priority == en.low && languageIndex == 1) {
//     priority = ru.low;
//   } else if (task.priority == en.medium && languageIndex == 1) {
//     priority = ru.medium;
//   } else if (task.priority == en.high && languageIndex == 1) {
//     priority = ru.high;
//   } else if (task.priority == en.low && languageIndex == 2) {
//     priority = uz.low;
//   } else if (task.priority == en.medium && languageIndex == 2) {
//     priority = uz.medium;
//   } else if (task.priority == en.high && languageIndex == 2) {
//     priority = uz.high;
//   }else if (task.priority == en.low && languageIndex == 0) {
//     priority = en.low;
//   } else if (task.priority == en.medium && languageIndex == 0) {
//     priority = en.medium;
//   } else if (task.priority == en.high && languageIndex == 0) {
//     priority = en.high;
//   }

//   //
//   else if (task.priority == ru.low && languageIndex == 0) {
//     priority = en.low;
//   } else if (task.priority == ru.medium && languageIndex == 0) {
//     priority = en.medium;
//   } else if (task.priority == ru.high && languageIndex == 0) {
//     priority = en.high;
//   } else if (task.priority == ru.low && languageIndex == 2) {
//     priority = uz.low;
//   } else if (task.priority == ru.medium && languageIndex == 2) {
//     priority = uz.medium;
//   } else if (task.priority == ru.high && languageIndex == 2) {
//     priority = uz.high;
//   }else if (task.priority == ru.low && languageIndex == 1) {
//     priority = ru.low;
//   } else if (task.priority == ru.medium && languageIndex == 1) {
//     priority = ru.medium;
//   } else if (task.priority == ru.high && languageIndex == 1) {
//     priority = ru.high;
//   }

//   //
//   else if (task.priority == uz.low && languageIndex == 1) {
//     priority = ru.low;
//   } else if (task.priority == uz.medium && languageIndex == 1) {
//     priority = ru.medium;
//   } else if (task.priority == uz.high && languageIndex == 1) {
//     priority = ru.high;
//   } else if (task.priority == uz.low && languageIndex == 0) {
//     priority = en.low;
//   } else if (task.priority == uz.medium && languageIndex == 0) {
//     priority = en.medium;
//   } else if (task.priority == uz.high && languageIndex == 0) {
//     priority = en.high;
//   }else if (task.priority == uz.low && languageIndex == 2) {
//     priority = uz.low;
//   } else if (task.priority == uz.medium && languageIndex == 2) {
//     priority = uz.medium;
//   } else if (task.priority == uz.high && languageIndex == 2) {
//     priority = uz.high;
//   }
//   print("priority=$priority");
//   return priority;
// }
