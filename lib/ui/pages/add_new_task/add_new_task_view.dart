import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tast_manager/constant/app_strings.dart';
import 'package:tast_manager/ui/pages/add_new_task/add_new_task_controller.dart';
import 'package:tast_manager/ui/shared/dimens.dart';
import 'package:tast_manager/ui/shared/text_styles.dart';
import 'package:tast_manager/ui/shared/ui_helper.dart';

import '../../shared/app_colors.dart';
import '../../widget/buttons/app_button.dart';
import '../../widget/text_field/login_field_widget.dart';

class AddNewTaskView extends StatelessWidget {
  const AddNewTaskView({super.key, this.isEditing = false});

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTaskController>(
        init: AddNewTaskController(isEditing: isEditing),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kcWhiteColor,
            appBar: AppBar(
              backgroundColor: kcAppbarColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kcWhiteColor,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                isEditing ? 'Update Task' : 'Add New Task',
                style: textStylePoppins(
                  color: kcWhiteColor,
                  fontSize: font_20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  LoginFieldWidget(
                    hint: "Enter Task",
                    controller: controller.taskNameController,
                    textAlign: TextAlign.start,
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    obscureText: false,
                    prefixIcon: Icons.task,

                  ),
                  verticalSpaceMediumSmall,
                  LoginFieldWidget(
                    hint: dueDate,
                    controller: controller.dueDateController,
                    textAlign: TextAlign.start,
                    inputType: TextInputType.text,
                    prefixIcon: Icons.calendar_month,
                    suffixIcon: Icons.keyboard_arrow_right,
                    readOnly: true,
                    onPressed: () {
                      controller.openDatePicker();
                    },
                  ),
                  verticalSpaceMediumSmall,
                  Obx(() => Row(
                        children: [
                          Checkbox(
                              value: controller.notificationSetting.value,
                              onChanged: (value) {
                                controller.notificationSetting(value);
                              }),
                          const Text('Turn on Notification?')
                        ],
                      )),
                  verticalSpaceMediumSmall,
                  BusyButton(
                    height: 60,
                    title: isEditing ? 'Update Task' : 'Create Task',
                    onPressed: () {
                      isEditing ? controller.updateTask() : controller.addNewTask();
                    },
                    busy: controller.isBusy,
                    width: Get.width,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
