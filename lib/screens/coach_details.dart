import 'package:auto_size_text/auto_size_text.dart';
import 'package:coach_netic/API/userCoachDetailApi.dart';
import 'package:coach_netic/models/coach.dart';
import 'package:coach_netic/screens/certificate.dart';
import 'package:coach_netic/screens/chat_ui/chat_detail_page.dart';
import 'package:coach_netic/screens/coach_hire_me.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

class CoachDetails extends StatefulWidget {
  final Coach coach;

  CoachDetails({@required this.coach});

  @override
  _CoachDetailsState createState() => _CoachDetailsState();
}

class _CoachDetailsState extends State<CoachDetails> {




  String desc =
      "The education and training required for fitness trainers and instructors varies by type of specialty, and employers prefer to hire those with certification.Personal fitness trainers, group fitness instructors, and specialized fitness instructors each need different preparation. Requirements also vary by facility.";
  List<String> clients_names = ["John Smith", "Sandal", "Hannah"];
  List<String> clients_stars = [
    "assets/5_stars.png",
    "assets/4_stars.png",
    "assets/3_stars.png"
  ];
  List<String> clients_pictures = [
    "assets/client_1.png",
    "assets/client_2.png",
    "assets/client_3.png"
  ];

  List<String> clients_remarks = [
    "This guy is phenomal, he made me do the whole body workout without pushing to hard, but i feel next day.",
    "She had a good variety of exercise for me and went through each with me.",
    "Great experience.. i am out of shape senior and i was very surprised to feel benefit, after one session."
  ];
  List<String> clients_name_colors = ["#FFFF00", "#00FFFF", "#FF0000"];
  var price = 100;


  @override
  void initState() {

    UserCoachDetailApi().getUserCoachDetail(4).then((value) => {
      print(value.coach.toJson())
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
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
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black38.withOpacity(0.5), BlendMode.darken),
                      image: AssetImage("assets/coach_details_bg.png"),
                      // fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 43.0,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      child: Image.asset("assets/coach_1.png"),
                                      radius: 41.0,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      widget.coach.name ?? "Anonymous",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.white),
                                      textAlign: TextAlign.start,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Cardio",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "\$${price}",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '  Per Month',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            )
                                          ]),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/facebook_logo.png",
                                          scale: 15,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Image.asset(
                                          "assets/insta_logo.png",
                                          scale: 9,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Image.asset(
                                          "assets/twitter_logo.png",
                                          scale: 15,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Image.asset(
                                    "assets/star.png",
                                    width: 15.0,
                                    // height: 15.0,
                                  ),
                                  Text(
                                    "4.8 (120+) ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  ButtonTheme(
                                    minWidth: 50.0,
                                    height: 20.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      color: HexColor("#0070BF"),
                                      textColor: Colors.white,
                                      disabledColor: Colors.black26,
                                      disabledTextColor: Colors.white30,
                                      padding: EdgeInsets.all(4.0),
                                      splashColor: Colors.blueAccent,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Coach_Hire()));
                                      },
                                      child: Text(
                                        "HIRE ME",
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ButtonTheme(
                                minWidth: 70.0,
                                height: 25.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  disabledColor: Colors.black26,
                                  disabledTextColor: Colors.white30,
                                  padding: EdgeInsets.all(4.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Certificate()),
                                    );
                                  },
                                  child: Text(
                                    "Certificate",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              ButtonTheme(
                                minWidth: 70.0,
                                height: 25.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  disabledColor: Colors.black26,
                                  disabledTextColor: Colors.white30,
                                  padding: EdgeInsets.all(4.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatDetailPage()),
                                    );
                                  },
                                  child: Text(
                                    "Message",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              ButtonTheme(
                                minWidth: 70.0,
                                height: 25.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  disabledColor: Colors.black26,
                                  disabledTextColor: Colors.white30,
                                  padding: EdgeInsets.all(4.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatDetailPage()),
                                    );
                                  },
                                  child: Text(
                                    "Gallery",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.black,
              ),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              padding: EdgeInsets.only(
                  right: 15.0, left: 12.0, top: 5.0, bottom: 5.0),
              width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height / 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width / 7.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: Colors.white),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "Descriptions",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none),
                        minFontSize: 12.0,
                      ),
                    ),
                  ),
                  Container(
                    //  padding: EdgeInsets.all(.0),
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: HexColor("#080812"),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          desc,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14.0,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  /* Container(
                    height: MediaQuery.of(context).size.width / 7.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: HexColor("#0070BF")),
                      color: HexColor("#0070BF"),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "Gallery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none),
                        minFontSize: 12.0,
                      ),
                    ),
                  ),*/
                  Container(
                    height: MediaQuery.of(context).size.width / 7.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: HexColor("#0070BF")),
                      color: HexColor("#0070BF"),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "Clients Reviews",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none),
                        minFontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: clients_names.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return new Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 1.0),
                            alignment: Alignment.topCenter,
                            // color: Colors.grey,
                            //  padding: EdgeInsets.all(.0),
                            //height: MediaQuery.of(context).size.width / 4.5,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: HexColor("#080812"),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0,
                                      right: 5.0,
                                      left: 5.0,
                                      bottom: 1),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          //  border: Border.all(),
                                          image: new DecorationImage(
                                            image: new AssetImage(
                                                clients_pictures[index]),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.black,
                                        ),
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(clients_names[index],
                                                    style: TextStyle(
                                                        color: HexColor(
                                                            clients_name_colors[
                                                                index]),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Spacer(),
                                                Image.asset(
                                                  clients_stars[index],
                                                  height: 15.0,
                                                ),
                                              ],
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 2.0, bottom: 2.0),
                                                child:
                                                    Text(clients_remarks[index],
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  )),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(color: Colors.white70, fontSize: 16.0),
                      cursorColor: Colors.white,
                      showCursor: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: HexColor("#080812"),
                        filled: true,

                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Colors.blue, width: 1.0),
                        // ),
                        hintText: "   Type Reviews Here...",
                        hintStyle: TextStyle(color: Colors.white54),
                        suffixIcon: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor("#0070BF"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            // color: HexColor("#0070BF"),
                            child: Transform.rotate(
                              angle: 75,
                              child: Icon(Icons.send,
                                  size: 20.0, color: Colors.white),
                            ),
                          ),
                          onTap: () {
                            //
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
