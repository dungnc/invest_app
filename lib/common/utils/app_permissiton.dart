import 'package:permission_handler/permission_handler.dart';

class AppPermissiton{
  AppPermissiton._();

  static Future<bool> getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
     return true;
    }else{
      return false;
    }
  }
}