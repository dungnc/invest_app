import 'package:get_storage/get_storage.dart';

class AppPref {
  AppPref._();

  static const String storageName = 'AppPref';

  static const String keyToken = 'accessToken';
  static const String keyUid = 'uid';
  static const String lateDateTime = 'lateDateTime';
  static const String keyInstall = 'isFirstInstall';
  static const String userDataKey = 'userDataKey';
  static const String loginDataKey = 'loginDataKey';
  static const String keyUsername = 'userName';
  static const String keyPassword = 'password';

  static final GetStorage _box = GetStorage(storageName);

  static initListener() async {
    await GetStorage.init(storageName);
  }

  static clear() async {
    await _box.remove(keyToken);
    // await _box.remove(lateDateTime);  -> wait for create DB
    await _box.remove(keyUid);
    await _box.remove(userDataKey);
    await _box.remove(loginDataKey);
    await _box.remove(keyUsername);
    await _box.remove(keyPassword);
  }

  // user name
  static set userName(String? token) => _box.write(keyUsername, token);
  static String? get userName => _box.read(keyUsername);

  // password
  static set password(String? token) => _box.write(keyPassword, token);
  static String? get password => _box.read(keyPassword);

  // access token
  static set accessToken(String? token) => _box.write(keyToken, token);
  static String? get accessToken => _box.read(keyToken);

  // uid
  static set uid(String? uid) => _box.write(keyUid, uid);
  static String? get uid => _box.read(keyUid);

  // new version database
  static set dateTimeSaveDB(String? dateTime) =>
      _box.write(lateDateTime, dateTime);
  static String? get dateTimeSaveDB => _box.read(lateDateTime);

  // if user install first app then isFistInstall= 1
  static set isFistInstall(int? token) => _box.write(keyInstall, token);
  static int get isFistInstall => _box.read(keyInstall) ?? 0;

  // response login
  static set loginData(String? data) => _box.write(loginDataKey, data);
  static String get loginData => _box.read(loginDataKey) ?? '';

  //response get me
  static set userData(String? data) => _box.write(userDataKey, data);
  static String get userData => _box.read(userDataKey) ?? '';
}
