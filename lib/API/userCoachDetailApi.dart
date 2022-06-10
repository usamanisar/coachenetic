import 'dart:convert';

import 'package:coach_netic/models/coach_detail.dart';
import 'package:http/http.dart' as http;

class UserCoachDetailApi {
  Future<CoachDetail> getUserCoachDetail(int id) async {
    var headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://coach.stackbuffers.com/public/api/user/coach/profile'));
    request.fields.addAll({'user_id': id.toString()});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String stringResponse = await response.stream.bytesToString();
      print(jsonDecode(stringResponse));
      return CoachDetail.fromJson(jsonDecode(stringResponse)["coaches"]);
    } else {
      return null;
    }
  }
}
