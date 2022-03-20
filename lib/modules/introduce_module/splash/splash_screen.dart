import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/config/config.dart';

import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.imgBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      padding:
          EdgeInsets.only(top: Get.height * 0.12, bottom: Get.height * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.imgLogoCircle,
            width: Get.width * 0.35,
            height: Get.width * 0.35,
          ),
          const Spacer(),
          Text(
            'slogan'.tr,
            style: styleLargeBold.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
