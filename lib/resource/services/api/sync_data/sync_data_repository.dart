import 'dart:convert';
import 'dart:developer';

import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/resource/model/reponse/response_model.dart';
import 'package:statistical_survey/resource/resource.dart';

import 'sync_data_provider.dart';

class SyncRepository {
  SyncRepository({required this.provider});
  final SyncProvider provider;

  Future<ResponseModel<String>> syncData(Map body,
      {Function(double)? uploadProgress}) async {
    if (NetworkService.connectionType == Network.none) {
      return ResponseModel.withDisconnect();
    }
    final data = await provider.syncData(body, uploadProgress: uploadProgress);
    if (data.statusCode == ApiConstants.success) {
      return ResponseModel(
        statusCode: ApiConstants.success,
        body: jsonEncode(data.body),
      );
    } else {
      log('error: ${data.body}');
      return ResponseModel.withError(data);
    }
  }
}
