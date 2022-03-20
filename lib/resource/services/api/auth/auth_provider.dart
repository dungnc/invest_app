import 'dart:convert';

import 'package:get/get.dart';
import 'package:statistical_survey/resource/resource.dart';

import '../base_provider.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends BaseProvider {
  /// Get token
  Future<http.StreamedResponse> getToken({
    required Map<String, String> params,
    required Map<String, String> body,
  }) async {
    String credentials =
        "${ApiConstants.basicUserName}:${ApiConstants.basicPass}";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);

    //header
    var headers = {
      'Authorization': 'Basic $encoded',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
        'POST', Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getToken}'));
    request.headers.addAll(headers);
    request.followRedirects = false;
    request.bodyFields = body;

    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<Response> getUser(String uid) async {
    return get('${ApiConstants.getUser}?uid=$uid');
  }

  Future<Response> updateUser({
    required String uid,
    required Map<String, dynamic> body,
  }) async {
    return put('${ApiConstants.getUser}?uid=$uid', body);
  }
}
