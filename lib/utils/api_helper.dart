import 'dart:async';

import 'package:flutter_git_trending/utils/NetworkResponse.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

ApiHelper apiHelper = new ApiHelper();

class ApiHelper {
  static final ApiHelper _instance = new ApiHelper._internal();

  final String baseUrl = "https://github-tranding.azurewebsites.net/";

  factory ApiHelper() {
    return _instance;
  }

  ApiHelper._internal();

  ///Set debug url when running debug version of app

  Future<NetworkResponse> get({@required String endpoint}) async {
    http.Response response = await http.get(baseUrl + endpoint);
    return NetworkResponse(response);
  }

/* Future<NetworkResponse> post({@required String endpoint, String url, bool includeToken = true, @required String body}) async {
    http.Response response = await http.post(checkIfNotEmpty(url) ? url : (baseUrl + endpoint), headers: headers, body: body);
    return NetworkResponse(response);
  }*/

}

class RequestException implements Exception {
  final NetworkResponse response;

  RequestException(this.response);

  @override
  String toString() {
    return "Server Error: " + response.statusCode.toString();
  }
}
