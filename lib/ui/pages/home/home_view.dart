import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tast_manager/ui/pages/home/home_controller.dart';
import 'package:tast_manager/ui/pages/home/widget/task_row_widget.dart';
import 'package:tast_manager/ui/shared/dimens.dart';
import 'package:tast_manager/ui/shared/text_styles.dart';
import 'package:tast_manager/ui/shared/ui_helper.dart';

import '../../../constant/app_strings.dart';
import '../../shared/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kcWhiteColor,
            floatingActionButton: FloatingActionButton(
              onPressed: () => controller.navigateToAddNewTask(),
              backgroundColor: kcAccentColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            appBar: AppBar(
              backgroundColor: kcAppbarColor,
              centerTitle: false,
              title: Text(
                app_name,
                style: textStylePoppins(
                  color: kcWhiteColor,
                  fontSize: font_20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => controller.showFilterDialog(),
                    icon: const Icon(
                      Icons.filter_list_outlined,
                      color: kcWhiteColor,
                      size: 24,
                    )),
                IconButton(
                    onPressed: () => controller.showFilterDialog(),
                    icon: const Icon(
                      Icons.more_vert,
                      color: kcWhiteColor,
                      size: 24,
                    ))
              ],
            ),
            body: controller.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.taskList.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 100,
                              width: 100,
                            ),
                            verticalSpaceSmall,
                            Text(
                              createNewTask,
                              style: textStylePoppins(fontWeight: FontWeight.w500, fontSize: font_18),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return TaskRowWidget(
                            task: controller.taskList[index],
                            onMarkCompleted: (value) {
                              controller.onMarkCompleted(index, value);
                            },
                            onTap: () {
                              controller.showTaskDialog(index);
                            },
                            onTapDelete: () {
                              controller.onTaskDelete(index);
                            },
                          );
                        },
                        itemCount: controller.taskList.length,
                      ),
          );
        });
  }
}
