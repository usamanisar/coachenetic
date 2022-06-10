import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/user.dart';
import 'package:http/http.dart' as http;

Future<dynamic> registerUser(
  String username,
  String name,
  String email,
  String image,
  String phone,
  String password,
) async {
  Map<String, dynamic> list = {
    "username": username,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "device_type": "android",
    "token": "32423423dsfd2342",
    "image":   image
  };

  Map<String, String> headers = new Map<String,String>();
  headers.addAll({
    "Accept": "application/json",
    "X-Requested-With": "XMLHttpRequest",
    "Content-Type": "application/json",
  });
  final response = await http.post(BASE_URL + "/user/register",
      headers: headers, body: jsonEncode(list));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if(responseBody["status"] == true){
      return User.fromJson(responseBody["user"]);
    }
    else{
      return responseBody["message"];
    }
  } else {
 //    throw Exception(jsonDecode(response.body)['message']);
     return null;
  }
}
