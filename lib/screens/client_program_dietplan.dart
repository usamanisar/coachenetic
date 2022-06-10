import 'package:coach_netic/screens/client_program_workout.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Program_DietPlan extends StatefulWidget {
  @override
  _Program_DietPlanState createState() => _Program_DietPlanState();
}

class _Program_DietPlanState extends State<Program_DietPlan> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Hero(
            tag: 'program',
            child: AppBar(
              centerTitle: true,
              shadowColor: HexColor('#016BB8'),
              elevation: 1.0,
              backgroundColor: HexColor('#10101E'),
              leading: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 20.0,
                  ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Programs'),
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(

              children: [
                Container(
                  alignment: Alignment.topLeft,

                  // margin: EdgeInsets.all(15.0),
                  //  padding: EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 30.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: HexColor("#151520"))),
                          color: HexColor("#151520"),
                          textColor: Colors.white,
                          disabledColor: Colors.black26,
                          disabledTextColor: Colors.white30,
                          padding: EdgeInsets.all(4.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Program_Workout()),
                            );
                            /*...*/
                          },
                          child: Text(
                            "Workout",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 30.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: HexColor("#0070BF"))),
                          color: HexColor("#0070BF"),
                          textColor: Colors.white,
                          disabledColor: Colors.black26,
                          disabledTextColor: Colors.white30,
                          padding: EdgeInsets.all(4.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {},
                          child: Text(
                            "Diet Plan",
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Empty Stomach",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )),
                Container(
                  //color: Colors.white,
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      color: HexColor("#151520"),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Half Lemon",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12.0,) ,),
                        Text("One spoon Ginger",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("One spoon Honey",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12.0),),
                        Text("Warm Water",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("It will also detox you",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Container(

                          decoration: BoxDecoration(
                            //color: Colors.blue,
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text("RECIPE", style: TextStyle(color: Colors.white , fontSize: 12),),
                        ),
                        Text("1. Heat one glass of water until it is boiled.",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("2. Once the water is ready, add one slice of ",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("Ginger and let it steep for 5 minutes, covered.",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("3. After 5 minutes,",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("4. Add the juice of one lemon and add one",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("spoon honey and drink.",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),




                      ],
                    ),
                  ),
                ),




                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lunch",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )),
                Container(
                  //color: Colors.white,
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                      color: HexColor("#151520"),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("One Apple, deiced",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0,) ,),
                        Text("One Pomegranate",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("One cup diced pineapple",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0),),
                        Text("Eight rough chopped strawberries",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("Two cups non-fat yogurt",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Container(

                          decoration: BoxDecoration(
                            //color: Colors.blue,
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text("RECIPE", style: TextStyle(color: Colors.white , fontSize: 12),),
                        ),
                        Text("In bowl, mix all chopped fruits with low-fat ",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("yogurt. You can add nuts like almonds, walnuts and ",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        Text("pistachios to make this salad more wholesome.",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),



                      ],
                    ),
                  ),
                ),





                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Evening",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )),
                Container(
                  //color: Colors.white,
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                      color: HexColor("#151520"),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("One cup Green Tea",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0,) ,),
                        Text("It will also gives you glowing skin",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),




                      ],
                    ),
                  ),
                ),





                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dinner",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )),
                Container(
                  //color: Colors.white,
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                      color: HexColor("#151520"),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Four Eggs white",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0,) ,),
                        Text("One glass milk",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),
                        SizedBox(height: 20.0,),
                        Text("Only eat white part of egg, not yellow",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0),),
                        Text("Use double toned milk if possible",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),


                      ],
                    ),
                  ),
                ),



                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Before Bed",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )),
                Container(
                  //color: Colors.white,
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                      color: HexColor("#151520"),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("One cup green tea",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0,) ,),
                        Text("It will also gives you glowing skin",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 12.0), ),

                      ],
                    ),
                  ),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}
