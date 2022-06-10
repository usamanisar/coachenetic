import 'dart:io';
import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:coach_netic/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:coach_netic/models/user.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coach_netic/global.dart';
import 'package:coach_netic/API/coachUpdateProfileApi.dart';

class CoachProfile extends StatefulWidget {
  User user;

  CoachProfile({this.user});

  @override
  _CoachProfileState createState() => _CoachProfileState();
}

class _CoachProfileState extends State<CoachProfile> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController dobcontroller = new TextEditingController();
  TextEditingController experiencecontroller = new TextEditingController();
  TextEditingController numbercontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController certificatecontroller = new TextEditingController();
  File imageFile;
  String imCertificateBase64;

  File image;
  String imProfileBase64;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    usernamecontroller.text= GlobalValues.user.username;
    namecontroller.text= GlobalValues.user.name;
    dobcontroller.text= GlobalValues.user.dob.toString();
    experiencecontroller.text= GlobalValues.user.experience;
    numbercontroller.text= GlobalValues.user.phone;
    emailcontroller.text= GlobalValues.user.email;
    certificatecontroller.text= GlobalValues.user.certificate;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: CoColors.lightblue,
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  color: CoColors.lightblue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Text(
                                'My Profile',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                          color: CoColors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0))),
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                            ),
                            Center(
                              child: Text(
                                'Change Profile Picture',
                                style: TextStyle(
                                    color: CoColors.lightblue,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 5.0),
                              child: Text(
                                'User Name',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: CoColors.darkblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter user name';
                                    }
                                    return null;
                                  },
                                  // initialValue:
                                  //     GlobalValues.user.username,
                                  controller: usernamecontroller,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.person_outline_rounded,
                                        color: CoColors.lightblue,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 5.0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: CoColors.darkblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter name';
                                    }
                                    return null;
                                  },
                                  controller: namecontroller,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.person_outline_rounded,
                                        color: CoColors.lightblue,
                                      )),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 5.0),
                                        child: Text(
                                          'Date of Birth',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: CoColors.darkblue,
                                            borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        5.0))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(5.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(
                                                      1950, 1, 1),
                                                  maxTime: DateTime(
                                                      2022, 12, 31),
                                                  theme: DatePickerTheme(
                                                      headerColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          Colors.blue,
                                                      itemStyle: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                          fontSize: 18),
                                                      doneStyle: TextStyle(
                                                          color: Colors
                                                              .black45,
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
                                                  currentTime:
                                                      DateTime.now(),
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
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 16.0),
                                              cursorColor: Colors.white,
                                              decoration: InputDecoration(
                                                  border:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder:
                                                      InputBorder.none,
                                                  prefixIcon: Icon(
                                                    Icons.event,
                                                    color: CoColors
                                                        .lightblue,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 5.0),
                                        child: Text(
                                          'Experience',
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: CoColors.darkblue,
                                            borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        5.0))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(5.0),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter your experience';
                                              }
                                              return null;
                                            },

                                            controller:
                                                experiencecontroller,
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 16.0),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder:
                                                    InputBorder.none,
                                                enabledBorder:
                                                    InputBorder.none,
                                                errorBorder:
                                                    InputBorder.none,
                                                prefixIcon: Icon(
                                                  Icons.all_inbox,
                                                  color:
                                                      CoColors.lightblue,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 5.0),
                              child: Text(
                                'Number',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: CoColors.darkblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter number';
                                    }
                                    return null;
                                  },
                                  controller: numbercontroller,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.phone_android_rounded,
                                        color: CoColors.lightblue,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 5.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: CoColors.darkblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: CoColors.lightblue,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 5.0),
                              child: Text(
                                'Certificate',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: CoColors.darkblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: HexColor(
                                                      '#0070BF'),
                                                  width: 2)),
                                          child: CircularCheckBox(
                                            activeColor:
                                                CoColors.lightblue,
                                            inactiveColor:
                                                CoColors.lightblue,
                                            disabledColor:
                                                CoColors.lightblue,
                                            onChanged: (val) {
                                              setState(() {
                                                selected = !selected;
                                              });
                                            },
                                            value: selected,
                                          )),
                                      Container(
                                        width: 150,
                                        child: GestureDetector(
                                          onTap: () {
                                            _getFromGalleryCertificate();
                                          },
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please upload certificate';
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 16.0),
                                            cursorColor: Colors.white,
                                            controller:
                                                certificatecontroller,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder:
                                                  InputBorder.none,
                                              enabledBorder:
                                                  InputBorder.none,
                                              errorBorder:
                                                  InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 40.0),
                                        padding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            top: 5.0,
                                            bottom: 5.0),
                                        decoration: BoxDecoration(
                                            color: HexColor('#016BB8'),
                                            borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        25.0))),
                                        child: Text(
                                          'Upload',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: CoColors.lightblue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: RaisedButton(
                                color: CoColors.lightblue,
                                child: Text(
                                  'UPDATE',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                onPressed: () {
                                  String username =
                                      usernamecontroller.text;
                                  String name = namecontroller.text;
                                  String dob = dobcontroller.text;
                                  String experience =
                                      experiencecontroller.text;
                                  String number = numbercontroller.text;
                                  String email = emailcontroller.text;

                                  updateCoachProfile(
                                      username,
                                      name,
                                      email,
                                      number,
                                      imProfileBase64,
                                      GlobalValues.user.id.toString(),
                                      dob,
                                      experience,
                                      null,
                                      null,
                                      imCertificateBase64);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 150),
                      height: 110,
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white, width: 5),
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _getFromGalleryProfile();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)),
                                child: image != null
                                    ? Image.file(
                                        File(image.path),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                       getImageFromName(imageName:GlobalValues.user.image),
                                        fit: BoxFit.cover,
                                      ),
                                // Image.asset(
                                // //  'assets/bg.png',
                                //   'GlobalValues.user.image',
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 90, top: 30),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt_sharp,
                                color: Colors.black,
                                size: 20,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
