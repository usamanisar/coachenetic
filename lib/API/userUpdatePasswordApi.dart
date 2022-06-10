import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:http/http.dart' as http;

Future<String> userUpdatePasswordDetails(
  String userId,
  String currentPassword,
  String newPassword,
) async {
  Map<String, dynamic> list = {"user_id":userId,"current_password":currentPassword,"new_password":newPassword};

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };

  final response = await http.post(BASE_URL + "/user/update/password",
      headers: headers, body: jsonEncode(list));

  if (response.statusCode == 200) {
    Map<String,dynamic> responseMap =jsonDecode(response.body);
    String message = responseMap["message"];
    return message;
  } else {
    return "Server Error";
  }
}
