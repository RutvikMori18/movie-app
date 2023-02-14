import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/data/core/api_constants.dart';

class CommonAPI {
  dynamic getApi(String path, {Map<dynamic, dynamic>? param}) async {
    // String url = '${ApiConstants.baseURL}$path?api_key=${ApiConstants.apiKey}';
    // print('url--->$url');
    final Uri uri = Uri.parse(getPath(path, param));
    final response = await get(uri, headers: {
      'Content-Type': 'application/json',
    });

    await Future.delayed(const Duration(milliseconds: 2000));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? param) {
    String paramString = '';
    if (param?.isNotEmpty ?? false) {
      param!.forEach((key, value) {
        paramString += '&$key=$value';
      });
    }
    print(
        '---->${ApiConstants.baseURL}$path?api_key=${ApiConstants.apiKey}$paramString');
    return '${ApiConstants.baseURL}$path?api_key=${ApiConstants.apiKey}$paramString';
  }
}
