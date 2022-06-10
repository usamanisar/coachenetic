import 'dart:convert';

import 'package:coach_netic/config/config.dart';
import 'package:coach_netic/models/category.dart';
import 'package:coach_netic/models/coach.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> getCategories() async {
  var headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://coach.stackbuffers.com/public/api/categories'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var json = jsonDecode(await response.stream.bytesToString());
    return List<Category>.from(json["categories"].map((x) => Category.fromJson(x)));
  } else {
    print(response.reasonPhrase);
    return [];
  }

}
