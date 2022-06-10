import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/user.dart';
import 'package:http/http.dart' as http;

Future<User> updateCoachProfile(
    String username,
    String name,
    String email,
    String phone,
    String image,
    String user_id,
    String dob,
    String experience,
    String description,
    String price,
    String certificate) async {
  Map<String, dynamic> list = {
    "username": username,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "user_id": user_id,
    "dob": dob,
    "experience": experience,
    "description": description,
    "price": price,
    "certificate": certificate,
  };

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };
  final response = await http.post(BASE_URL + "/coach/update/profile",
      headers: headers, body: jsonEncode(list));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    print(responseBody);
    if (responseBody["status"] == true) {
      return User.fromJson(responseBody["user"]);
    } else {
      return responseBody["message"];
    }
  } else {
         print(jsonDecode(response.body)['message']);
    return null;
  }
}
