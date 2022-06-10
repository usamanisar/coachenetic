import 'package:coach_netic/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _sendMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          
          backgroundColor: HexColor("#151520"),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
          title: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/coach_1_dp.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Rose Merry",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Image.asset(
              "assets/phone_call.png",
              height: 20.0,
              width: 20.0,
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset("assets/search.png", height: 20.0, width: 20.0),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      body: Container(

        child: Stack(
          children: [
            getBody(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  style: TextStyle(color: Colors.white70, fontSize: 16.0,
                  ),
                  cursorColor: Colors.white,

                  showCursor: false,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    fillColor: HexColor("#080812"),
                    filled: true,

                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(
                    //       color: Colors.blue, width: 1.0),
                    // ),
                    hintText: "  Type message ..",
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon:  Container(
                      width: 80,
                      child: Row(

                        children: [
                          GestureDetector(
                            child: Image.asset(
                              "assets/plus_circle.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: HexColor("#0070BF"),
                                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
                              // color: HexColor("#0070BF"),
                              child: Icon(Icons.mic, size: 25.0, color: Colors.white),
                            ),
                            onTap: () {
                              //code here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      //  bottomSheet: getBottom(),
    );
  }


  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 80),
      children: List.generate(messages.length, (index) {
        return ChatBubble(
            isMe: messages[index]['isMe'],
            messageType: messages[index]['messageType'],
            message: messages[index]['message'],
            profileImg: messages[index]['profileImg']);
      }),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String profileImg;
  final String message;
  final String time = "10:00 PM";
  final int messageType;

  const ChatBubble({
    Key key,
    this.isMe,
    this.profileImg,
    this.message,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMe){
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor("#0070BF"),
                    borderRadius: getMessageType(messageType)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }else{
      return Padding(
        padding:  EdgeInsets.all(3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor("#151520"),
                    borderRadius: getMessageType(messageType)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

  }

  getMessageType(messageType) {
    if (isMe) {
      // start message
      return BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20));
    }
    // for sender bubble
    else {

      return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20));
    }
  }
}
