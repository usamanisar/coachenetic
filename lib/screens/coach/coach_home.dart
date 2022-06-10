import 'package:carousel_pro/carousel_pro.dart';
import 'package:coach_netic/Calculations/Calculation.dart';
import 'package:coach_netic/global.dart';
import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/screens/chat_ui/chat_home.dart';
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:coach_netic/screens/client_gallery.dart';
import 'package:coach_netic/screens/coach_profile_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;
import '../about_app.dart';
import '../client_program_workout.dart';
import '../client_settings.dart';
import '../coach_earnings.dart';
import '../coach_order.dart';
import '../coach_payments.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CoachHome extends StatefulWidget {
  User user;

  CoachHome({this.user});

  @override
  _CoachHomeState createState() => _CoachHomeState();
}

class _CoachHomeState extends State<CoachHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Builder(builder: (co5ntext) {
              return Column(
                children: [
                  Container(
                   // height: MediaQuery.of(context).size.height/,
                    color: HexColor('#141425'),
                    child: Column(
                      children: [
                        // SizedBox(
                         // height: 10,
                        //),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 10.0, right: 15.0) ,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Image.asset(
                                  'assets/logo.png',
                                  width: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'assets/grid.png',
                                  height: 20,
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  Scaffold.of(co5ntext).openEndDrawer();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: Container(
                  //       margin: EdgeInsets.all(10.0),
                  //      // height: 200,
                  //       decoration: new BoxDecoration(
                  //         //  color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
                  //           borderRadius: new BorderRadius.only(
                  //               bottomLeft: const Radius.circular(40.0),
                  //               bottomRight: const Radius.circular(50.0))),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //         child: Carousel(
                  //           boxFit: BoxFit.cover,
                  //           images: [
                  //             AssetImage('assets/girl.png'),
                  //             AssetImage('assets/girl.png'),
                  //             AssetImage('assets/girl.png'),
                  //           ],
                  //           autoplay: true,
                  //           indicatorBgPadding: 1.0,
                  //           dotColor: Colors.white,
                  //           dotSize: 8.0,
                  //         ),
                  //       )),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalculationScreen()));
                            },
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: HexColor('#043D69'),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40.0),
                                            bottomRight: Radius.circular(40.0),
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0)),
                                        color: HexColor('#025694')),
                                    child: Image.asset(
                                      'assets/calculator.png',
                                      color: Colors.white,
                                      height: 30,
                                      width: 30,
                                    )),
                                Spacer(),
                                Hero(
                                  tag: 'Calculation',
                                  child: AutoSizeText(
                                    'Calculations',
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                    minFontSize: 14.0,
                                    maxFontSize: 17,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            bottomLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                        color: HexColor('##025694')),
                                    child: Image.asset(
                                      'assets/roundarrow.png',
                                      color: Colors.white,
                                      height: 25,
                                      width: 25,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: HexColor('#043D69'),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      color: HexColor('#025694')),
                                  child: Image.asset(
                                    'assets/lunges.png',
                                    color: Colors.white,
                                    height: 30,
                                    width: 30,
                                  )),
                              Spacer(),
                              AutoSizeText(
                                'Programs',
                                style: TextStyle(
                                  color: Colors.white,

                                ),
                                minFontSize: 14.0,
                                maxFontSize: 17,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: HexColor('##025694')),
                                  child: Text(
                                    '5',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 22),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoachPayments()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: HexColor('#043D69'),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40.0),
                                            bottomRight: Radius.circular(40.0),
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0)),
                                        color: HexColor('#025694')),
                                    child: Image.asset(
                                      'assets/creditcard.png',
                                      color: Colors.white,
                                      height: 30,
                                      width: 30,
                                    )),
                                Spacer(),
                                AutoSizeText(
                                  'Payments',
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                  minFontSize: 14.0,
                                  maxFontSize: 17,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(),
                                Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            bottomLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                        color: HexColor('##025694')),
                                    child: Text(
                                      '\$100',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: HexColor('#043D69'),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      color: HexColor('#025694')),
                                  child: Image.asset(
                                    'assets/comment.png',
                                    color: Colors.white,
                                    height: 30,
                                    width: 30,
                                  )),
                              Spacer(),
                              AutoSizeText(
                                'Reviews',
                                style:TextStyle(
                                  color: Colors.white,

                                ),
                                minFontSize: 14.0,
                                maxFontSize: 17,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: HexColor('##025694')),
                                  child: AutoSizeText(
                                    '5K',
                                    style:
                                    TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              );
            }),
            endDrawer: Drawer(
              child: Container(
                color: Colors.black,
                child: Column(children: [
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/gymnew.jpg',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                //  color: Colors.white,
                                  child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: Icon(Icons.arrow_back_ios_sharp, size: 25.0,color: Colors.black,),)
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Client_Setting()));
                              },
                              child: Image.asset(
                                'assets/settings.png',
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(top: 170),
                        height: 40,
                        color: HexColor('#141425'),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            // GlobalValues.user.name,
                            'John Dohn',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),),
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 20.0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          child: Image.asset(
                            'assets/bg.png',
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoachProfile()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: HexColor('#016BB8'),
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0))),
                      child: Text(
                        'My Profile',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/home.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Text(
                                'Home',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/order.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoachOrders()));
                            },
                            child: Container(
                              child: Text(
                                'My Orders',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Chat_Home_Page()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 15.0),
                                child: Image.asset(
                                  'assets/chat.png',
                                  height: 25,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Chat List',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/history.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoachPayment()));
                            },
                            child: Container(
                              child: Text(
                                'Earning History',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Client_Gallery()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding:
                                const EdgeInsets.only(left: 25.0, right: 22.0),
                                child: Image.asset(
                                  'assets/gallery.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Gallery',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Program_Workout()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, right: 15.0),
                                child: Image.asset(
                                  'assets/program.png',
                                  height: 25,
                                  fit: BoxFit.fill,
                                )),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Program_Workout()));
                              },
                              child: Container(
                                child: Text(
                                  'Program',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/share.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          Text(
                            'Share',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/about.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => About_App()));
                            },
                            child: Container(
                              child: Text(
                                'About App',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15.0),
                              child: Image.asset(
                                'assets/logout.png',
                                height: 25,
                                fit: BoxFit.fill,
                              )),
                          GestureDetector(
                            onTap: () async{
                              SharedPreferences prefs =  await SharedPreferences.getInstance();
                              prefs.remove('email');
                              prefs.remove('password');
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInAsClient()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: HexColor('#016BB8'),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              child: Text(
                                'Log out',
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
