import 'package:coach_netic/screens/thank_you_hiring.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Coach_Hire extends StatefulWidget {
  @override
  _Coach_HireState createState() => _Coach_HireState();
}

class _Coach_HireState extends State<Coach_Hire> {
  var rate = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomPadding: false,
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.only(left:20.0, right: 20.0, top: MediaQuery.of(context).size.width/5),
          width: MediaQuery
          .of(context).size.width,
           height: MediaQuery
            .of(context).size.height,
          color: Colors.black,

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
            //  direction: Axis.vertical,
              children: [
                Container(
                    height: MediaQuery.of(context).size.width / 6,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10.0, bottom: 8.0) ,
                    padding:EdgeInsets.all(12.0) ,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: HexColor("#0070BF").withOpacity(0.4),
                    ),
                  child: Row(
                    children: [
                      Image.asset("assets/circular_done.png", width: 25.0, height: 25.0,),
                      Text("   MONTHLY", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                      Spacer(),
                      Text("\$${rate}", style: TextStyle(fontSize: 16.0, color: Colors.white), textAlign: TextAlign.right,),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                 // padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: Text("Fill the details carefully. After payment you will able to join the course.", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    //   autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    cursorColor: HexColor("#0070BF"),

                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(

                            color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Colors.blue, width: 1.0),
                      // ),
                      hintText: "Name on Card ",
                      hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    //   autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    cursorColor: HexColor("#0070BF"),

                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(

                            color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Colors.blue, width: 1.0),
                      // ),
                      hintText: "Card Number ",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  children: [
                   Container(
                     width:  MediaQuery.of(context).size.width/2.5,
                     child: Padding(

                        padding: EdgeInsets.symmetric(vertical: 20.0,),
                        child: TextField(
                          //   autofocus: true,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                          cursorColor: HexColor("#0070BF"),

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderSide: BorderSide(


                                  color: Colors.white, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                            // focusedBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Colors.blue, width: 1.0),
                            // ),
                            hintText: "MM ",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                   ),
                    Spacer(),
                    Container(
                      width:  MediaQuery.of(context).size.width/2.5,
                      child: Container(

                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextField(
                          //   autofocus: true,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                          cursorColor: HexColor("#0070BF"),

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                            ),  border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(

                              borderSide: BorderSide(

                                  color: Colors.white, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                            // focusedBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Colors.blue, width: 1.0),
                            // ),
                            hintText: "YY",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    //   autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    cursorColor: HexColor("#0070BF"),

                    decoration: InputDecoration(

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(

                            color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Colors.blue, width: 1.0),
                      // ),
                      hintText: "Security Code ",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    //   autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    cursorColor: HexColor("#0070BF"),

                    decoration: InputDecoration(
                     // border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#0070BF"), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(

                            color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: EdgeInsets.only(top:8, bottom: 8.0, left: 15),

                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Colors.blue, width: 1.0),
                      // ),
                      hintText: "Zip / Postal Code ",
                      hintStyle: TextStyle(color: Colors.white54),

                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),SizedBox(height: 30.0,),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.only(top:20.0),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width, //  400.0,
                    height: 40.0,
                    color: HexColor("#0070BF"),
                    elevation: 15.0,
                    child: Text("PAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                         // side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Thank_You()));
                    },
                  ),
                ),


              ],
            ),
          )
        ),
      ),
    );
  }
}
