import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tast_manager/constant/app_strings.dart';
import 'package:tast_manager/data/model/local/task_model.dart';
import 'package:tast_manager/helper/utils.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';

import '../../../shared/dimens.dart';
import '../../../shared/text_styles.dart';
import '../../../shared/ui_helper.dart';

class TaskRowWidget extends StatelessWidget {
  TaskRowWidget(
      {super.key, required this.task, required this.onMarkCompleted, required this.onTap, required this.onTapDelete});

  final TaskModel task;
  final Function(bool) onMarkCompleted;
  final Function onTap;
  final Function onTapDelete;

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Slidable(
        key: ValueKey('${task.id}'),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            if (task.isCompleted == false)
              SlidableAction(
                onPressed: (_) => onMarkCompleted(true),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check_circle,
                label: done,
              ),
            SlidableAction(
              onPressed: (_) => onTapDelete(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
              label: delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
          decoration: const BoxDecoration(
              color: kcWhiteColor, border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  onMarkCompleted(!task.isCompleted!);
                },
                child: task.isCompleted == true
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24.0,
                      )
                    : const Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                        size: 24.0,
                      ),
              ),
              horizontalSpace(16.0),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.taskName!,
                    style: textStylePoppins(
                      fontSize: font_24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      Text(
                        '$dueDate: ',
                        style: textStylePoppins(fontWeight: FontWeight.w400, fontSize: font_12),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        getDateFromMilis(task.dueDate!),
                        style: textStylePoppins(
                          fontSize: font_14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              )),
              if (task.notification!)
                const Icon(
                  Icons.notifications_active,
                  color: kcAccentColor,
                  size: 20,
                )
            ],
          ),
        ),
      ),
    );
  }
}
