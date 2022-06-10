import 'package:flutter/material.dart';
import 'dart:async';

import 'coach/sign_in_as_coach.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Thank_YouState createState() => _Thank_YouState();
}

class _Thank_YouState extends State<Splash_Screen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),() => {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignInAsCoach()),
    )
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
            tag: 'logo',
            child: Image.asset("assets/logo.png",)),
      ),

    );
  }
}