import 'package:flutter/material.dart';
import 'package:tast_manager/data/model/local/task_model.dart';
import 'package:tast_manager/helper/utils.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';
import 'package:tast_manager/ui/shared/dimens.dart';
import 'package:tast_manager/ui/shared/ui_helper.dart';

import '../../../../constant/app_strings.dart';
import '../../../shared/text_styles.dart';

class ViewTaskDialog extends StatelessWidget {
  const ViewTaskDialog(
      {super.key,
      required this.task,
      required this.onTapClose,
      required this.onTapEditTask,
      required this.onMarkCompleted});

  final TaskModel task;
  final Function onTapClose;
  final Function onTapEditTask;
  final Function(bool) onMarkCompleted;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 10.0,
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.taskName!,
                      style: textStylePoppins(fontWeight: FontWeight.w600, fontSize: font_24),
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        Text(
                          '$dueDate: ',
                          style: textStylePoppins(fontWeight: FontWeight.w600, fontSize: font_14),
                        ),
                        Text(
                          getDateFromMilis(task.dueDate!),
                          style: textStylePoppins(fontWeight: FontWeight.w500, fontSize: font_16),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        Text(
                          'Send Notification: ',
                          style: textStylePoppins(fontWeight: FontWeight.w600, fontSize: font_14),
                        ),
                        Text(
                          'No',
                          style: textStylePoppins(fontWeight: FontWeight.w500, fontSize: font_16),
                        ),
                      ],
                    ),
                  ],
                )),
                task.isCompleted == true
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => onTapClose(),
                    child: Text(
                      'Close',
                      style: textStylePoppins(
                        color: kcAccentColor,
                        fontSize: font_16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                TextButton(
                  onPressed: () => onTapEditTask(),
                  child: Text(
                    'Edit Task',
                    style: textStylePoppins(
                      color: kcAccentColor,
                      fontSize: font_16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
