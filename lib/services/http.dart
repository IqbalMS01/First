import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = '';
}

class ApiService {
  static Future<List<dynamic>> httpGet(token) async {
    final response = await http.get('${URLS.BASE_URL}/');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<String> httpPost(body, token) async {
    final response = await http.post('${URLS.BASE_URL}/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else if (response.statusCode == 401) {
      return '/Login';
    } else {
      return 'error';
    }
  }
}
