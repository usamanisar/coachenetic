import 'package:coach_netic/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_hero/local_hero.dart';

import 'BodyFat.dart';
import 'BodyMass.dart';
import 'Calorie.dart';
import 'IdealWeight.dart';
import 'Nutrition.dart';

class CalculationScreen extends StatefulWidget {
  User user;

  CalculationScreen({this.user});

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final controller = PageController();
  int i;
  int selected = 0;
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
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            shadowColor: HexColor('#016BB8'),
            elevation: 1.0,
            backgroundColor: HexColor('#10101E'),
            leading: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_sharp)),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Hero(tag: 'Calculations', child: Text('Calculations')),
            ),
          ),
        ),
        body: LocalHeroScope(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn,
          createRectTween: (begin, end) {
            return RectTween(begin: begin, end: end);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              height: (width / 4) - 20,
                              width: (width / 4) - 20,
                              decoration: BoxDecoration(
                                  color: selected == 0
                                      ? HexColor('#0070BF')
                                      : Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Image.asset(
                                'assets/belly.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(5.0),
                          //   child: Text(
                          //     'Body Fat',
                          //     style: TextStyle(color: Colors.white, fontSize: 12),
                          //   ),
                          // )
                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Body Fat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  selected = 1;
                                });
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              height: (width / 4) - 20,
                              width: (width / 4) - 20,
                              decoration: BoxDecoration(
                                  color: selected == 1
                                      ? HexColor('#0070BF')
                                      : Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Image.asset(
                                'assets/bodymass.png',
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Body Mass Index',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              height: (width / 4) - 20,
                              width: (width / 4) - 20,
                              decoration: BoxDecoration(
                                  color: selected == 2
                                      ? HexColor('#0070BF')
                                      : Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Image.asset(
                                'assets/scale.png',
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Calorie & BMR',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 3;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              height: (width / 4) - 20,
                              width: (width / 4) - 20,
                              decoration: BoxDecoration(
                                  color: selected == 3
                                      ? HexColor('#0070BF')
                                      : Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Image.asset(
                                'assets/machine.png',
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Ideal Weight',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 4;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              height: (width / 4) - 20,
                              width: (width / 4) - 20,
                              decoration: BoxDecoration(
                                  color: selected == 4
                                      ? HexColor('#0070BF')
                                      : Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Image.asset(
                                'assets/nutrition.png',
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Nutritional Needs',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    // SurahScreen(),
                    //    BodyFat(),
                    //SurahScreen(),
                    selected == 0 ? BodyFat() : Container(),
                    selected == 1 ? BodyMass() : Container(),
                    selected == 2 ? CalorieScreen() : Container(),
                    selected == 3 ? IdealWeight() : Container(),
                    selected == 4 ? NutritionScreen() : Container(),
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
