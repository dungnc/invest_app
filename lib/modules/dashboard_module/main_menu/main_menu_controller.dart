import 'dart:convert';
import 'dart:developer';

import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/modules/modules.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/resource/resource.dart';
import 'package:statistical_survey/resource/services/api/auth/auth_repository.dart';
import 'package:statistical_survey/routes/routes.dart';

enum TypeTabBar {
  home,
  changePass,
}

class MainMenuController extends BaseController {
  MainMenuController({required this.authRepository});

  final AuthRepository authRepository;

  //RX
  final currentTabBar = TypeTabBar.home.obs;
  final userModel = UserModel().obs;

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }

  void onPressTabBar(TypeTabBar type) {
    if (type != currentTabBar.value) {
      currentTabBar.value = type;
    }
  }

  Future onPressLogOut() async {
    await Get.dialog(
      DialogLogOut(
        onPressedNegative: () => Get.back(),
        onPressedPositive: () async {
          await AppPref.clear();
          Get.offAllNamed(AppRoutes.login);
        },
      ),
    );
  }

  Future getUser() async {
    bool isNetWork = NetworkService.connectionType != Network.none;
    String _loginData = AppPref.loginData;
    String _userData = AppPref.userData;
    var _json = jsonDecode(_loginData);
    TokenModel loginData = TokenModel.fromJson(_json);

    // set user from Cache for app
    if (_userData != '') {
      log(_userData);
      var _jsonUserData = jsonDecode(_userData);
      userModel.value = UserModel.fromJson(_jsonUserData);
    } else {
      _json['TenNguoiDung'] = loginData.userName;
      userModel.value = UserModel.fromJson(_json);
    }

    // -> User FTP have not value in getMe url
    if (loginData.ftpInternalUrl == null && isNetWork) {
      setLoading(true);

      final value = await authRepository.getUser();
      if (value.isSuccess) {
        userModel.value = value.body!;

        // save in cache for use when not connect internet
        String _user = jsonEncode(value.body!);
        AppPref.userData = _user;
      } else {
        snackBar('error'.tr, '${value.message}');
        Get.offAllNamed(AppRoutes.login);
      }
      setLoading(false);
    }
  }
}
