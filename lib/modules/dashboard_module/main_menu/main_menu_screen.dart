import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/config/config.dart';
import 'package:statistical_survey/modules/dashboard_module/home/home_screen.dart';
import 'package:statistical_survey/modules/dashboard_module/widget/widget_item_header.dart';
import 'package:statistical_survey/modules/modules.dart';

import 'main_menu.dart';

class MainMenuScreen extends GetView<MainMenuController> {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingFullScreen(
      child: GestureDetector(
        onTap: () => controller.unFocus(context),
        child: Scaffold(
          appBar: _builAppBar(),
          body: _buildBody(),
        ),
      ),
      loading: controller.loadingSubject,
    );
  }

  Widget _buildBody() {
    return Obx(() {
      return controller.currentTabBar.value == TypeTabBar.home
          ? const HomeScreen()
          : const ChangePassScreen();
    });
  }

  AppBar _builAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: _preferrdSize(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppValues.borderLv5),
        ),
      ),
      centerTitle: false,
      title: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${controller.userModel.value.maPBCC ?? ''} - ${controller.userModel.value.tenNguoiDung ?? ''}',
                style: styleMediumBold),
            Text(
                'sesstion_servey'.trParams({
                  'param': AppFormat.dateTimeToString(
                      controller.userModel.value.ngayCapNhat)
                }),
                style: styleSmall),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(AppIcons.icnNotification),
              padding: EdgeInsets.zero),
        ),
      ],
    );
  }

  PreferredSize _preferrdSize() {
    return PreferredSize(
      child: SizedBox(
          width: Get.width,
          height: Get.height * 0.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => WidgetItemHeader(
                    height: Get.height * 0.08,
                    width: Get.height * 0.08,
                    icon: AppIcons.icHome,
                    isSelected:
                        controller.currentTabBar.value == TypeTabBar.home
                            ? true
                            : false,
                    onPressed: () => controller.onPressTabBar(TypeTabBar.home),
                    name: 'home'.tr,
                  )),
              Obx(() => WidgetItemHeader(
                    height: Get.height * 0.08,
                    width: Get.height * 0.08,
                    icon: AppIcons.icLockBool,
                    isSelected:
                        controller.currentTabBar.value == TypeTabBar.changePass
                            ? true
                            : false,
                    onPressed: () =>
                        controller.onPressTabBar(TypeTabBar.changePass),
                    name: 'change_pass'.tr,
                  )),
              WidgetItemHeader(
                height: Get.height * 0.08,
                width: Get.height * 0.08,
                icon: AppIcons.icLogOut,
                isSelected: false,
                onPressed: controller.onPressLogOut,
                name: 'logout'.tr,
              ),
            ],
          )),
      preferredSize: Size(double.infinity, Get.height * 0.18),
    );
  }
}
