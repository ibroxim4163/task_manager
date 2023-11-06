import 'package:flutter/material.dart';

import '../../../../data/models/task_model.dart';
import 'note_and_popup.dart';
import 'task_name_and_priority.dart';
import 'time_and_button.dart';

class TaskHolder extends StatefulWidget {
  final TaskModel task;
  const TaskHolder({
    required this.task,
    super.key,
  });

  @override
  State<TaskHolder> createState() => _TaskHolderState();
}

class _TaskHolderState extends State<TaskHolder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 115,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.task.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 7,
              right: 7,
              top: 5,
            ),
            child: Column(
              children: [
                TaskNameAndPriority(task: widget.task),
                const SizedBox(height: 10),
                TimeAndButton(task: widget.task),
                const SizedBox(height: 10),
                NoteAndPopUp(task: widget.task),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
