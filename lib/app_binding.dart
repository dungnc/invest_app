import 'package:get/get.dart';
import 'package:statistical_survey/resource/resource.dart';
import 'package:statistical_survey/resource/services/api/auth/auth.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(NetworkService(), permanent: true);

    // auth
    Get.put(AuthProvider(), permanent: true);
    Get.put(AuthRepository(provider: Get.find()));
    Get.put(InputDataProvider(), permanent: true);
    Get.put(InputDataRepository(provider: Get.find()));
    Get.put(SyncProvider(), permanent: true);
    Get.put(SyncRepository(provider: Get.find()), permanent: true);
  }
}
