import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CalculationScreen extends StatefulWidget {
  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
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
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  //  color: Colors.white,
                    child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Calculations'),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: selected == 0
                                ? HexColor('#0070BF')
                                : Colors.white10,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Image.asset(
                          'assets/belly.png',
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
                      width: 70,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Body Fat',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 2;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 3;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                                  text: 'Body Fat Index',
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
                    Row(
                      children: <Widget>[
                        Text(
                          'Gender',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: HexColor('#0070BF'), width: 2)),
                              child: Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  activeColor: HexColor('#0070BF'),
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  }),
                            ),
                            Text(
                              'Male',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: HexColor('#0070BF'), width: 2)),
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
                              'Female',
                              style: TextStyle(color: Colors.white),
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
                          'Weight',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Spacer(),
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
                                'Inches',
                                style: TextStyle(color: Colors.white),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Waist Circumference',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'For Female',
                              style: TextStyle(
                                  color: HexColor('#0070BF'), fontSize: 10),
                            ),
                          ],
                        ),
                        Spacer(),
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
                                'Inches',
                                style: TextStyle(color: Colors.white),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hip Circumference',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'For Female',
                              style: TextStyle(
                                  color: HexColor('#0070BF'), fontSize: 10),
                            ),
                          ],
                        ),
                        Spacer(),
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
                                'Inches',
                                style: TextStyle(color: Colors.white),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forearm Circumference',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'For Female',
                              style: TextStyle(
                                  color: HexColor('#0070BF'), fontSize: 10),
                            ),
                          ],
                        ),
                        Spacer(),
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
                                'Inches',
                                style: TextStyle(color: Colors.white),
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
                                  fontSize: 14),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Result',
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
            )
          ],
        ),
      ),
    );
  }
}
