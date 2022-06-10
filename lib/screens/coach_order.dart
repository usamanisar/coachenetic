import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'coach_order_active.dart';
import 'coach_order_past.dart';

class CoachOrders extends StatefulWidget {
  @override
  _CoachOrdersState createState() => _CoachOrdersState();
}

class _CoachOrdersState extends State<CoachOrders> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor('#080812'),
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
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('My Orders'),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 0;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          color: selected == 0
                              ? HexColor('#0070BF')
                              : HexColor('#151522'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'Active',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          color: selected == 1
                              ? HexColor('#0070BF')
                              : HexColor('#151522'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'Past',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    selected == 0 ? CoachOrderActive() : Container(),
                    selected == 1 ? CoachOrderPast() : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
