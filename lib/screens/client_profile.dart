import 'package:coach_netic/colors.dart';
import 'package:flutter/material.dart';

class ClientProfile extends StatefulWidget {
  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {

  int selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
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
              SingleChildScrollView(
                child: Column(
                  children: [
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
                                    'Date of Birth',
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
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.cake_outlined,
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
                                              'Height',
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
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    prefixIcon: Icon(
                                                      Icons.accessibility,
                                                      color:
                                                          CoColors.lightblue,
                                                    )),
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
                                              'Weight',
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
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .only(
                                                              left: 15.0),
                                                      child: ImageIcon(
                                                        AssetImage(
                                                          'assets/scale.png',
                                                        ),
                                                        size: 20,
                                                        color: CoColors
                                                            .lightblue,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder:
                                                              InputBorder
                                                                  .none,
                                                          enabledBorder:
                                                              InputBorder
                                                                  .none,
                                                          errorBorder:
                                                              InputBorder
                                                                  .none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                              'Hip Circumference ',
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
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .only(
                                                              left: 12.0),
                                                      child: ImageIcon(
                                                        AssetImage(
                                                          'assets/belly.png',
                                                        ),
                                                        size: 20,
                                                        color: CoColors
                                                            .lightblue,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                              'Waist Circumference',
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
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .only(
                                                              left: 12.0),
                                                      child: ImageIcon(
                                                        AssetImage(
                                                          'assets/belly.png',
                                                        ),
                                                        size: 20,
                                                        color: CoColors
                                                            .lightblue,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                    'Body Volume Index',
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
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: CoColors.lightblue,
                                          )),
                                    ),
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
                                  child: Text(
                                    'UPDATE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
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
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  child: Image.asset(
                                    'assets/bg.png',
                                    fit: BoxFit.fill,
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
            ],
          ),
        ),
      ),
    );
  }
}
