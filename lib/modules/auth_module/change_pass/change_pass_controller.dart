
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/resource/model/model.dart';
import 'package:statistical_survey/resource/services/api/auth/auth.dart';

import '../../modules.dart';

class ChangePassController extends BaseController{
  ChangePassController({required this.authRepository});
  final AuthRepository authRepository;

  // 
  final formKey = GlobalKey<FormState>();

  final mapInputControllers = <String,TextEditingController>{};
 
  // controller
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  String currentPassword = '';
  @override
  void onClose() {
    currentPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    mapInputControllers.forEach((key, value) {
      value.dispose();
    });
    super.onClose();
  }

  TextEditingController getEditingController(String key){
    if(mapInputControllers[key] == null){
      mapInputControllers[key] = TextEditingController();
    }
    return mapInputControllers[key]!;
  }

  onPressChangePass() async {
    final mainMenuController = Get.find<MainMenuController>();
    await mainMenuController.getUser();
    currentPassword = mainMenuController.userModel.value.matKhau!;
    if(formKey.currentState!.validate()){
      await changePass(mainMenuController.userModel.value);
    }
  }

  String? validateConfirmPassword(String? p1) {
    if(p1 != newPassController.text){
      return 'validate_confirm_pass'.tr;
    }
    return null;
  }

  String? validateCurrentPassword(String? p1){
    if(p1 != currentPassword){
      return 'Mật khẩu không khớp với mật khẩu hiện tại';
    }else if(p1 == null){
      return 'validate_empty'.trParams({'param': 'hint_pass'.tr});
    }else {
      return null;
    }
  }

  Future changePass(UserModel userModel) async {
    userModel.matKhau = confirmPassController.text;
    log('userModel: ${userModel.toJson()}');
    bool result = await authRepository.updateUser(userModel.maDangNhap!, userModel.toJson());
    if(result){
      snackBar('success'.tr, 'Đổi mật khẩu thành công!');
      
    }else{
      snackBar('error'.tr, 'Đổi mật khẩu không thành công!');
    }
  }
}