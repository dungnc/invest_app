import 'package:get/get.dart';

import 'api_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.timeout = const Duration(seconds: 10); // default timeout = 8 s,
    httpClient.addAuthenticator(authInterceptor);
    // httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
