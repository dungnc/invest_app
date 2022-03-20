import 'package:statistical_survey/common/utils/app_regex.dart';

class Valid {
  Valid._();

  static String? validateUserName(String? userName) {
    if (userName == null || userName.trim().isEmpty) {
      return 'Tên không được để trống';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    RegExp regExp = RegExp(AppRegex.regexPhoneNumber);
    if (phoneNumber != null) {
      if (!regExp.hasMatch(phoneNumber)) {
        return 'Số điện thoại không hợp lên';
      }
      return null;
    }
    return 'Số điện thoại không được để trống';
  }
}
