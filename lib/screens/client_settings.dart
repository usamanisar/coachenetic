import 'package:coach_netic/API/userUpdatePasswordApi.dart';
import 'package:coach_netic/global.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'client/client_bottom_bar.dart';
import 'client/client_home.dart';

class Client_Setting extends StatefulWidget {
  @override
  _Client_SetiingState createState() => _Client_SetiingState();
}

class _Client_SetiingState extends State<Client_Setting> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      // resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4 + 20,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(
                          //     Colors.blueAccent.withOpacity(0.5),  BlendMode.color),
                          image: AssetImage("assets/setting_bg.png"),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            margin: EdgeInsets.only(top: 25, left: 10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.white70,
                                        size: 14.0,
                                      ),
                                    )),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Setting",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.black,
                  ),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 8),
                  padding: EdgeInsets.only(
                      right: 15.0, left: 15.0, top: 5.0, bottom: 5.0),
                  width: MediaQuery.of(context).size.width,
                  //  height: MediaQuery.of(context).size.height / 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Current Password",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16.0,
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 8.0, bottom: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your current password';
                              }
                              return null;
                            },
                            controller: currentpasswordcontroller,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            cursorColor: Colors.white,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                              //InputBorder.none,
                              fillColor: HexColor("#080812"),
                              filled: true,

                              // focusedBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.blue, width: 1.0),
                              // ),
                              hintText: "John@123",
                              hintStyle: TextStyle(color: Colors.white54),
                              prefixIcon: Icon(Icons.lock,
                                  size: 18.0, color: HexColor("#0070BF")),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              "New Password",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16.0,
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 8.0, bottom: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter new password';
                              }
                              return null;
                            },
                            controller: newpasswordcontroller,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            cursorColor: Colors.white,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                              //InputBorder.none,
                              fillColor: HexColor("#080812"),
                              filled: true,

                              // focusedBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.blue, width: 1.0),
                              // ),
                              hintText: "JohnDoe123",
                              hintStyle: TextStyle(color: Colors.white54),
                              prefixIcon: Icon(Icons.lock,
                                  size: 18.0, color: HexColor("#0070BF")),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16.0,
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 8.0, bottom: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Re-Enter New Password";
                              } else if (value.length < 8) {
                                return "Password must be atleast 8 characters long";
                              } else if (value != newpasswordcontroller.text) {
                                return "Password must be same as above";
                              } else {
                                return null;
                              }
                            },
                            controller: confirmpasswordcontroller,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            cursorColor: Colors.white,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                              //InputBorder.none,
                              fillColor: HexColor("#080812"),
                              filled: true,

                              // focusedBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.blue, width: 1.0),
                              // ),
                              hintText: "Johndoe123",
                              hintStyle: TextStyle(color: Colors.white54),
                              prefixIcon: Icon(Icons.lock,
                                  size: 18.0, color: HexColor("#0070BF")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minWidth: 400.0,
                            height: 40.0,
                            color: Colors.blue,
                            elevation: 15.0,
                            child: Text(
                              "UPDATE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: () {
                              String currentpassword =
                                  currentpasswordcontroller.text;
                              String newpassword = newpasswordcontroller.text;
                              if (_formKey.currentState.validate()) {
                                _scaffoldkey.currentState.showSnackBar(
                                    new SnackBar(
                                        content: new Text("Processing Data")));
                                userUpdatePasswordDetails(
                                        GlobalValues.user.id.toString(),
                                        currentpassword,
                                        newpassword)
                                    .then((value) => {
                                          if (value == null)
                                            {
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                      content: new Text(
                                                          "Server Error")))
                                            }
                                          else if (value is String)
                                            {
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                      content:
                                                          new Text(value))),
                                              if (value == "Password Updated")
                                                {
                                                  SharedPreferences
                                                          .getInstance()
                                                      .then((prefs) {
                                                    prefs.setString('password',
                                                        newpassword);
                                                  }),
                                                  Future.delayed(
                                                          Duration(seconds: 4))
                                                      .then((value) => {
                                                            Navigator.pop(
                                                                context)
                                                          })
                                                }
                                            }
                                          else
                                            {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>


                                                          ClientBottomBar())),
                                              _scaffoldkey.currentState
                                                  .showSnackBar(new SnackBar(
                                                      content: new Text(
                                                          "Registration successful")))
                                            }
                                        });
                              } else {
                                _scaffoldkey.currentState.showSnackBar(
                                    new SnackBar(
                                        content: new Text(
                                            "Please complete all fields")));
                              }
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(builder: (context) => ClientHome()),
                              //);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
