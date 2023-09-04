import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tast_manager/data/model/local/task_model.dart';
import 'package:tast_manager/helper/utils.dart';

import '../../../repository/local/local_repository.dart';
import '../../shared/base_controller.dart';

class AddNewTaskController extends BaseController {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  RxBool notificationSetting = false.obs;
  int? dueDateInMilis;
  final bool isEditing;
  TaskModel? task;

  AddNewTaskController({this.isEditing = false});

  @override
  void onInit() {
    super.onInit();
    checkAndSetData();
  }

  checkAndSetData() {
    TaskModel? task = Get.arguments;
    if (task != null) {
      this.task = task;
      taskNameController.text = task.taskName!;
      dueDateInMilis = task.dueDate;
      String date = getDateFromMilis(dueDateInMilis!);
      dueDateController.text = date;
      onChangeNotificationSetting(task.notification ?? false);
    }
  }

  onChangeNotificationSetting(bool value) {
    notificationSetting.value = value;
  }

  openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      dueDateInMilis = pickedDate.millisecondsSinceEpoch;
      String date = getDateFromMilis(dueDateInMilis!);
      dueDateController.text = date;
    }
  }

  Future<void> updateTask() async {
    try {
      TaskModel task = TaskModel(
          taskName: taskNameController.value.text,
          description: '',
          dueDate: dueDateInMilis,
          isCompleted: this.task!.isCompleted,
          notification: notificationSetting.value,
          id: this.task!.id!,
          createDate: this.task!.createDate ?? '${DateTime.now().millisecond}');
      int response = await DBProvider.db.updateTask(task);
      if (response != -1) {
        Get.back(result: true);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addNewTask() async {
    try {
      TaskModel task = TaskModel(
          taskName: taskNameController.value.text,
          description: '',
          dueDate: dueDateInMilis,
          isCompleted: false,
          notification: notificationSetting.value);
      int response = await DBProvider.db.addTask(task);
      if (response != -1) {
        Get.back(result: true);
      }
    } catch (e) {
      print(e);
    }
  }
}
