import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CoachOrderPast extends StatefulWidget {
  @override
  _CoachOrderPastState createState() => _CoachOrderPastState();
}

class _CoachOrderPastState extends State<CoachOrderPast> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: HexColor('#151522')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 10.0, right: 15.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: HexColor('#9B52AF')),
                  child: Image.asset('assets/rose.png')),
              Text(
                'Rose Merry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '1 Month',
                  style: TextStyle(fontSize: 17, color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: HexColor('#151522')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 10.0, right: 15.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: HexColor('#9B52AF')),
                  child: Image.asset(
                    'assets/smith.png',
                  )),
              Text(
                'Smith',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '1 Month',
                  style: TextStyle(fontSize: 17, color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: HexColor('#151522')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 10.0, right: 15.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: HexColor('#9B52AF')),
                  child: Image.asset(
                    'assets/maria.png',
                  )),
              Text(
                'Maria',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '1 Month',
                  style: TextStyle(fontSize: 17, color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
