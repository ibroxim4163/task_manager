import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../data/l10n/app_localizations.dart';
import '../../../data/models/task_model.dart';
import '../../../logic/task_bloc/task_bloc.dart';
import '../../add_task_page/add_task.dart';

class NoteAndPopUp extends StatelessWidget {
  final TaskModel task;
  const NoteAndPopUp({
    required this.task,
    super.key,
  });

  void edit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskAddPage(taskmodel: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 150,
            child: Text(
              overflow: TextOverflow.ellipsis,
              task.note,
              style: const TextStyle(
                fontSize: 17,
                color: AppColors.whiteColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.whiteColor,
            ),
            itemBuilder: (context) {
              final List<String> actions = [
                localization.edit,
                localization.deleteTask,
              ];
              final icons = [Icons.edit, Icons.delete];
              return List.generate(
                2,
                (index) => PopupMenuItem(
                  onTap: () {
                    if (index == 1) {
                      context.read<TaskBloc>().add(DeleteTask(id: task.id));
                      context
                          .read<TaskBloc>()
                          .add(const LoadingEvent());
                    } else {
                      edit(context);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icons[index],
                        color: index == 0
                            ? AppColors.blackColor
                            : AppColors.redColor,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        actions[index],
                        style: TextStyle(
                          fontSize: 13,
                          color: index == 0
                              ? AppColors.blackColor
                              : AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
