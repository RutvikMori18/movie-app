import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/data/core/api_constants.dart';

class CommonAPI {
  dynamic getApi(String path) async {
    final Uri uri = Uri.parse(
        '${ApiConstants.baseURL}$path?api_key=${ApiConstants.apiKey}');
    final response = await get(uri, headers: {
      'Content-Type': 'applicaiton/json',
    });

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
