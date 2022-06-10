/*
import 'package:chapprey/Constants/constants.dart';
import 'package:chapprey/Models/fire_user.dart';
import 'package:chapprey/Models/fire_contact.dart';
import 'package:chapprey/Models/fire_message.dart';
import 'package:chapprey/Providers/contacts_provider.dart';
import 'package:chapprey/Providers/user_provider.dart';
import 'package:chapprey/Theme/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:chapprey/Locale/locale.dart';
import 'package:chapprey/Routes/routes.dart';
import 'package:chapprey/Theme/colors.dart';
import 'package:provider/provider.dart';

class ChatInfo {
  String image;
  String name;
  String message;
  String time;
  int unread;
  bool online;

  ChatInfo(
      this.image, this.name, this.message, this.time, this.unread, this.online);
}

class ChatRoomBody extends StatefulWidget {

  Function showLoading;
  Function hideLoading;

  ChatRoomBody({this.hideLoading,this.showLoading});


  @override
  _ChatRoomBodyState createState() => _ChatRoomBodyState();
}

class _ChatRoomBodyState extends State<ChatRoomBody> {
  @override
  Widget build(BuildContext context) {
    FireUser fireUser = Provider.of<UserProvider>(context,listen:false).getUser;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<FireUser> contacts =
        Provider.of<ContactsProvider>(context).getContacts;
    var locale = AppLocalizations.of(context);
    List<ChatInfo> chats = [
      ChatInfo('assets/ProfileImage/Layer1.png', 'Luicy Williamson',
          locale.status1, '2m', 2, true),
      ChatInfo('assets/ProfileImage/Layer2.png', 'Emili Williamson',
          locale.status2, '14m', 1, true),
      ChatInfo('assets/ProfileImage/Layer3.png', 'George Taylor',
          locale.status3, '26m', 0, false),
      ChatInfo('assets/ProfileImage/Layer4.png', 'Luccy Aunty', locale.status4,
          '6h', 0, false),
*/
/*      ChatInfo('assets/ProfileImage/Layer5.png', 'Jackson Uncle',
          locale.status5, '1d', 0, true),
      ChatInfo('assets/ProfileImage/Layer6.png', 'Roshesh Accountant',
          locale.status6, '2d', 0, true),
      ChatInfo('assets/ProfileImage/Layer7.png', 'Geora Swift', locale.status1,
          '2d', 0, true),
      ChatInfo('assets/ProfileImage/Layer1.png', 'Lucky Aunty', locale.status2,
          '3d', 0, false),
      ChatInfo('assets/ProfileImage/Layer2.png', 'Taylor', locale.status3, '3d',
          4, false),
      ChatInfo('assets/ProfileImage/Layer3.png', 'Jack Shawn', locale.status4,
          '3d', 0, false),
      ChatInfo('assets/ProfileImage/Layer1.png', 'Luicy Williamson',
          locale.status1, '2m', 2, true),
      ChatInfo('assets/ProfileImage/Layer2.png', 'Emili Williamson',
          locale.status2, '14m', 1, true),
      ChatInfo('assets/ProfileImage/Layer3.png', 'George Taylor',
          locale.status3, '26m', 0, false),
      ChatInfo('assets/ProfileImage/Layer4.png', 'Luccy Aunty', locale.status4,
          '6h', 0, false),
      ChatInfo('assets/ProfileImage/Layer5.png', 'Jackson Uncle',
          locale.status5, '1d', 0, true),
      ChatInfo('assets/ProfileImage/Layer6.png', 'Roshesh Accountant',
          locale.status6, '2d', 0, true),
      ChatInfo('assets/ProfileImage/Layer7.png', 'Geora Swift', locale.status1,
          '2d', 0, true),
      ChatInfo('assets/ProfileImage/Layer1.png', 'Lucky Aunty', locale.status2,
          '3d', 0, false),
      ChatInfo('assets/ProfileImage/Layer2.png', 'Taylor', locale.status3, '3d',
          4, false),
      ChatInfo('assets/ProfileImage/Layer3.png', 'Jack Shawn', locale.status4,
          '3d', 0, false),*//*

    ];
    return Padding(
      padding: EdgeInsets.only(bottom: 56.0),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {})
          ],
          backgroundColor: mainColor,
          title: Text(locale.chatRoom,
              style: Theme.of(context).appBarTheme.textTheme.bodyText1),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: getChats(fireUser),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          //           controller: _controller,
                          itemBuilder: (context, index) {
                            print(snapshot.data.docs[index]
                                .data()['participants']);
                            var theme = Theme.of(context);
                            List<dynamic> participants = snapshot
                                .data.docs[index]
                                .data()['participants'];
                            String oppuid = participants
                                .where((element) =>
                                    element.toString() != fireUser.uid)
                                .toList()[0];
                            List<FireUser> fireContact = contacts
                                .where((element) => element.uid == oppuid)
                                .toList();
                            if(fireContact.length==0){
                              return null;
                            }else{
                              return StreamBuilder<QuerySnapshot>(
                                  stream: snapshot.data.docs[index].reference
                                      .collection(Constants.FIRESTORE_MESSAGES)
                                      .orderBy('time', descending: true)
                                      .limit(1)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      FireMessage fireMessage;
                                      if(snapshot.data.docs.length>0){
                                        fireMessage = FireMessage.fromMap(snapshot.data.docs[0].data());
                                      }else{
                                        fireMessage = FireMessage();
                                      }
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, PageRoutes.chattingPage,arguments: fireContact[0]);
                                        },
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: Stack(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 28,
                                                    backgroundImage: NetworkImage(
                                                        fireContact[0].photo),
                                                  ),
                                                  */
/* Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: 0,
                    top: 5,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: chats[index].online
                          ? Colors.greenAccent
                          : Colors.grey[300],
                    )
                )*//*

                                                ],
                                              ),
                                              title: Row(
                                                children: [
                                                  Text(
                                                    fireContact[0].fName,
                                                    style: theme
                                                        .textTheme.bodyText1
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .normal),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Text(
                                                    fireMessage.time!=null?Constants.getTimeFormat(DateTime.now().millisecondsSinceEpoch-int.parse(fireMessage.time)):"",
                                                    style: appTheme
                                                        .textTheme.subtitle2
                                                        .copyWith(fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              subtitle: Text(
                                                fireMessage.text!=null?fireMessage.text:"",
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.textTheme.subtitle2
                                                    .copyWith(height: 1.3),
                                              ),
                                              */
/* trailing: chats[index].unread > 0
                ? CircleAvatar(
              radius: 10,
              backgroundColor: mainColor,
              child: Text(
                '${chats[index].unread}',
                style: theme.textTheme.overline,
                textAlign: TextAlign.center,
              ),
            )
                : SizedBox.shrink(),*//*

                                            ),
                                            Divider(
                                              thickness: 1,
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    {
                                      return Container();
                                    }
                                  });
                            }

                            */
/*  FireMessage message = FireMessage.fromMap(
                                (await stream.first).docs.first.data());

                            FireMessage message = FireMessage.fromMap(
                                snapshot.data.docs[index].data());*//*


                            */
/*   bool isMe =
                                  message.sender == fireUser.uid;
                              String hours =
                              ((int.parse(message.time) / 3600000) %
                                  12).ceil()
                                  .toString();
                              String min =
                              ((int.parse(message.time) / 60000) %
                                  60).ceil()
                                  .toString();
*//*


                          })
                      : Container(
                          child: Center(
                            child: Text(""),
                          ),
                        );
                },
              ),
            ),
            */
/*Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    var theme = Theme.of(context);
                    return GestureDetector(
                      onTap: () {
                        //      Navigator.pushNamed(context, PageRoutes.chattingPage);
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage(chats[index].image),
                                ),
                                Positioned.directional(
                                    textDirection: Directionality.of(context),
                                    end: 0,
                                    top: 5,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: chats[index].online
                                          ? Colors.greenAccent
                                          : Colors.grey[300],
                                    ))
                              ],
                            ),
                            title: Row(
                              children: [
                                Text(
                                  chats[index].name,
                                  style: theme.textTheme.bodyText1
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  chats[index].time,
                                  style: theme.textTheme.subtitle2
                                      .copyWith(fontSize: 10),
                                )
                              ],
                            ),
                            subtitle: Text(
                              chats[index].message,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.subtitle2
                                  .copyWith(height: 1.3),
                            ),
                            trailing: chats[index].unread > 0
                                ? CircleAvatar(
                                    radius: 10,
                                    backgroundColor: mainColor,
                                    child: Text(
                                      '${chats[index].unread}',
                                      style: theme.textTheme.overline,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                          Divider(
                            thickness: 1,
                            height: 4,
                          ),
                        ],
                      ),
                    );
                  }),
            ),*//*

          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.newChat);
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.chat,
              color: Theme.of(context).scaffoldBackgroundColor,
            )),
      ),
    );
  }

  Stream<QuerySnapshot> getChats(FireUser fireUser) {
    Query query = FirebaseFirestore.instance
        .collection(Constants.FIRESTORE_CHATS)
        .where('participants', arrayContains: fireUser.uid);
    return query.snapshots();
  }
}
*/
