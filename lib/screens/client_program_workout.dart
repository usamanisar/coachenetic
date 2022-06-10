import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'client_program_dietplan.dart';

class Program_Workout extends StatefulWidget {
  @override
  _Program_WorkoutState createState() => _Program_WorkoutState();
}

class _Program_WorkoutState extends State<Program_Workout> {
  List<String> workout_image = ['assets/workout_image_2.png', 'assets/workout_image_4.png','assets/workout_image_3.png','assets/workout_image_1.png',];
  List<String> workout_type = ["10 Minutes Full Body Stretch", "YOGS 101", "HIT 101", "YOGS 101"];
  List<String> video_time = ["9:55", "4:20", "9:12", "3:00"];

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
          color: Colors.black,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,

                margin: EdgeInsets.all(15.0),
                //  padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 80.0,
                      height: 30.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: HexColor('#0070BF'))),
                        color: HexColor('#0070BF'),
                        textColor: Colors.white,
                        disabledColor: Colors.black26,
                        disabledTextColor: Colors.white30,
                        padding: EdgeInsets.all(4.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Program_DietPlan()),
                          // );
                          /*...*/
                        },
                        child: Text(
                          "Program",
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
                                builder: (context) => Program_DietPlan()),
                          );
                        },
                        child: Text(
                          "Diet Plan",
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           Expanded(
                child: new ListView.builder
                  (
                    itemCount: workout_image.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return  Container(
                         margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(1),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              backgroundBlendMode: BlendMode.darken,
                              image: DecorationImage(
                                  image: AssetImage(workout_image[index]),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 18.0, top: 8.0),
                                  child: FlatButton(
                                    height: 20.0,
                                    minWidth: 40,
                                    child: Text(video_time[index]),
                                    color: HexColor("#0070BF"),
                                    textColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30.0, top: 20.0),
                                  child: Icon(
                                    Icons.play_circle_fill_outlined,
                                    size: 36,
                                    color: Colors.white70,
                                  ),
                                  //    padding: EdgeInsets.only(left: 8.0, top: 2.0)
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  workout_type[index],
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 4.0, right: 18.0),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                            radius: 18.0,
                                            backgroundColor:
                                            Colors.white.withOpacity(0.4),
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 16.0,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                            radius: 18.0,
                                            backgroundColor:
                                            Colors.white.withOpacity(0.4),
                                            child: Icon(
                                              Icons.delete_sweep,
                                              color: Colors.white,
                                              size: 16.0,
                                            )),
                                      ),
                                    ],
                                  )),
                            ],
                          ));
                    }
                ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
