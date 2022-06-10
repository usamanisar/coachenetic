import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'client/client_bottom_bar.dart';
import 'client/client_home.dart';


 class Coach_Filter extends StatefulWidget {
   @override
   _Coach_FilterState createState() => _Coach_FilterState();
 }

 class _Coach_FilterState extends State<Coach_Filter> {
   double _value = 0;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(80.0),
         child: AppBar(

           centerTitle: true,
           shadowColor: HexColor("#0070BF"),
           elevation:5.0,
           backgroundColor: HexColor("#080812"),
           title: Text("Filter", style: TextStyle(color: Colors.white, fontSize: 22.0), ),
           leading:GestureDetector(
             onTap: (){
               Navigator.pop(context);
             },
             child: Container(
               //  color: Colors.white,
                 child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
             ),
           ),

         ),
       ),
       body: SizedBox.expand(
         child: Container(
         //  alignment: Alignment.centerLeft,
      //   height: MediaQuery.of(context).size.height,
     //    width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(16.0),
           color: Colors.black,
           child: Column(
             children: [
               Expanded(
                 child: SingleChildScrollView(
                   child: Column(

                     children: [
                       Container(
                         alignment: Alignment.centerLeft,
                         child: Padding(
                             padding: EdgeInsets.all(10.0),
                             child: Text("Search Coach Rating", style: TextStyle(color:Colors.white, fontSize: 17.0,) )),
                       ),
                       Container (
                         // padding: EdgeInsets.all(20.0),
                         height: MediaQuery.of(context).size.width/3.2,
                         width: MediaQuery.of(context).size.width,
                         child: Card(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             color: HexColor("#080812"),
                             child:Column( children: <Widget>[
                               Expanded(
                                 child: FlutterSlider(
                                   values: [2],
                                   max: 5,
                                   min: 0,
                                   handler: FlutterSliderHandler(

                                     child: CircleAvatar(
                                         radius: 20.0,
                                         backgroundColor: Colors.white,
                                         // color: Colors.black,
                                         child: Icon(Icons.circle, size: 20.0)),
                                   ),
                                   onDragging: (handlerIndex, lowerValue, upperValue) {

                                   },
                                   touchSize: 10,
                                   handlerHeight: 25.0,
                                   handlerWidth: 40.0,
                                 ),
                               ),
                               //  Text("Rating", style: TextStyle(color: Colors.orange, fontSize: 14.0),),
                               Container(
                                 padding: EdgeInsets.only(bottom:20.0, ),
                                 child: Row(
                                   children: [
                                     SizedBox(width: 20.0,),
                                     Text("Rating", style: TextStyle(color: Colors.orange, fontSize: 14.0),),

                                     Expanded(
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Text("1", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("2", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("3", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("4", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("5", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                         ],),
                                     ),


                                   ],
                                 ),
                               ),
                             ],)
                         ),
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         margin: EdgeInsets.only(top: 14.0),
                         child: Padding(
                             padding: EdgeInsets.all(10.0),
                             child: Text("Search Coach Pricing", style: TextStyle(color:Colors.white, fontSize: 17.0,) )),
                       ),
                       Container (
                         // padding: EdgeInsets.all(20.0),
                         height: MediaQuery.of(context).size.width/3.2,
                         width: MediaQuery.of(context).size.width,
                         child: Card(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             color: HexColor("#080812"),
                             child:Column( children: <Widget>[
                               Expanded(
                                 child: FlutterSlider(
                                   values: [250],
                                   max: 500,
                                   min: 0,
                                   visibleTouchArea: true,

                                   handler: FlutterSliderHandler(


                                     child: CircleAvatar(
                                         backgroundColor: Colors.white,
                                         // color: Colors.black,
                                         child: Icon(Icons.circle, size: 20.0)),
                                   ),
                                   touchSize: 10,
                                   handlerHeight: 25.0,
                                   handlerWidth: 40.0,
                                   onDragging: (handlerIndex, lowerValue, upperValue) {

                                   },
                                 ),
                               ),
                               Container(
                                 padding: EdgeInsets.only(bottom:20.0, ),
                                 child: Row(
                                   children: [
                                     SizedBox(width: 20.0,),
                                     Text("Rating", style: TextStyle(color: Colors.orange, fontSize: 14.0),),

                                     Expanded(
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Text("\$100", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("\$200", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("\$300", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("\$400", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                                           Text("\$500", style: TextStyle(color: Colors.white, fontSize: 12.0))
                                         ],),
                                     ),


                                   ],
                                 ),
                               ),
                             ],)
                         ),
                       ),


                     ],
                   ),
                 ),
               ),
               Container(
                 alignment: Alignment.bottomCenter,
                 child: MaterialButton(
                   minWidth: 400.0,
                   height: 40.0,
                   color: HexColor("#0070BF"),
                   elevation: 15.0,
                   child: Text("RESET",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18.0,
                     ),
                   ),
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ClientBottomBar()),
                     );
                   },
                 ),
               ),

             ],
           ),

           ),
       ),

     );
   }
 }
