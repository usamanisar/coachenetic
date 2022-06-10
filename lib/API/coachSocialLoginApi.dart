import 'package:http/http.dart' as http;

Future<String> fetchCoachSocialLoginDetails(String name, String email,
    String password, String image, String firebaseID) async {
  List<Map<String, dynamic>> list = [];

  list.add(
    {"key": "name", "value": "coach2", "type": "text"},
  );
  list.add(
    {"key": "email", "value": "coach2@gmail.com", "type": "text"},
  );

  list.add(
    {"key": "password", "value": "123456", "type": "text"},
  );
  list.add(
    {
      "key": "image",
      "value":
          "https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png",
      "type": "text"
    },
  );
  list.add({"key": "firebaseID", "value": "123344", "type": "text"});

  final response = await http.post('');

  if (response.statusCode == 200) {
    //  return userRegister.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load login credentials');
  }
}
