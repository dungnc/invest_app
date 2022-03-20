import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/config/constants/app_colors.dart';
import 'package:statistical_survey/resource/resource.dart';

abstract class BaseController extends GetxController {
  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void setError(String message) {
    errorSubject.add(message);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  // network
  bool get isConnected => NetworkService.connectionType != Network.none;

  void snackBar(String title, String msg,
      {ToastSnackType style = ToastSnackType.normal}) {
    Get.snackbar(
      title,
      msg,
      colorText: style == ToastSnackType.normal
          ? primaryColor
          : style == ToastSnackType.error
              ? Colors.red
              : Colors.black,
      backgroundColor: Colors.white.withOpacity(0.6),
    );
  }

  Future toast(String msg,
      {ToastSnackType style = ToastSnackType.normal}) async {
    switch (style) {
      case ToastSnackType.error:
        break;
      case ToastSnackType.success:
        break;
      case ToastSnackType.normal:
      default:
        return;
    }
  }

  void unFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  void onClose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.onClose();
  }
}
