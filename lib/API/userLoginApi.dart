import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/user.dart';
import 'package:http/http.dart' as http;

Future<dynamic> loginUser(
  String email,
  String password,
) async {
  Map<String, dynamic> list = {
    "email": email,
    "password": password,
    "device_type": "android",
    "token": "32423423dsfd2342",
  };

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };
  final response = await http.post(BASE_URL + "/user/login",
      headers: headers, body: jsonEncode(list));
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (responseBody["status"] == true) {
      print(responseBody['user']);
      return User.fromJson(responseBody["user"]);
    } else {
      return responseBody["message"];
    }
  } else {
    // throw Exception(jsonDecode(response.body)['message']);
    return null;
  }
}
