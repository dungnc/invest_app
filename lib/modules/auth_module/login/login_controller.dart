import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/config/constants/app_values.dart';
import 'package:statistical_survey/modules/modules.dart';
import 'package:statistical_survey/resource/services/api/auth/auth.dart';
import 'package:statistical_survey/routes/routes.dart';

class LoginController extends BaseController {
  LoginController({required this.authRepository});

  final AuthRepository authRepository;

  // controller
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final mapInputControllers = <String, TextEditingController>{};

  final keyUserName = 'userName';
  final keyPass = 'pass';

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    mapInputControllers.forEach((key, value) {
      value.dispose();
    });
    super.onInit();
  }

  onPressedLogin() async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      if (await _login()) {
        Get.offAllNamed(AppRoutes.mainMenu);
      }
    }
    setLoading(false);
  }

  TextEditingController getEditingController(String key) {
    if (mapInputControllers[key] == null) {
      mapInputControllers[key] = TextEditingController();
    }
    return mapInputControllers[key]!;
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    mapInputControllers.forEach((key, value) {
      value.dispose();
    });
    super.onClose();
  }

  Future<bool> _login() async {
    try {
      String userName = getEditingController(keyUserName).text.trim();
      String password = getEditingController(keyPass).text.trim();

      final response = await authRepository
          .getToken(
            userName: userName,
            password: password,
          )
          .timeout(const Duration(seconds: AppValues.timeOut));

      if (response.isSuccess) {
        AppPref.userName = userName;
        AppPref.password = password;
        AppPref.accessToken = response.body!.accessToken;
        AppPref.uid = response.body!.userName;
        AppPref.loginData = jsonEncode(response.body!);
        // log(response.body!.toJson().toString());
        return true;
      } else {
        if (response.statusCode == 500 || response.statusCode == 404) {
          _showError('can_not_connect_serve'.tr);
        } else if (response.errorDescription ==
            'Provided username and password is incorrect') {
          _showError('username_password_incorrect'.tr);
        } else {
          _showError(response.errorDescription ?? '');
        }
      }
      return false;
    } on TimeoutException catch (_) {
      _showError('can_not_connect_serve'.tr);
      return false;
    }
  }

  _showError(String msg) =>
      snackBar('error'.tr, msg, style: ToastSnackType.error);
}
