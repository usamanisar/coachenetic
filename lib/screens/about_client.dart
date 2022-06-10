import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Client extends StatefulWidget {
  @override
  _About_ClientState createState() => _About_ClientState();
}

class _About_ClientState extends State<About_Client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Image.asset("assets/about_you.jpg", width: 100.0, height: 100.0,),

              ),
              AutoSizeText("About You", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold), minFontSize: 12, overflow: TextOverflow.ellipsis,),
              Row(children: [
                // TextField(
                //   //   autofocus: true,
                //   style: TextStyle(color: Colors.white, fontSize: 16.0),
                // //  cursorColor: HexColor("#0070BF"),
                //   decoration: InputDecoration(
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //           color: Colors.white, width: 1.0),
                //     ),
                //     // focusedBorder: UnderlineInputBorder(
                //     //   borderSide: BorderSide(
                //     //       color: Colors.blue, width: 1.0),
                //     // ),
                //     hintText: "Yasin",
                //     hintStyle: TextStyle(color: Colors.white54),
                //     prefixIcon: Icon(
                //         Icons.account_circle,
                //         size: 16.0,
                //         color: Colors.black12,
                //     ),
                //   ),
                // ),

                Container(
                    width: MediaQuery.of(context).size.width/2.1,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: 'Yasin',
                        prefixIcon: Icon(Icons.account_circle),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white12,


                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.transparent, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent, width: 2),
                        ),
                      ),)
                )
              ],),

            ],
          ),
        ),
      ),
    );
  }
}
