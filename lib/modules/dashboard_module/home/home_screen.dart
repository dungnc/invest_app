import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/config/config.dart';
import 'package:statistical_survey/modules/dashboard_module/dashboard_module.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        crossAxisSpacing: AppValues.padding,
        mainAxisSpacing: AppValues.padding,
        crossAxisCount: 2,
        childAspectRatio: 7 / 6,
        children: _children(),
      ),
    );
  }

  List<Widget> _children() {
    if (controller.mainMenuController.userModel.value.ftpPublicUrl != null &&
        controller.mainMenuController.userModel.value.ftpPublicUrl != '') {
      return _ftpItem();
    }
    return _items();
  }

  List<Widget> _items() {
    return <Widget>[
      WidgetItemMainMenu(
        name: 'interview'.tr,
        onPressed: controller.toInterViewScreen,
        icon: AppIcons.icPaper,
      ),
      WidgetItemMainMenu(
        name: 'update_app_title'.tr,
        onPressed: (){},
        icon: AppIcons.icDownload,
      ),
      WidgetItemMainMenu(
        name: 'post_data'.tr,
        onPressed: controller.syncData,
        icon: AppIcons.icSync,
      ),
      WidgetItemMainMenu(
        name: 'progress'.tr,
        onPressed: controller.showProgress,
        icon: AppIcons.icRouteWhite,
      ),
      WidgetItemMainMenu(
        name: 'get_data'.tr,
        onPressed: controller.updateData,
        icon: AppIcons.icGetData,
      ),
    ];
  }

  List<Widget> _ftpItem() {
    return <Widget>[
      WidgetItemMainMenu(
        name: '${"post_data".tr} FTP',
        onPressed: (){},
        icon: AppIcons.icSync,
      ),
    ];
  }
}
