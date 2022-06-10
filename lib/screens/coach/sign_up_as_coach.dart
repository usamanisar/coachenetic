import 'dart:io';
import 'dart:convert';
import 'dart:ui';
import 'package:coach_netic/API/coachRegisterApi.dart';
import 'package:coach_netic/API/getCategoriesApi.dart';
import 'package:coach_netic/colors.dart';
import 'package:coach_netic/global.dart';
import 'package:coach_netic/models/category.dart';
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:coach_netic/screens/coach/sign_in_as_coach.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coach_netic/screens/coach/coach_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:email_validator/email_validator.dart';

import 'coach_bottom_bar.dart';

class SignUpAsCoach extends StatefulWidget {
  @override
  SignInAsCoachState createState() => SignInAsCoachState();
}

class SignInAsCoachState extends State<SignUpAsCoach> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  Category selectedCategory;
  List<Category> categoryList = [];

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController certificatecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();

  File imageFile;
  String imCertificateBase64;

  File image;
  String imProfileBase64;
  bool obscureText = true;

  @override
  void initState() {
    getCategories().then((value) => {
          setState(() {
            categoryList = value;
          })
        });

    super.initState();
  }

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldkey,
        body: Stack(
          children: [
            SizedBox.expand(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/sign_up_bg.png"),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 0.0,
                                        left: 20.0,
                                        right: 20.0),
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Hero(
                                        tag: 'logo',
                                        child: Image(
                                          image: AssetImage("assets/logo.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    //     padding: EdgeInsets.only(left: 25.0),
                                    child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                            text: 'Sign',
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white),
                                            children: [
                                              TextSpan(
                                                  text: ' Up',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color:
                                                          HexColor('#0070BF')),
                                                  children: [
                                                    TextSpan(
                                                      text: ' As',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 35),
                                                    )
                                                  ])
                                            ])),
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
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color:
                                                        HexColor("#0070BF"))),
                                            color: HexColor("#0070BF"),
                                            textColor: Colors.white,
                                            padding: EdgeInsets.all(4.0),
                                            splashColor: Colors.blueAccent,
                                            onPressed: () {
                                              setState(() {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(builder: (context) => Sign_In_As_Coach()),
                                                // );
                                              });
                                            },
                                            child: Text(
                                              "Coach",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          // alignment: Alignment.topLeft,
                                          // padding: EdgeInsets.only(top: 0.0),
                                          child: Text(
                                        "Add profile Image",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: CircleAvatar(
                                          radius: 40.0,
                                          backgroundColor: HexColor("#0070BF"),
                                          child: CircleAvatar(
                                            radius: 38.0,
                                            backgroundColor: Colors.black,
                                            child: GestureDetector(
                                              onTap: () {
                                                _getFromGalleryProfile();
                                              },
                                              child: ClipRRect(
                                                child: image != null
                                                    ? Image.file(
                                                        File(image.path),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        "assets/sign_up_profile_image.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(34.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "User Name",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter user name';
                                      }
                                      return null;
                                    },
                                    controller: usernamecontroller,
                                    //   autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: HexColor("#0070BF"),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "johndoe123",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      prefixIcon: Icon(Icons.person,
                                          size: 16.0,
                                          color: HexColor("#0070BF")),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter name';
                                      }
                                      return null;
                                    },
                                    controller: namecontroller,
                                    //   autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: HexColor("#0070BF"),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "John Doe",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      prefixIcon: Icon(Icons.person,
                                          size: 16.0,
                                          color: HexColor("#0070BF")),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter email';
                                      } else if (!EmailValidator.validate(
                                          value)) {
                                        return 'Please Enter a Valid email';
                                      }
                                      return null;
                                    },

                                    controller: emailcontroller,
                                    //  autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      //hintText: "••••••••••••••••••",
                                      hintText: "Johndoe123@gmail.com",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      // suffixIcon: Icon(Icons.visibility_off,
                                      //     size: 16.0, color: HexColor("#0070BF")),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 16.0,
                                        color: HexColor("#0070BF"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Number",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter number';
                                      }
                                      return null;
                                    },
                                    controller: numbercontroller,
                                    //   autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: HexColor("#0070BF"),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "+92-312-5233215",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      prefixIcon: Icon(Icons.phone_android,
                                          size: 16.0,
                                          color: HexColor("#0070BF")),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Date of Birth",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(1950, 1, 1),
                                          maxTime: DateTime(2022, 12, 31),
                                          theme: DatePickerTheme(
                                              headerColor: Colors.white,
                                              backgroundColor: Colors.blue,
                                              itemStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              doneStyle: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16)),
                                          /*, onChanged: (date) {
                                        print('change $date in time zone ' +
                                            date.timeZoneOffset.inHours.toString());
                                          }*/
                                          onConfirm: (date) {
                                        setState(() {
                                          dobcontroller.text =
                                              '${date.day}-${date.month}-${date.year}';
                                        });
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter date of birth';
                                        }
                                        return null;
                                      },
                                      controller: dobcontroller,
                                      //   autofocus: true,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                      cursorColor: HexColor("#0070BF"),
                                      decoration: InputDecoration(
                                          errorStyle:
                                              TextStyle(color: Colors.red),
                                          enabled: false,
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(
                                          //       color: Colors.blue, width: 1.0),
                                          // ),
                                          hintText: "14-04-1998",
                                          hintStyle:
                                              TextStyle(color: Colors.white54),
                                          prefixIcon: Icon(
                                              Icons.calendar_today_outlined,
                                              size: 16.0,
                                              color: HexColor("#0070BF"))),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Experience",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your experience';
                                      }
                                      return null;
                                    },
                                    controller: experiencecontroller,
                                    //   autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: HexColor("#0070BF"),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "Mention Your Experience ",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      prefixIcon: Icon(Icons.work_outlined,
                                          size: 16.0,
                                          color: HexColor("#0070BF")),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Category",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  DropdownButtonFormField<Category>(
                                    value: selectedCategory,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select Category';
                                      }
                                      return null;
                                    },
                                    icon: Icon(Icons.arrow_circle_down,
                                        color: HexColor("#0070BF")),
                                    iconSize: 26,
                                    /* hint: Text('Select',
                                        style: TextStyle(color: Colors.white54)),*/
                                    elevation: 16,
                                    isExpanded: true,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "Select ",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      //     prefixIcon: Icon(Icons.work_outlined,
                                      //       size: 16.0, color: HexColor("#0070BF")),
                                    ),

                                    /* underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),*/
                                    dropdownColor: CoColors.lightblue,
                                    onChanged: (Category newValue) {
                                      setState(() {
                                        selectedCategory = newValue;
                                      });
                                    },
                                    items: categoryList
                                        .map<DropdownMenuItem<Category>>(
                                            (Category value) {
                                      return DropdownMenuItem<Category>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Monthly Fee",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your price';
                                      }
                                      return null;
                                    },
                                    controller: pricecontroller,
                                    //   autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: HexColor("#0070BF"),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.blue, width: 1.0),
                                      // ),
                                      hintText: "\$100 per month",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      prefixIcon: Icon(Icons.attach_money,
                                          size: 16.0,
                                          color: HexColor("#0070BF")),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Certificate",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      _getFromGalleryCertificate();
                                    },
                                    child: TextFormField(
                                      controller: certificatecontroller,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please upload certificate';
                                        }
                                        return null;
                                      },
                                      //   autofocus: true,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                      cursorColor: HexColor("#0070BF"),
                                      decoration: InputDecoration(
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        enabled: false,
                                        //false kiya huba hai tou wpork kya krna isne pagal
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0),
                                        ),
                                        // focusedBorder: UnderlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //       color: Colors.blue, width: 1.0),
                                        // ),
                                        hintText: "Upload Certificate ",
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                        prefixIcon: Icon(
                                            Icons.brightness_5_rounded,
                                            size: 16.0,
                                            color: HexColor("#0070BF")),
                                        suffixIcon: Container(
                                          margin: EdgeInsets.only(bottom: 5.0),
                                          child: ButtonTheme(
                                            minWidth: 90.0,
                                            height: 20.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          HexColor("#0070BF"))),
                                              color: HexColor("#0070BF"),
                                              textColor: Colors.white,
                                              padding: EdgeInsets.all(4.0),
                                              splashColor: Colors.blueAccent,
                                              onPressed: () {},
                                              child: Text(
                                                "Upload",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
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
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
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
                                                    color: HexColor("#0070BF")),
                                              )
                                            : Container(
                                                width: 16.0,
                                                height: 16.0,
                                                child: Icon(Icons.visibility,
                                                    size: 16.0,
                                                    color: HexColor("#0070BF")),
                                              ),
                                      ),

                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 16.0,
                                        color: HexColor("#0070BF"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Confirm Password",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0),
                                      )),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Re-Enter New Password";
                                      } else if (value.length < 8) {
                                        return "Password must be atleast 8 characters long";
                                      } else if (value !=
                                          passwordcontroller.text) {
                                        return "Password must be same as above";
                                      } else {
                                        return null;
                                      }
                                    },

                                    obscureText: obscureText,
                                    //  autofocus: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
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
                                                    color: HexColor("#0070BF")),
                                              )
                                            : Container(
                                                width: 16.0,
                                                height: 16.0,
                                                child: Icon(Icons.visibility,
                                                    size: 16.0,
                                                    color: HexColor("#0070BF")),
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
                                    height: 10.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: MaterialButton(
                                      minWidth: 400.0,
                                      height: 40.0,
                                      color: HexColor("#0070BF"),
                                      elevation: 15.0,
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        String username =
                                            usernamecontroller.text;
                                        String name = namecontroller.text;
                                        String email = emailcontroller.text;
                                        String number = numbercontroller.text;
                                        String dob = dobcontroller.text;
                                        String experience =
                                            experiencecontroller.text;
                                        String password =
                                            passwordcontroller.text;
                                        String price = pricecontroller.text;
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            showLoader = true;
                                          });
                                          _scaffoldkey.currentState
                                              .showSnackBar(new SnackBar(
                                                  content: new Text(
                                                      "Processing Data")));
                                          registerCoach(
                                                  username,
                                                  name,
                                                  email,
                                                  number,
                                                  password,
                                                  imProfileBase64,
                                                  dob,
                                                  experience,
                                                  imCertificateBase64,
                                                  price,
                                                  selectedCategory.id
                                                      .toString())
                                              .then((value) => {
                                                    if (value == null)
                                                      {
                                                        _scaffoldkey
                                                            .currentState
                                                            .showSnackBar(new SnackBar(
                                                                content: new Text(
                                                                    "Server Error")))
                                                      }
                                                    else
                                                      {
                                                        if (value is String)
                                                          {
                                                            _scaffoldkey
                                                                .currentState
                                                                .showSnackBar(
                                                                    new SnackBar(
                                                                        content:
                                                                            new Text(value)))
                                                          }
                                                        else
                                                          {
                                                            GlobalValues.user =
                                                                value,
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        SignInAsCoach(
                                                                            ))),
                                                            _scaffoldkey
                                                                .currentState
                                                                .showSnackBar(
                                                                    new SnackBar(
                                                                        content:
                                                                            new Text("Registration successful")))
                                                          }
                                                      },
                                                    setState(() {
                                                      showLoader = false;
                                                    })
                                                  });
                                        } else {
                                          _scaffoldkey.currentState
                                              .showSnackBar(new SnackBar(
                                                  content: new Text(
                                                      "Please complete all fields")));
                                        }
                                        /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Sign_In_As_Coach()),*/
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 1)),
                                      minWidth: 400.0,
                                      height: 40.0,
                                      color: Colors.black,
                                      elevation: 15.0,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "ALREADY HAVE AN ACCOUNT ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "LOGIN",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: HexColor('#0070BF')),
                                              ),
                                            ]),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInAsClient()),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              )),
                        ],
                      )),
                ),
              ),
            ),
            Visibility(
                visible: showLoader,
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

  _getFromGalleryCertificate() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        certificatecontroller.text = imageFile.path.split('/').last;
        imCertificateBase64 = base64Encode(imageFile.readAsBytesSync());
      });
    }
  }

  _getFromGalleryProfile() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        imProfileBase64 = base64Encode(image.readAsBytesSync());
        print(imProfileBase64);
      });
    }
  }
}
