import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_hero/local_hero.dart';

import '../colors.dart';

class BodyMass extends StatefulWidget {
  @override
  _BodyMassState createState() => _BodyMassState();
}

class _BodyMassState extends State<BodyMass> {
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RichText(
                text: TextSpan(
                    text: 'Calculate your ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    children: [
                      TextSpan(
                          text: 'Body Mass Index',
                          style: TextStyle(
                            color: HexColor('#0070BF'),
                            fontSize: 20,
                          ))
                    ]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 20,

                      decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border:
                          Border.all(color: HexColor('#0070BF'), width: 2)),
                      child: Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: HexColor('#0070BF'),
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          }),
                    ),
                    Container(
                      //color: Colors.deepOrange,
                      child: Text(
                        'Adult BMI',
                        style: TextStyle(color: Colors.white,
                        fontSize: 12),

                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: HexColor('#0070BF'), width: 2)),
                      child: Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: HexColor('#0070BF'),
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          }),
                    ),
                    Text(
                      'Kids BMI',
                      style: TextStyle(color: Colors.white,
                      fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Your Height',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                // Spacer(),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: HexColor('#161623'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      // child:
                      // TextFormField(
                      //   cursorColor: Colors.black,
                      //   decoration: new InputDecoration(
                      //     border: InputBorder.none,
                      //     focusedBorder: InputBorder.none,
                      //     enabledBorder: InputBorder.none,
                      //     errorBorder: InputBorder.none,
                      //     disabledBorder: InputBorder.none,
                      //     // contentPadding:
                      //     // EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      //     // hintText: "Hint here"
                      //     //
                      //     //
                      //   ),
                      // )
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: CoColors.lightblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Feet',
                        style: TextStyle(color: Colors.white,
                        fontSize: 12),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: HexColor('#161623'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: CoColors.lightblue,
                    ),
                    LocalHero(
                      tag: 'inch',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Inches',
                          style: TextStyle(color: Colors.white,
                          fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Your Weight',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: HexColor('#161623'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      // child:
                      // TextFormField(
                      //   cursorColor: Colors.black,
                      //   decoration: new InputDecoration(
                      //     border: InputBorder.none,
                      //     focusedBorder: InputBorder.none,
                      //     enabledBorder: InputBorder.none,
                      //     errorBorder: InputBorder.none,
                      //     disabledBorder: InputBorder.none,
                      //     // contentPadding:
                      //     // EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      //     // hintText: "Hint here"
                      //     //
                      //     //
                      //   ),
                      // )
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Pounds',
                        style: TextStyle(color: Colors.white,
                        fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: LocalHero(
                    tag: 'cal',
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      decoration: BoxDecoration(
                          color: HexColor('#0070BF'),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        color: HexColor('#CF9E16'),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      'RESET',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Result',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            Container(
              color: HexColor('#161623'),
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.only(right: 10.0, top: 10.0),
            )
          ],
        ),
      ),
    );
  }
}
