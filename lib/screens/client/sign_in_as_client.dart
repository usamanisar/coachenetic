import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:coach_netic/API/userLoginApi.dart';
import 'package:coach_netic/global.dart';
import 'package:coach_netic/main.dart';
import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/screens/client/sign_up_as_client.dart';
import 'package:coach_netic/screens/coach/coach_bottom_bar.dart';
import 'package:coach_netic/screens/coach/coach_home.dart';
import 'package:coach_netic/screens/coach/sign_in_as_coach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'client_bottom_bar.dart';
import 'client_home.dart';

class SignInAsClient extends StatefulWidget {
  @override
  SignInAsClientState createState() => SignInAsClientState();
}

class SignInAsClientState extends State<SignInAsClient> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool obscureText = true;

  bool showDialog = false;

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    cwidth = MediaQuery.of(context).size.width;
    cheight = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        key: _scaffoldkey,
        body: Stack(
          children: [
            SizedBox.expand(
              child: Form(
                key: _formKey,
                child: Container(
                    alignment: Alignment.center,
                    width: cwidth,
                    height: cheight,
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/sign_in_as_client_bg.png"),
                          width: cwidth,
                          height: cheight,
                          fit: BoxFit.cover,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0),
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0,
                                        left: 20.0,
                                        right: 20.0,
                                        bottom: 30.0),
                                    height: cheight / 4,
                                    width: cwidth,
                                    // color: Colors.white,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Hero(
                                        tag: 'logo',
                                        child: Image(
                                          image: AssetImage("assets/logo.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        // color: Colors.pink,
                                        //  height: cheight/10,
                                        width: cwidth,
                                        margin: EdgeInsets.only(top: 10.0),
                                        alignment: Alignment.bottomLeft,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            AutoSizeText(
                                              'Sign',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35.0,
                                                letterSpacing: 2.0,
                                              ),
                                              maxFontSize: 50.0,
                                              minFontSize: 20.0,
                                            ),
                                            AutoSizeText(
                                              ' In',
                                              style: TextStyle(
                                                  color: HexColor('#0070BF'),
                                                  letterSpacing: 2.0,
                                                  fontSize: 35.0),
                                              maxFontSize: 50.0,
                                              minFontSize: 20.0,
                                            ),
                                            AutoSizeText(
                                              ' As',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35.0,
                                                letterSpacing: 2.0,
                                              ),
                                              maxFontSize: 50.0,
                                              minFontSize: 20.0,
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        //  padding: EdgeInsets.only(left: 25.0),
                                        child: Row(
                                          children: <Widget>[
                                            ButtonTheme(
                                              minWidth: 82.0,
                                              height: 30.0,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    side: BorderSide(
                                                        color: HexColor(
                                                            '#0070BF'))),
                                                color: HexColor('#0070BF'),
                                                textColor: Colors.white,
                                                disabledColor: Colors.black26,
                                                disabledTextColor:
                                                    Colors.white30,
                                                padding: EdgeInsets.all(4.0),
                                                splashColor: Colors.blueAccent,
                                                onPressed: () {
                                                  /*...*/
                                                },
                                                child: AutoSizeText(
                                                  "Client",
                                                  maxFontSize: 15.0,
                                                  minFontSize: 10.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            ButtonTheme(
                                              minWidth: 82.0,
                                              height: 30.0,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    side: BorderSide(
                                                        color: Colors.black12)),
                                                color: Colors.white12,
                                                textColor: Colors.white,
                                                disabledColor: Colors.black26,
                                                disabledTextColor:
                                                    Colors.white30,
                                                padding: EdgeInsets.all(4.0),
                                                splashColor: Colors.blueAccent,
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignInAsCoach()),
                                                    );
                                                  });
                                                },
                                                child: AutoSizeText(
                                                  "Coach",
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                  maxFontSize: 15.0,
                                                  minFontSize: 10.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: AutoSizeText(
                                            "Email",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 17.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter email';
                                          }
                                          return null;
                                        },
                                        controller: emailcontroller,

                                        //   autofocus: true,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                        cursorColor: HexColor("#0070BF"),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: Colors.blue, width: 1.0),
                                          // ),
                                          hintText: "johndoe123@gmail.com",
                                          hintStyle:
                                              TextStyle(color: Colors.white54),
                                          prefixIcon: Icon(Icons.mail_outline,
                                              size: 16.0,
                                              color: HexColor("#0070BF")),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: AutoSizeText(
                                            "Password",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 17.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                        controller: passwordcontroller,
                                        obscureText: obscureText,
                                        //  autofocus: true,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: Colors.blue, width: 1.0),
                                          // ),
                                          hintText: "••••••••••••••••••",
                                          hintStyle:
                                              TextStyle(color: Colors.white54),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obscureText = !obscureText;
                                              });
                                            },
                                            child: obscureText == true
                                                ? Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    child: Icon(
                                                        Icons.visibility_off,
                                                        size: 16.0,
                                                        color: HexColor(
                                                            "#0070BF")),
                                                  )
                                                : Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    child: Icon(
                                                        Icons.visibility,
                                                        size: 16.0,
                                                        color: HexColor(
                                                            "#0070BF")),
                                                  ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            size: 16.0,
                                            color: HexColor("#0070BF"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.check_circle_outline,
                                              size: 20.0,
                                              color: HexColor("#0070BF")),
                                          Expanded(
                                              flex: 8,
                                              child: GestureDetector(
                                                  child: AutoSizeText(
                                                      "  Remember Me",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      maxFontSize: 25.0,
                                                      minFontSize: 10.0,
                                                      overflow: TextOverflow
                                                          .ellipsis))),
                                          Spacer(flex: 2),
                                          Expanded(
                                              flex: 8,
                                              child: GestureDetector(
                                                  child: AutoSizeText(
                                                "Forget Password?",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                maxFontSize: 25.0,
                                                minFontSize: 10.0,
                                                overflow: TextOverflow.ellipsis,
                                              ))),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: MaterialButton(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          //  400.0,
                                          height: 40.0,
                                          color: HexColor("#0070BF"),
                                          elevation: 15.0,
                                          child: AutoSizeText(
                                            "LOGIN",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 18.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onPressed: () {
                                            String email = emailcontroller.text;
                                            String password =
                                                passwordcontroller.text;

                                            if (_formKey.currentState
                                                .validate()) {
                                              setState(() {
                                                showDialog = true;
                                              });
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                      content: new Text(
                                                          "Processing Data")));
                                              loginUser(email, password)
                                                  .then((value) {
                                                if (value == null) {
                                                  _scaffoldkey.currentState
                                                      .showSnackBar(new SnackBar(
                                                          content: new Text(
                                                              "wrong credentials")));
                                                } else if (value is String) {
                                                  _scaffoldkey.currentState
                                                      .showSnackBar(
                                                          new SnackBar(
                                                              content: new Text(
                                                                  value)));
                                                } else {
                                                  if ((value as User).role ==
                                                      1) {
                                                    GlobalValues.user = value;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((prefs) {
                                                      prefs.setString(
                                                          'email', email);
                                                      prefs.setString(
                                                          'password', password);
                                                    });

                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ClientBottomBar(
                                                                  user: value,
                                                                )));
                                                  } else if ((value as User)
                                                          .role ==
                                                      2) {
                                                    GlobalValues.user = value;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((prefs) {
                                                      prefs.setString(
                                                          'email', email);
                                                      prefs.setString(
                                                          'password', password);
                                                    });

                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return CoachBottomBar(
                                                        user: value,
                                                      );
                                                    }));
                                                  }
                                                }

                                                setState(() {
                                                  showDialog = false;
                                                });
                                              });
                                            } else {
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                      content: new Text(
                                                          "Please complete all fields")));
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4.0),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.white,
                                                  width: 1)),
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          height: 40.0,
                                          color: Colors.black,
                                          elevation: 15.0,
                                          child: AutoSizeText(
                                            "SIGN UP",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxFontSize: 18.0,
                                            minFontSize: 10.0,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUpAsClient()));
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 10,
                                            child: Divider(
                                              color: Colors.white70,
                                              height: 1.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //  padding: EdgeInsets.only(right: 10.0,left:10.0),
                                              child: CircleAvatar(
                                                child: AutoSizeText(
                                                  "OR",
                                                  minFontSize: 8.0,
                                                  maxFontSize: 12.0,
                                                ),
                                                radius: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Divider(
                                              color: Colors.white70,
                                              height: 1.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(top: 12.0),
                                              child: MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.4,
                                                height: 35.0,
                                                color: HexColor("#0070BF"),
                                                elevation: 15.0,
                                                child: AutoSizeText(
                                                  "Login With Facebook",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  maxFontSize: 12.0,
                                                  minFontSize: 8.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 10.0,
                                          // ),
                                          Spacer(flex: 1),
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(top: 12.0),
                                              child: MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.4,
                                                //150.0,
                                                height: 37.0,

                                                color: HexColor("#E34133"),
                                                elevation: 15.0,
                                                child: AutoSizeText(
                                                  "Login With Google",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  maxFontSize: 12.0,
                                                  minFontSize: 8.0,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        // FutureBuilder<login>(
                        //     future: futurelogin,
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasData) {
                        //         return Text(snapshot.data.name);
                        //       } else if (snapshot.hasError) {
                        //         return Text("${snapshot.error}");
                        //       }
                        //       return CircularProgressIndicator();
                        //     }
                        //     //}
                        //     )
                      ],
                    )),
              ),
            ),
            Visibility(
                visible: showDialog,
                child: SizedBox.expand(
                  child: Container(
                    color: Colors.black26,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                      )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
