import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/data/core/un_authorize_exception.dart';

class CommonAPI {
  dynamic getApi(String path, {Map<dynamic, dynamic>? param}) async {
    // String url = '${ApiConstants.baseURL}$path?api_key=${ApiConstants.apiKey}';
    // print('url--->$url');
    final Uri uri = Uri.parse(getPath(path, param));
    final response = await get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic postMethod(String path, Map<dynamic, dynamic>? param) async {
    final Uri uri = Uri.parse(getPath(path, null));
    final response = await post(
      uri,
      body: jsonEncode(param),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException();
    } else {
      Exception(response.reasonPhrase);
    }
  }

  dynamic deleteMethodWithBody(
      String path, Map<dynamic, dynamic>? param) async {
    final uri = Uri.parse(getPath(path, null));
    // Request request = Request('DELETE', uri);
    // request.headers['Content-Type'] = 'application/json';
    // request.body = jsonEncode(param);
    final response = await delete(
      uri,
      body: jsonEncode(param),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException();
    } else {
      Exception(response.reasonPhrase);
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
