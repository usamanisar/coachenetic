import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/coach.dart';
import 'package:http/http.dart' as http;

Future<List<Coach>> userSearchCoachesDetails(
  String keyword,
) async {
  Map<String, dynamic> map = {"keyword": keyword};

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };
  final response = await http.post(BASE_URL + "/user/search/coaches",
      headers: headers, body: jsonEncode(map));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    List<dynamic> coaches = responseMap["coaches"] as List;
    return coaches.map((e) => Coach.fromJson(e)).toList();
  } else {
    return [];
  }
}
