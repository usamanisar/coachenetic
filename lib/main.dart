import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/screens/client/client_bottom_bar.dart';
import 'package:coach_netic/screens/coach/coach_bottom_bar.dart';
import 'package:coach_netic/screens/coach/coach_home.dart';

import 'API/userLoginApi.dart';
import 'package:coach_netic/screens/client/client_home.dart';
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coach_netic/global.dart';

double cwidth;

double cheight;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var password = prefs.getString('password');
  print(email);
  print(password);
  if (email != null && password != null) {
    loginUser(email, password).then((value) {
      if (value is User) {
        User user = value;
        GlobalValues.user = value;
        if (user.role == 1) {
          runApp(MaterialApp(home: ClientBottomBar(user: user)));
        } else {
          runApp(MaterialApp(home: CoachBottomBar(user: user)));
        }
      } else {
        print("valus is not user");
        runApp(MaterialApp(home: MyApp()));
      }
    });
  } else {
    runApp(MaterialApp(home: MyApp()));
  }

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coach Hetic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInAsClient(),
    );
  }
}
