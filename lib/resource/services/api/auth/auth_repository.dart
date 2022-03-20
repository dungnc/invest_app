import 'dart:convert';
import 'dart:developer';

import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/resource/model/auth/token_model.dart';
import 'package:statistical_survey/resource/model/reponse/response_model.dart';
import 'package:statistical_survey/resource/model/reponse/response_token.dart';
import 'package:statistical_survey/resource/resource.dart';

import 'auth.dart';

class AuthRepository {
  AuthRepository({required this.provider});
  final AuthProvider provider;

  Future<ResponseToken<TokenModel>> getToken(
      {required String userName, required String password}) async {
    if (NetworkService.connectionType == Network.none) {
      return ResponseToken.withDisconnect();
    }
    final body = {
      'grant_type': 'password',
      'username': userName,
      'password': password,
    };

    final params = {'grant_type': 'refresh_token'};

    final response = await provider.getToken(params: params, body: body);

    String _response = await response.stream.bytesToString();
    var decode = jsonDecode(_response);

    if (response.statusCode == 200) {
      return ResponseToken(
        statusCode: response.statusCode,
        body: TokenModel.fromJson(decode),
      );
    } else {
      return ResponseToken.withError(decode);
    }
  }

  Future<ResponseModel<UserModel>> getUser() async {
    if (NetworkService.connectionType == Network.none) {
      return ResponseModel.withDisconnect();
    }
    var uid = AppPref.uid;
    final response = await provider.getUser(uid!);
    if (response.statusCode == ApiConstants.success) {
      return ResponseModel(
        body: UserModel.fromJson(response.body),
        statusCode: response.statusCode,
      );
    } else {
      return ResponseModel.withError(response);
    }
  }

  Future<bool> updateUser(String uid, Map<String, dynamic> body) async {
    if (NetworkService.connectionType == Network.none) {
      return false;
    }
    final data = await provider.updateUser(uid: uid, body: body);
    log('status code: ${data.statusCode}');
    if (data.isOk) {
      return true;
    } else {
      return false;
    }
  }
}
