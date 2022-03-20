import 'dart:developer';

import 'package:get/get.dart';
import 'package:statistical_survey/resource/resource.dart';

class SyncProvider extends BaseProvider {
  Future<Response> syncData(Map body,
      {Function(double)? uploadProgress}) async {
    log('BODY: $body');

    return post(ApiConstants.sync, body, uploadProgress: uploadProgress);
  }
}
