
import 'package:coach_netic/screens/client/sign_in_as_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Thank_You extends StatefulWidget {
  @override
  _Thank_YouState createState() => _Thank_YouState();
}

class _Thank_YouState extends State<Thank_You> {
  @override
  Widget build(BuildContext context) {
    String coach_name = " Rose Marry";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width/3,
                        margin: EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height/7),
                        child: Image.asset("assets/logo.png" ,)),
                     Stack(
                       children: [
                         Column(
                           children: [
                             Container(height: 50,),

                             Container(
                               //  height: MediaQuery.of(context).size.height/2,
                               width: MediaQuery.of(context).size.width,
                               padding: EdgeInsets.only( bottom: 8.0,top: 50),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0) ,topRight: Radius.circular(50.0)),
                                 // border: Border.all(color: Colors.white),
                                 color: HexColor("151522"),
                               ),
                               child: Container(
                                 padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                 child: Column(

                                   children: [
                                     AutoSizeText(coach_name, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.none), minFontSize: 18, ),
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: AutoSizeText("Thank You For Hiring Me", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.none), minFontSize: 14,),
                                     ),
                                     AutoSizeText("Your health and wealth is top of my priority, and i want to be sure that the fitness coach you choose is right for you. ", style: TextStyle(color: Colors.white,fontSize: 12.0, decoration: TextDecoration.none), textAlign: TextAlign.center, maxLines: 3, ),
                                     SizedBox(height: 50.0,),
                                     Container(
                                       margin: EdgeInsets.only(bottom: 10.0),
                                       padding: EdgeInsets.only(top:20.0),
                                       child: MaterialButton(
                                         minWidth: MediaQuery.of(context).size.width, //  400.0,
                                         height: 40.0,
                                         color: HexColor("#0070BF"),
                                         elevation: 15.0,
                                         child: Text("FINISH",
                                           style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 18.0,
                                           ),
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(8.0)),
                                         // side: BorderSide(color: Colors.red)),
                                         onPressed: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => SignInAsClient()));
                                         },
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Align(
                           alignment: Alignment.topCenter,
                           child: Container(
                             color: Colors.transparent,
                             height: 100,
                             child:  Center(
                               child: CircleAvatar(
                                 radius: 50.0,
                                 backgroundColor: Colors.white,
                                 child: CircleAvatar(
                                   radius: 48.0,
                                   backgroundColor: Colors.black,
                                   child: CircleAvatar(
                                     child: Image.asset("assets/coach_1.png"),
                                     radius: 46.0,
                                     backgroundColor: Colors.black,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),




                  ],
                ),
          ),
        ),

    );
  }
}
