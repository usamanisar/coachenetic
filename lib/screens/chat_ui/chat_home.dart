import 'package:coach_netic/constants/data.dart';
import 'package:coach_netic/screens/chat_ui/chat_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Chat_Home_Page extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Chat_Home_Page> {
  TextEditingController _searchController = new TextEditingController();
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
            child: Text("Chat List", textAlign: TextAlign.center)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      children: <Widget>[
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
              fillColor: HexColor("#151520"), //HexColor("#080812"),
              filled: true,

              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //       color: Colors.blue, width: 1.0),
              // ),
              hintText: "   Search Coaches Here...",
              hintStyle: TextStyle(color: Colors.white54),
              suffixIcon: GestureDetector(
                child: Container(
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
        SizedBox(
          height: 30,
        ),
        Column(
          children: List.generate(userMessages.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage(userMessages[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          userMessages[index]['online']
                              ? Positioned(
                                  top: 52,
                                  left: 58,
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF66BB6A),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                userMessages[index]['name'],
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  userMessages[index]['created_at'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Text(
                                  userMessages[index]['message'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              userMessages[index]['online']
                                  ? Expanded(
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          // Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}
