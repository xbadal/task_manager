import 'package:get/get.dart';
import 'package:tast_manager/data/model/local/task_model.dart';
import 'package:tast_manager/ui/pages/home/widget/filter_dialog_widget.dart';
import 'package:tast_manager/ui/pages/home/widget/view_task_dialog.dart';

import '../../../constant/filter_options.dart';
import '../../../repository/local/local_repository.dart';
import '../../shared/base_controller.dart';
import '../add_new_task/add_new_task_view.dart';

class HomeController extends BaseController {
  List<TaskModel> taskList = [];

  FilterOption filterOption = FilterOption.upcomingTasks;

  @override
  void onInit() {
    fetchTaskList();
    super.onInit();
  }

  void showFilterDialog() async {
    await Get.dialog(FilterDialogWidget(
      selectedFilter: filterOption,
      onTap: (filterOption) {
        Get.back();
        changeFilterOption(filterOption);
      },
    ));
  }

  void showTaskDialog(int index) async {
    await Get.dialog(ViewTaskDialog(
      task: taskList[index],
      onTapClose: () {
        Get.back();
      },
      onTapEditTask: () {
        Get.back();
        navigateToEditTask(index);
      },
      onMarkCompleted: (value) {
        Get.back();
        onMarkCompleted(index, value);
      },
    ));
  }

  void changeFilterOption(FilterOption filterOption) {
    this.filterOption = filterOption;
    fetchTaskList();
  }

  void navigateToAddNewTask() async {
    bool? result = await Get.to(AddNewTaskView());
    if (result != null && result == true) {
      fetchTaskList();
    }
  }

  void navigateToEditTask(int index) async {
    TaskModel taskModel = taskList[index];
    bool? result = await Get.to(
        AddNewTaskView(
          isEditing: true,
        ),
        arguments: taskModel);
    if (result == true) {
      fetchTaskList();
    }
  }

  void onMarkCompleted(int index, bool value) async {
    TaskModel taskModel = taskList[index];
    taskModel.isCompleted = value;
    await DBProvider.db.updateTask(taskModel);
    fetchTaskList();
    update();
  }

  void onTaskDelete(int index) async {
    await DBProvider.db.deleteTask(taskList[index].id!);
    taskList.removeAt(index);
    update();
  }

  Future<void> fetchTaskList() async {
    try {
      if (filterOption == FilterOption.upcomingTasks) {
        taskList = await DBProvider.db.getAllTaskByStatus(false);
      } else if (filterOption == FilterOption.completedTasks) {
        taskList = await DBProvider.db.getAllTaskByStatus(true);
      } else {
        taskList = await DBProvider.db.getAllTask();
      }
      update();
    } catch (e) {
      print(e);
    }
  }
}
