import 'dart:async';

import 'package:get/get.dart';
import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/modules/modules.dart';
import 'package:statistical_survey/routes/routes.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    Timer(const Duration(seconds: 1), () {
      if (AppPref.accessToken != null) {
        Get.offAllNamed(AppRoutes.mainMenu);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    });
    super.onReady();
  }
}
