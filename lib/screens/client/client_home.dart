import 'dart:math' as math;
import 'dart:ui';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:coach_netic/API/userGetCoachesApi.dart';
import 'package:coach_netic/API/userSearchCoachesApi.dart';
import 'package:coach_netic/models/coach.dart';
import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/screens/about_app.dart';
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:coach_netic/screens/client_settings.dart';
import 'package:coach_netic/screens/coach_details.dart';
import 'package:coach_netic/screens/coach_filter.dart';
import 'package:coach_netic/Calculations/Calculation.dart';
import 'package:coach_netic/screens/chat_ui/chat_home.dart';
import 'package:coach_netic/screens/client_program_workout.dart';
import 'package:coach_netic/screens/client_profile.dart';
import 'package:coach_netic/screens/my_coaches.dart';
import 'package:coach_netic/screens/privacy_policies.dart';
import 'package:coach_netic/screens/term_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ClientHome(),
    );
  }
}

class ClientHome extends StatefulWidget {
  final User user;

  ClientHome({this.user});

  @override
  _ClientHomeState createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  TextEditingController searchcontroller = new TextEditingController();
  List<Coach> listofcoaches = [];

  List<String> suggestions = [];

  List<String> coach_Images_List = [
    'assets/coach_image_1.png',
    'assets/coach_image_5.png',
    'assets/coach_image_3.png',
    'assets/coach_image_4.png',
    'assets/coach_image_5.png',
    'assets/coach_image_1.png',
  ];
  List<String> coach_names_List = [
    'rosemaerry',
    'berkayerdnic',
    'janedoe',
    'emilydoe',
    'janedoe',
    'berkayerdnic',
  ];
  List<String> coach_categories_List = [
    'Cardio',
    'Bootcamp',
    'Yoga',
    'Arial Workout',
    'Barre',
    'HIIT',
  ];
  List<String> coach_rating_List = [
    '4.8',
    '4.7',
    '5.0',
    '4.8',
    '4.2',
    '4.0',
  ];

  List<String> coach_rates_List = [
    '100',
    '150',
    '120',
    '110',
    '120',
    '150',
  ];

  @override
  void initState() {
    // TODO: implement initState
    userGetCoachesDetails().then((value) => setState(() {
          listofcoaches = value;
          suggestions = value.map((e) => e.name).toList();
        }));
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (co5ntext) {
        return SafeArea(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => CoachDashboard()),
                          // );
                          Scaffold.of(co5ntext).openEndDrawer();
                        },
                        child: Image.asset(
                          "assets/grid.png",
                          height: 30.0,
                          width: 25.0,
                        )),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Coach_Filter()),
                          );
                        },
                        child: Image.asset(
                          "assets/filter.png",
                          height: 30.0,
                          width: 20.0,
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  // padding: EdgeInsets.all(20.0),
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: AutoCompleteTextField<String>(
                      controller: searchcontroller,
                      style: TextStyle(color: Colors.white70, fontSize: 16.0),
                      key: new GlobalKey(),
                      submitOnSuggestionTap: true,
                      clearOnSubmit: false,
                      suggestions: suggestions,

                      textInputAction: TextInputAction.search,
                      textChanged: (item) {
                      },
                      itemSubmitted: (item) {
                        setState(() {
                          searchcontroller.text = item;
                        });
                        setState(() {
                          loading = true;
                        });
                        String search = searchcontroller.text;
                        if (search.isEmpty) {
                          userGetCoachesDetails()
                              .then((value) => setState(() {
                            listofcoaches = value;
                            loading = false;
                          }));
                        } else {
                          userSearchCoachesDetails(search)
                              .then((value) => setState(() {
                            listofcoaches = value;
                            loading = false;
                          }));
                        }
                      },
                      itemBuilder: (context, item) {
                        return new Padding(
                            padding: EdgeInsets.all(8.0),
                            child: new Text(item));
                      },
                      itemSorter: (a, b) {
                        return a.compareTo(b);
                      },
                      itemFilter: (item, query) {
                        return item.toLowerCase().startsWith(query);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: HexColor("#080812"),
                        filled: true,

                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Colors.blue, width: 1.0),
                        // ),
                        hintText: "   Search Coaches Here...",
                        hintStyle: TextStyle(color: Colors.white54),
                        suffixIcon: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor("#0070BF"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            // color: HexColor("#0070BF"),
                            child: Icon(Icons.search,
                                size: 24.0, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            String search = searchcontroller.text;
                            if (search.isEmpty) {
                              userGetCoachesDetails()
                                  .then((value) => setState(() {
                                        listofcoaches = value;
                                        loading = false;
                                      }));
                            } else {
                              userSearchCoachesDetails(search)
                                  .then((value) => setState(() {
                                        listofcoaches = value;
                                        loading = false;
                                      }));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            itemCount: listofcoaches.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CoachDetails(coach: listofcoaches.elementAt(index))),
                                  );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        backgroundBlendMode: BlendMode.darken,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "http://coach.stackbuffers.com/public/uploads/images/" +
                                                    listofcoaches[index].image),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          child: Text(
                                            "@${listofcoaches[index].username}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 8.0),
                                        ),
                                        Padding(
                                            child: Text(
                                              "${listofcoaches[index].name}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 2.0)),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                ("assets/star.png"),
                                                height: 18.0,
                                              ),
                                              Text(
                                                  "${listofcoaches[index].reviews} (${listofcoaches[index].rating}+)",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0)),
                                              Spacer(),
                                              ButtonTheme(
                                                minWidth: 50.0,
                                                height: 20.0,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: HexColor(
                                                              "#0070BF"))),
                                                  color: HexColor("#0070BF"),
                                                  textColor: Colors.white,
                                                  padding: EdgeInsets.all(2.0),
                                                  splashColor:
                                                      Colors.blueAccent,
                                                  onPressed: () {
                                                    setState(() {
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(builder: (context) => Sign_In_As_Coach()),
                                                      // );
                                                    });
                                                  },
                                                  child: Text(
                                                    '${listofcoaches[index].price}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                            staggeredTileBuilder: (index) {
                              return new StaggeredTile.count(
                                  1, index.isEven ? 1.4 : 1.7);
                            }),
                      ),
                      Visibility(
                          visible: loading,
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
              ],
            ),
          ),
        );
      }),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   height: 70,
                            //   width: 50,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: Colors.white,
                            //   ),
                            //   child: Icon(
                            //     Icons.settings,
                            //     size: 35,
                            //     color: HexColor('#016BB8'),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  //  color: Colors.white,
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Icon(
                                      Icons.arrow_back_ios_sharp,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Client_Setting()));
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
                          padding:
                              const EdgeInsets.only(left: 50.0, bottom: 6.0),
                          child: Text(
                            'Name',
                            // "GlobalValues.user.name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
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
                              builder: (context) => ClientProfile()));
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
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/home.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientHome()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/order.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'My Coaches',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => My_Coaches()),
                          );
                        },
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
                                    left: 25.0, right: 22.0),
                                child: Image.asset(
                                  'assets/chat.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Chat List',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
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
                                builder: (context) => CalculationScreen()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/calculator.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Calculations',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
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
                                builder: (context) => Program_Workout()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/program.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Program',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
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
                                builder: (context) => Privacy_Policies()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 24.0),
                                child: Image.asset(
                                  'assets/privacy_policy.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Privacy Policies',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
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
                                builder: (context) => Term_Conditions()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/term_conditions.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'Terms and Conditions',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
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
                                builder: (context) => About_App()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 22.0),
                                child: Image.asset(
                                  'assets/about.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              'About App',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('email');
                          prefs.remove('password');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInAsClient()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Image.asset(
                                  'assets/logout.png',
                                  height: 22,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: HexColor('#016BB8'),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
