import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class My_Coaches extends StatefulWidget {
  @override
  _My_CoachesState createState() => _My_CoachesState();
}

class _My_CoachesState extends State<My_Coaches> {

  List<String> activeCoachImage = ["assets/coach_image_1.png"];
      List<String> pastCoachImage = ["assets/client_1.png","assets/client_2.png","assets/client_3.png","assets/client_1.png"];
  List<String> activeCoachName = ["Rose Merry"];
  List<String> pastCoachName = ["John Henry", "John Smith", "John Albert", "Chris Micheal"];
  List<String> activeCoachType = ["Cardio"];
  List<String> pastCoachType = ["Bootcamp", "Yoga", "Cardio", "Arial"];
  var rate = 100;
  var orders =120;
  var rating = 4.8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            //  color: Colors.white,
              child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
          ),
        ),
        title: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text("My Coaches", )),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  //  color: HexColor("#0070BF"),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: TextField(
                style: TextStyle(color: Colors.white70, fontSize: 16.0),
                cursorColor: Colors.white70,
                showCursor: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: HexColor("#151520"),
                  //HexColor("#080812"),
                  filled: true,

                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //       color: Colors.blue, width: 1.0),
                  // ),
                  hintText: "   Search Coaches Here...",
                  hintStyle: TextStyle(color: Colors.white54),
                  suffixIcon: GestureDetector(
                    child: Container(
                    //  width: 10.0,
                      decoration: BoxDecoration(
                          color: HexColor("#0070BF"),
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      // color: HexColor("#0070BF"),
                      child: Icon(Icons.search, size: 25.0, color: Colors.white),
                    ),
                    onTap: () {
                      //code here
                    },
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top:25.0),
              child: Text("Active Coach", style: TextStyle(color: Colors.white54, fontSize: 18.0),),
            ),
            Container(
               margin: EdgeInsets.only(top: 6.0, bottom: 1.0),
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
                         bottom: 1.0),
                     alignment: Alignment.topLeft,
                     child: Row(
                       crossAxisAlignment:
                       CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(
                                 Radius.circular(8.0)),
                             //  border: Border.all(),
                             image: new DecorationImage(
                               image: new AssetImage(
                                 activeCoachImage[0] ,),
                               fit: BoxFit.fill,
                             ),
                             color: Colors.black,
                           ),
                           height: 45.0,
                           width: 40.0,
                         ),
                         Expanded(
                           child: Column(
                             children: [
                               Row(
                                 children: [
                                   Text(activeCoachName[0],
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 17.0,
                                       )),
                                   Spacer(),
                                   Container(
                                     margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                     child: Image.asset(
                                       "assets/star.png",
                                       height: 16.0,
                                     ),
                                   ),

                                   Text("$rating ($orders+)",
                                       style: TextStyle(
                                         fontSize: 16.0,
                                         color: Colors.white,
                                       )),
                                 ],
                               ),


                               Row(
                                 children: [
                                   Text(activeCoachType[0],
                                       style: TextStyle(
                                           color: Colors.orange,
                                           fontSize: 13.0)),
                                   Spacer(),
                                   Text("\$$rate Per Month",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 13.0
                                       )),
                                 ],
                               ),

                             ],
                           ),
                         ),
                       ],
                     )),
               ),
             ),


            Container(
              alignment: Alignment.centerLeft,
             margin: const EdgeInsets.only(top:10.0, bottom: 6.0),
              child: Text("Past Coaches", style: TextStyle(color: Colors.white54, fontSize: 18.0),),
            ),
            Expanded(
              flex: 9,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                     // physics: AlwaysScrollableScrollPhysics(),
                      itemCount: pastCoachName.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new Container(
                          margin: EdgeInsets.only(top: 4.0, bottom: 1.0),
                          alignment: Alignment.topCenter,
                          // color: Colors.grey,
                          //  padding: EdgeInsets.all(.0),
                      //  height: 80,
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
                                    bottom: 1.0),
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        //  border: Border.all(),
                                        image: new DecorationImage(
                                          image: new AssetImage(
                                            pastCoachImage[index] ,),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.black,
                                      ),
                                      height: 45.0,
                                      width: 40.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(pastCoachName[index],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17.0,
                                                  )),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                                child: Image.asset(
                                                  "assets/star.png",
                                                  height: 16.0,
                                                ),
                                              ),

                                              Text("$rating ($orders+)",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),


                                          Row(
                                            children: [
                                              Text(pastCoachType[index],
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 13.0)),
                                              Spacer(),
                                              Text("\$$rate Per Month",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.0
                                                  )),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
