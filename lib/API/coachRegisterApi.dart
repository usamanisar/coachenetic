import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/user.dart';
import 'package:http/http.dart' as http;

Future<dynamic> registerCoach(
    String username,
    String name,
    String email,
    String phone,
    String password,
    String image,
    String dob,
    String experience,
    String certificate,
    String price,
    String categoryId
    ) async {
  Map<String, dynamic> list = {
    "username": username,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "device_type": "android",
    "token": "32423423dsfd2342",
    "image": image,
    "category_id": categoryId,
    "price": price,
    "fee": price,
    "dob": dob,
    "experience": experience,
    "certificate": certificate
  };

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };

  final response = await http.post(BASE_URL + "/coach/register",
      headers: headers, body: jsonEncode(list));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (responseBody["status"] == true) {
      return User.fromJson(responseBody["user"]);
    } else {
      return responseBody["message"];
    }
  } else {
    // throw Exception(jsonDecode(response.body)['message']);
    return response.reasonPhrase;
  }
}
