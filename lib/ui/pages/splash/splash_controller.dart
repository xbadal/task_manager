import 'package:get/get.dart';
import 'package:tast_manager/ui/pages/home/home_view.dart';

import '../../shared/base_controller.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    handleStartupLogin();
  }

  void handleStartupLogin() {
    setBusy(true);
    Future.delayed(const Duration(milliseconds: 3000), () async {
      Get.offAll(const HomeView());
      setBusy(false);
    });
  }
}
