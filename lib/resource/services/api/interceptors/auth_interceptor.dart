import 'dart:async';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:statistical_survey/common/common.dart';

FutureOr<Request> authInterceptor(request) async {
  request.headers['Authorization'] = 'Bearer ${AppPref.accessToken}';
  return request;
}
