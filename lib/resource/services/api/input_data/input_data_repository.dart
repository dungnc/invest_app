import 'dart:convert';

import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/resource/resource.dart';

class InputDataRepository {
  InputDataRepository({required this.provider});
  final InputDataProvider provider;

  Future<ResponseModel<String>> getData() async {
    if (NetworkService.connectionType == Network.none) {
      return ResponseModel.withDisconnect();
    }
    final data = await provider.getData();
    if (data.statusCode == ApiConstants.success) {
      return ResponseModel(
        statusCode: ApiConstants.success,
        body: jsonEncode(data.body),
      );
    } else {
      return ResponseModel.withError(data);
    }
  }

  Future<ResponseModel<String>> getVersion() async {
    if (NetworkService.connectionType == Network.none) {
      return ResponseModel.withDisconnect();
    }
    final data = await provider.getData();
    if (data.statusCode == ApiConstants.success) {
      return ResponseModel(
        statusCode: ApiConstants.success,
        body: jsonEncode(data.body),
      );
    } else {
      return ResponseModel.withError(data);
    }
  }
}
