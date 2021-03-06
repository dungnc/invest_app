import 'package:get/get.dart';

import '../../modules.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainMenuController(authRepository: Get.find()));
    Get.put(HomeController(inputDataRepository: Get.find()));
    Get.put(ChangePassController(authRepository: Get.find()));
  }
}
