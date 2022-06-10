import 'package:coach_netic/Calculations/Calculation.dart';
import 'package:coach_netic/screens/chat_ui/chat_home.dart';
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:coach_netic/screens/client_gallery.dart';
import 'package:coach_netic/screens/client_program_workout.dart';
import 'package:coach_netic/screens/client_settings.dart';
import 'package:coach_netic/screens/my_coaches.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'client/client_bottom_bar.dart';
import 'client/client_home.dart';
 class Coach_Side_Bar extends StatefulWidget {
   @override
   _Coach_Side_BarState createState() => _Coach_Side_BarState();
 }

 class _Coach_Side_BarState extends State<Coach_Side_Bar> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(

       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,


       child:  Container(
         color: Colors.black,
         child: Column(
           children: [
             Stack(
               children: <Widget>[
                 Image.asset(
                   'assets/gym.jpg',
                   width: MediaQuery.of(context).size.width,
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       GestureDetector(
                         child: Image.asset(
                           'assets/settings.png',
                           height: 60,
                           fit: BoxFit.fill,
                         ),
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Client_Setting()));
                         },
                       ),

                       SizedBox(
                         width: 10,
                       )
                     ],
                   ),
                 ),
                 Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
                   height: 50,
                   color: HexColor('#141425'),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 15.0),
                     child: Text(
                       'John Doe',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 25,
                       ),
                     ),
                   ),
                 ),
                 Container(
                   color: Colors.black,
                   padding: EdgeInsets.only(left:5.0, right: 5.0, bottom: 5.0, top:10.0),
                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4.5),
                   child: Column(
                     children: <Widget>[
                       Container(
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
                       SizedBox(
                         height: 30,
                       ),
                       GestureDetector(
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
                                 child: Image.asset(
                                   'assets/home.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'Home',
                               style: TextStyle(color: Colors.white, fontSize: 20),
                             )
                           ],
                         ),
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ClientBottomBar()),
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
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
                                 child: Image.asset(
                                   'assets/order.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'My Coaches',
                               style: TextStyle(color: Colors.white, fontSize: 20),
                             )
                           ],
                         ),
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => My_Coaches()),
                           );
                         },
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Chat_Home_Page()),
                           );
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 22.0),
                                 child: Image.asset(
                                   'assets/chat.png',
                                   height: 22,
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
                       GestureDetector(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => CalculationScreen()),
                           );
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
                                 child: Image.asset(
                                   'assets/calculator.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'Calculations',
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
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
                                 child: Image.asset(
                                   'assets/program.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'Program',
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
                           // Navigator.push(
                           //   context,
                           //   MaterialPageRoute(builder: (context) => CalculationScreen()),
                           // );
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 24.0),
                                 child: Image.asset(
                                   'assets/privacy_policy.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'Privacy Policies',
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
                           // Navigator.push(
                           //   context,
                           //   MaterialPageRoute(builder: (context) => CalculationScreen()),
                           // );
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
                                 child: Image.asset(
                                   'assets/term_conditions.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'Terms and Conditions',
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
                           //
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 22.0),
                                 child: Image.asset(
                                   'assets/about.png',
                                   height: 22,
                                   fit: BoxFit.fill,
                                 )),
                             Text(
                               'About App',
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
                             MaterialPageRoute(builder: (context) => SignInAsClient()),
                           );
                         },
                         child: Row(
                           children: <Widget>[
                             Padding(
                                 padding:
                                 const EdgeInsets.only(left: 25.0, right: 25.0),
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
                                 style: TextStyle(color: Colors.white, fontSize: 17),
                               ),
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/8, left:  MediaQuery.of(context).size.width/18),
                   height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black, width: 5),
                     shape: BoxShape.circle,
                   ),
                   child: CircleAvatar(
                     radius: 70,
                     backgroundColor: Colors.white,
                     child: ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(40.0)),
                       child: Image.asset(
                         'assets/bg.png',
                       ),
                     ),
                   ),
                 )
               ],
             ),
             // Column(
             //   children: <Widget>[
             //     Container(
             //       padding: EdgeInsets.all(5.0),
             //       decoration: BoxDecoration(
             //           color: HexColor('#016BB8'),
             //           borderRadius:
             //           BorderRadius.all(Radius.circular(25.0))),
             //       child: Text(
             //         'My Profile',
             //         style: TextStyle(color: Colors.white, fontSize: 14),
             //       ),
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/home.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'Home',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/order.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'My Orders',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     GestureDetector(
             //       onTap: (){
             //         Navigator.push(
             //           context,
             //           MaterialPageRoute(builder: (context) => Chat_Home_Page()),
             //         );
             //       },
             //       child: Row(
             //         children: <Widget>[
             //           Padding(
             //               padding:
             //               const EdgeInsets.only(left: 25.0, right: 15.0),
             //               child: Image.asset(
             //                 'assets/chat.png',
             //                 height: 25,
             //                 fit: BoxFit.fill,
             //               )),
             //           Text(
             //             'Chat List',
             //             style: TextStyle(color: Colors.white, fontSize: 20),
             //           )
             //         ],
             //       ),
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/history.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'Earning History',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/program.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'Program',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/share.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'Share',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/about.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Text(
             //           'About App',
             //           style: TextStyle(color: Colors.white, fontSize: 20),
             //         )
             //       ],
             //     ),
             //     SizedBox(
             //       height: 20,
             //     ),
             //     Row(
             //       children: <Widget>[
             //         Padding(
             //             padding:
             //             const EdgeInsets.only(left: 25.0, right: 15.0),
             //             child: Image.asset(
             //               'assets/logout.png',
             //               height: 25,
             //               fit: BoxFit.fill,
             //             )),
             //         Container(
             //           padding: EdgeInsets.all(5.0),
             //           decoration: BoxDecoration(
             //               color: HexColor('#016BB8'),
             //               borderRadius:
             //               BorderRadius.all(Radius.circular(10.0))),
             //           child: Text(
             //             'Log out',
             //             style: TextStyle(color: Colors.white, fontSize: 17),
             //           ),
             //         )
             //       ],
             //     ),
             //   ],
             // )
           ],
         ),
       ),
       )
     );
   }
 }
 

