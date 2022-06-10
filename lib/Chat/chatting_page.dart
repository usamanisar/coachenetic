/*
import 'dart:io';
import 'dart:async';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:chapprey/audio_test.dart';
import 'package:chapprey/agora/pickup_layout.dart';
import 'package:chapprey/Profile/view_all_media.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide timeDilation;
import 'package:chapprey/BottomNavigation/Chat/video_player.dart';
import 'package:chapprey/Constants/constants.dart';
import 'package:chapprey/Models/fire_user.dart';
import 'package:chapprey/Models/fire_message.dart';
import 'package:chapprey/Providers/user_provider.dart';
import 'package:chapprey/BottomNavigation/Chat/forward_message.dart';
import 'package:chapprey/Theme/style.dart';
import 'package:chapprey/agora/call_utilities.dart';
import 'package:chapprey/agora/permissions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';

import 'package:image/image.dart' as ImageTools;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chapprey/Components/chatting_page_appbar.dart';
import 'package:chapprey/Components/chatting_page_textfield_buttons.dart';
import 'package:chapprey/Locale/locale.dart';
import 'package:chapprey/Routes/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'chat_media.dart';

class ChattingPage extends StatefulWidget {
  final FireUser fireContact;

  ChattingPage({this.fireContact});

  @override
  _ChattingPageState createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  TextEditingController _messageController = TextEditingController();
  bool attachFile = false;
  double attachFileWidth = 0;
  ScrollController _controller = new ScrollController();
  FocusNode myFocusNode = FocusNode();
  Stream<QuerySnapshot> messages;
  bool isOnline = false;
  String currentText = "";
  Future<Query> myFuture;
  bool isContactOnline = false;
  String replyText;
  String replyVideo;
  String replyPhoto;

  CollectionReference chatReference;

  bool isRecording = false;
  bool isTyping = false;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  AnimationController _animationController;

//  TextEditingController messageEditingController = new TextEditingController();

  @override
  void dispose() {
    chatReference.parent.set({fireUser.uid: false}, SetOptions(merge: true));
    _messageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (chatReference != null) {
      if (state == AppLifecycleState.resumed) {
        chatReference.parent
            .set({fireUser.uid: false}, SetOptions(merge: true));
      } else {
        chatReference.parent
            .set({fireUser.uid: false}, SetOptions(merge: true));
      }
    }
  }

  @override
  void initState() {
    // print(widget.fireContact.fName);
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);

    FirebaseFirestore.instance
        .collection(Constants.FIRESTORE_USERS)
        .doc(widget.fireContact.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        isOnline = event.data()['isOnline'];
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myFuture = getChatRoom(fireUser, widget.fireContact);
    });

    super.initState();
  }

  List<QueryDocumentSnapshot> searchDocs;
  TextEditingController searchController = new TextEditingController();
  String searchChat;
  FireUser fireUser;

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    var locale = AppLocalizations.of(context);
    fireUser = Provider.of<UserProvider>(context, listen: false).getUser;

    return MaterialApp(
      builder: EasyLoading.init(),
      home: PickupLayout(
        scaffold: Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/chat_background.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: searchChat != null
                            ? TextField(
                                decoration: InputDecoration(
                                  hintText: "Search Message",
                                  fillColor: Colors.green,
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8,
                                        right: 10,
                                        top: 12,
                                        bottom: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        */
/* if(searchChat==null){
                                  *//*
 */
/*  setState(() {
                                      searchChat="";

                                    });*//*
 */
/*
                                  }else{
                                    //    Scrollable.ensureVisible((searchController.text as GlobalKey()).currentContext);,

                                           int i = searchDocs.indexOf(searchDocs.where((element) => element.data()["text"].toString().contains(searchController.text)).first);
                                           if(i!=null){
                                             print(i);

                                             _controller.jumpTo(_controller.);
                                           }
                                  }*//*

                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: buildAppBarActions(
                                      context, Icons.arrow_back_ios,
                                      onPress: () {
                                    setState(() {
                                      searchChat = null;
                                    });
                                  }),
                                ),
                                controller: searchController,
                              )
                            : Row(
                                children: [
                                  buildAppBarActions(
                                      context, Icons.arrow_back_ios,
                                      onPress: () {
                                    Navigator.pop(context);
                                  }),
                                  Stack(
                                    children: [
                                      Hero(
                                        tag: 'dp',
                                        child: CircleAvatar(
                                          backgroundImage: widget
                                                      .fireContact.photo !=
                                                  null
                                              ? NetworkImage(
                                                  widget.fireContact.photo)
                                              : AssetImage(
                                                  'assets/profilePlaceholder.png'),
                                        ),
                                      ),
                                      Positioned.directional(
                                          top: 4,
                                          end: 0,
                                          textDirection:
                                              Directionality.of(context),
                                          child: CircleAvatar(
                                              backgroundColor: isOnline
                                                  ? Colors.greenAccent
                                                  : Colors.grey,
                                              radius: 4)),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PageRoutes.profileInfo);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.fireContact.fName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor)),
                                          isTyping
                                              ? FadeTransition(
                                                  opacity: _animationController,
                                                  child: Text("Typing...",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .color)),
                                                )
                                              : isOnline
                                                  ? Text("Online",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .color))
                                                  : Container(),
                                        ],
                                      )),
                                  Spacer(),
                                  buildAppBarActions(context, Icons.videocam,
                                      onPress: () async => await Permissions
                                              .cameraAndMicrophonePermissionsGranted()
                                          ? {
                                              CallUtils.dial(
                                                  from: fireUser,
                                                  to: widget.fireContact,
                                                  context: context,
                                                  isVideo: true),
                                              sendNotification({
                                                "sendby": widget
                                                        .fireContact.fName +
                                                    widget.fireContact.lName,
                                                "message": 'VIDEO Calling',
                                                'imageurl':
                                                    widget.fireContact.thumb,
                                              })
                                            }
                                          : {}),
                                  */
/*   Navigator.pushNamed(context, PageRoutes.videoCallPage);*//*


                                  buildAppBarActions(context, Icons.call,
                                      onPress: () async => await Permissions
                                              .cameraAndMicrophonePermissionsGranted()
                                          ? {
                                              CallUtils.dial(
                                                  from: fireUser,
                                                  to: widget.fireContact,
                                                  context: context,
                                                  isVideo: false),
                                              sendNotification({
                                                "sendby": widget
                                                        .fireContact.fName +
                                                    widget.fireContact.lName,
                                                "message": 'AUDIO Calling',
                                                'imageurl':
                                                    widget.fireContact.thumb,
                                              })
                                            }
                                          : {}),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8,
                                        right: 10,
                                        top: 12,
                                        bottom: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (searchChat == null) {
                                          setState(() {
                                            searchChat = "";
                                          });
                                        } else {
                                          //    Scrollable.ensureVisible((searchController.text as GlobalKey()).currentContext);,

                                          //        int i = searchDocs.indexOf(searchDocs.where((element) => element.data()["message"].toString().contains(searchController.text)).first);
                                          //        if(i!=null){
                                          //          _controller.jumpTo(i.toDouble());
                                          //        }
                                        }
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        size: 24,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      PopupMenuButton(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        icon: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none),
                        itemBuilder: (BuildContext context) {
                          return [
                            */
/*      PopupMenuItem(
                              child: Text(locale.viewContact),
                              value: locale.viewContact,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),*//*

                            PopupMenuItem(
                              child: GestureDetector(
                                child: Container(
                                    child: Text(locale.mediaLinksDocs)),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewAllMedia(fireContact: widget.fireContact,reference:chatReference)));
                                },
                              ),
                              value: locale.mediaLinksDocs,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            */
/*            PopupMenuItem(
                              child: Text(locale.search),
                              value: locale.search,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            PopupMenuItem(
                              child: Text(locale.block),
                              value: locale.block,
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),*//*

                          ];
                        },
                      ),
                    ],
                  ),
                  // MessageStream(),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        child: FutureBuilder(
                            future: myFuture,
                            builder: (BuildContext context3,
                                AsyncSnapshot<Query> querySnapshot) {
                              if (querySnapshot.data == null) {
                                return ListView(
                                  controller: _controller,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                    ),
                                  ],
                                );
                              } else {
                                return StreamBuilder<QuerySnapshot>(
                                  stream: querySnapshot.data.snapshots(),
                                  builder: (context1, snapshot) {
                                    if (snapshot.hasData) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback(
                                              (_) => _scroll());
                                      searchDocs = snapshot.data.docs;
                                      return ListView.builder(
                                          itemCount: snapshot.data.docs.length,
                                          controller: _controller,
                                          reverse: true,
                                          shrinkWrap: true,
                                          itemBuilder: (context2, index) {
                                            FireMessage message =
                                                FireMessage.fromMap(snapshot
                                                    .data.docs[index]
                                                    .data());

                                            bool isMe =
                                                message.sender == fireUser.uid;
                                            String hours = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        int.parse(message.time))
                                                .hour
                                                .toString();
                                            String min = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        int.parse(message.time))
                                                .minute
                                                .toString();

                                            String timeText = (hours.length == 2
                                                    ? hours
                                                    : "0" + hours) +
                                                ':' +
                                                (min.length == 2
                                                    ? min
                                                    : "0" + min);
                                            bool seen = true;

                                            return Row(
                                              mainAxisAlignment: isMe
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                              children: [
                                                isMe
                                                    ? Row(
                                                        children: [
                                                          seen
                                                              ? Opacity(
                                                                  opacity: 0.4,
                                                                  child: Text(
                                                                    ' seen ',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .caption
                                                                        .copyWith(
                                                                            color:
                                                                                Theme.of(context).scaffoldBackgroundColor),
                                                                  ),
                                                                )
                                                              : Container(),
                                                          Opacity(
                                                            opacity: 0.4,
                                                            child: Text(
                                                              timeText,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .scaffoldBackgroundColor),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                                GestureDetector(
                                                  child: MessageBubble(
                                                    text: message.text != null
                                                        ? message.text
                                                        : '',
                                                    fireMessage: message,
                                                    sender: isMe
                                                        ? fireUser
                                                        : widget.fireContact,
                                                    image: message.photo,
                                                    time: timeText,
                                                    timeInMilli: message.time,
                                                    isMe: isMe,
                                                    audio: message.audio,
                                                    latitude: message.latitude,
                                                    longitude:
                                                        message.longitude,
                                                    video: message.video,
                                                    videoThumb:
                                                        message.videoThumb,
                                                  ),
                                                  onTapDown:
                                                      (TapDownDetails aa) {
                                                    if (true) {
                                                      showMenu<String>(
                                                        context: context,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),

                                                        position: RelativeRect
                                                            .fromLTRB(
                                                                aa.globalPosition
                                                                    .dx,
                                                                aa.globalPosition
                                                                    .dy,
                                                                0.0,
                                                                0.0),
                                                        //position where you want to show the menu on screen
                                                        items: [
                                                          PopupMenuItem<String>(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.reply,
                                                                    size: 22,
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    "  Reply",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                              value: '1'),
                                                          PopupMenuDivider(
                                                            height: 1,
                                                          ),
                                                          PopupMenuItem<String>(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .forward_sharp,
                                                                    size: 22,
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    "  Forward",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                              value: '2'),
                                                          PopupMenuDivider(
                                                            height: 1,
                                                          ),
                                                          PopupMenuItem<String>(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.copy,
                                                                    size: 22,
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    "  Copy",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                              value: '3'),
                                                          PopupMenuDivider(
                                                            height: 1,
                                                          ),
                                                          PopupMenuItem<String>(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .delete_forever,
                                                                    size: 22,
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    "  Delete",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                              value: '4'),
                                                        ],
                                                        elevation: 8.0,
                                                      ).then<void>((String
                                                          itemSelected) {
                                                        if (itemSelected ==
                                                            null) return;

                                                        if (itemSelected ==
                                                            "1") {
                                                          setState(() {
                                                            if (message
                                                                    .videoThumb !=
                                                                null) {
                                                              replyVideo = message
                                                                  .videoThumb;
                                                              replyText = null;
                                                              replyPhoto = null;
                                                            } else if (message
                                                                    .photo !=
                                                                null) {
                                                              replyPhoto =
                                                                  message.photo;
                                                              replyText = null;
                                                              replyVideo = null;
                                                            } else if (message
                                                                    .text !=
                                                                null) {
                                                              replyText =
                                                                  message.text;
                                                              replyVideo = null;
                                                              replyPhoto = null;
                                                            }
                                                          });
                                                          //code here
                                                        } else if (itemSelected ==
                                                            "2") {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                            return ForwardMessage();
                                                          })).then((value) {
                                                            if (value != null) {
                                                              FireUser user =
                                                                  value
                                                                      as FireUser;
                                                              FireMessage
                                                                  message2 =
                                                                  message;
                                                              message2.replyVideo =
                                                                  null;
                                                              message2.replyText =
                                                                  null;
                                                              message2.replyPhoto =
                                                                  null;
                                                              message2.sender =
                                                                  fireUser.uid;
                                                              message2
                                                                  .time = DateTime
                                                                      .now()
                                                                  .millisecondsSinceEpoch
                                                                  .toString();
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      Constants
                                                                          .FIRESTORE_CHATS)
                                                                  .where("id",
                                                                      whereIn: [
                                                                        user.uid +
                                                                            fireUser.uid,
                                                                        fireUser.uid +
                                                                            user.uid
                                                                      ])
                                                                  .limit(1)
                                                                  .get()
                                                                  .then(
                                                                      (value) async {
                                                                    if (value
                                                                            .docs
                                                                            .length <
                                                                        1) {
                                                                      Map<String,
                                                                              dynamic>
                                                                          chatMap =
                                                                          {
                                                                        "participants":
                                                                            [
                                                                          fireUser
                                                                              .uid,
                                                                          user.uid
                                                                        ],
                                                                        "id": widget.fireContact.uid +
                                                                            fireUser.uid,
                                                                        fireUser.uid:
                                                                            false,
                                                                        user.uid:
                                                                            false
                                                                      };

                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(Constants
                                                                              .FIRESTORE_CHATS)
                                                                          .add(
                                                                              chatMap)
                                                                          .then((value) =>
                                                                              {
                                                                                value.collection(Constants.FIRESTORE_MESSAGES).add(message2.toMap(message2))
                                                                              });

                                                                      return addNewChat(
                                                                          fireUser,
                                                                          user);
                                                                    } else {
                                                                      value
                                                                          .docs
                                                                          .first
                                                                          .reference
                                                                          .collection(Constants
                                                                              .FIRESTORE_MESSAGES)
                                                                          .add(message2
                                                                              .toMap(message2));
                                                                    }
                                                                  });
                                                            }
                                                          });

                                                          //code here
                                                        } else if (itemSelected ==
                                                            "4") {
                                                          chatReference
                                                              .doc(snapshot
                                                                  .data
                                                                  .docs[index]
                                                                  .id)
                                                              .delete()
                                                              .then(
                                                                  (value) => {
                                                                        Navigator.of(context)
                                                                            .pop()
                                                                      });
                                                          //code here
                                                        } else {
                                                          Clipboard.setData(
                                                              new ClipboardData(
                                                                  text: message
                                                                              .text !=
                                                                          null
                                                                      ? message
                                                                          .text
                                                                      : ''));

                                                          //code here
                                                        }
                                                      });
                                                      */
/*Alert(
                                                          context: context,
                                                          type:
                                                              AlertType.warning,
                                                          onWillPopActive: true,
                                                          title: "Actions",
                                                          desc:
                                                              "What do you want to do?",
                                                          buttons: [
                                                            DialogButton(
                                                              child: Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              onPressed: () => {
                                                                chatReference
                                                                    .doc(snapshot
                                                                        .data
                                                                        .docs[
                                                                            index]
                                                                        .id)
                                                                    .delete()
                                                                    .then(
                                                                        (value) =>
                                                                            {
                                                                              Navigator.of(context).pop()
                                                                            })
                                                              },
                                                              color: appTheme
                                                                  .primaryColor,
                                                              width: 100,
                                                            ),
                                                            DialogButton(
                                                              child: Text(
                                                                "Copy",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              onPressed: () => {
                                                                Clipboard.setData(new ClipboardData(
                                                                    text: message.text !=
                                                                            null
                                                                        ? message
                                                                            .text
                                                                        : '')),
                                                                Navigator.pop(
                                                                    context)
                                                              },
                                                              color: appTheme
                                                                  .primaryColor,
                                                              width: 100,
                                                            ),
                                                          ],
                                                        ).show()*//*

                                                    }
                                                  },
                                                ),
                                                !isMe
                                                    ? Row(
                                                        children: [
                                                          Opacity(
                                                            opacity: 0.4,
                                                            child: Text(
                                                              timeText,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .scaffoldBackgroundColor),
                                                            ),
                                                          ),
                                                          seen
                                                              ? Opacity(
                                                                  opacity: 0.4,
                                                                  child: Text(
                                                                    ' seen ',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .caption
                                                                        .copyWith(
                                                                            color:
                                                                                Theme.of(context).scaffoldBackgroundColor),
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ],
                                                      )
                                                    : Container()
                                              ],
                                            );
                                          });
                                    } else {
                                      return Container(
                                        child: Center(
                                          child: Text(''),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
                            }),
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: replyText != null ||
                        replyVideo != null ||
                        replyPhoto != null,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 0, right: 0, bottom: 0),
                      padding: EdgeInsets.only(left: 5),
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //       borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.fireContact.fName + ": ",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                  replyVideo != null
                                      ? Container(
                                          margin: EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              3,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: Offset(1, 1),
                                                    spreadRadius: 2,
                                                    color: Colors.grey)
                                              ]),
                                          child: Stack(
                                            children: [
                                              SizedBox.expand(
                                                child: ClipRRect(
                                                  child: Image.network(
                                                      replyVideo,
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.play_circle_outline,
                                                  size: 70,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  replyPhoto != null
                                      ? Container(
                                          margin: EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              3,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: Offset(1, 1),
                                                    spreadRadius: 2,
                                                    color: Colors.grey)
                                              ]),
                                          child: ClipRRect(
                                            child: Image.network(replyPhoto,
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ))
                                      : Container(),
                                  Text(
                                    replyText != null ? replyText : "",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Icon(Icons.close),
                              onTap: () {
                                setState(() {
                                  replyPhoto = null;
                                  replyVideo = null;
                                  replyText = null;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 4),
                    child: Stack(
                      children: [
                        TextField(
                          controller: _messageController,
                          onChanged: (text) {
                            setState(() {
                              currentText = text;
                            });
                          },
                          decoration: InputDecoration(
                            counter: null ?? Offstage(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.insert_emoticon),
                            hintText: locale.typeYourMessage,
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        attachFile = true;
                                        attachFileWidth =
                                            MediaQuery.of(context).size.width;
                                      });
                                    },
                                    icon: Icon(Icons.attach_file, size: 22)),

                                */
/* IconButton(
                                  onPressed: () {
                                    getImage().then((value) {
                                      if (value != null) {
                                        String time = DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString();

                                        FireMessage fireMessage = FireMessage(
                                            sender: fireUser.uid,
                                            time: time,
                                            photo: value);

                                        chatReference
                                            .add(fireMessage.toMap(fireMessage));

                                        // DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).hour;

                                        Future.delayed(
                                            Duration(milliseconds: 300), _scroll());
                                      }
                                      //   sendMessage(fireUser.uid, null, value)
                                    });
                                  },
                                  icon: Icon(
                                    Icons.photo,
                                    size: 22,
                                    color: Theme.of(context).primaryColor,
                                  )),*//*

                                currentText == '' || currentText == null
                                    ? () {
                                        if (chatReference != null) {
                                          chatReference.parent.set(
                                              {fireUser.uid: false},
                                              SetOptions(merge: true));
                                        }
                                        return GestureDetector(
                                          onLongPressStart: (det) => {
                                            setState(() {
                                              isRecording = true;
                                            }),
                                            recordAudio()
                                          },
                                          onLongPressEnd: (det) async {
                                            setState(() {
                                              this.isRecording = false;
                                            });
                                            bool isRecording =
                                                await Record.isRecording();
                                            if (isRecording) {
                                              await Record.stop();
                                              Reference userStorageReference =
                                                  FirebaseStorage.instance
                                                      .ref()
                                                      .child(Constants
                                                          .FIRESTORE_USERS)
                                                      .child(widget
                                                          .fireContact.uid);
                                              String path =
                                                  await (await userStorageReference
                                                          .child("messages")
                                                          .child(File(audioName)
                                                              .path
                                                              .split('/')
                                                              .last)
                                                          .putFile(
                                                              File(audioName)))
                                                      .ref
                                                      .getDownloadURL();
                                              String time = DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString();

                                              FireMessage fireMessage =
                                                  FireMessage(
                                                      sender: fireUser.uid,
                                                      time: time,
                                                      audio: path);

                                              chatReference.add(fireMessage
                                                  .toMap(fireMessage));

                                              // DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).hour;

                                              Future.delayed(
                                                  Duration(milliseconds: 300),
                                                  _scroll());
                                            }
                                          },
                                          child: IconButton(
                                              onPressed: () => {
                                                    //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AudioApp()))
                                                    //     recordAudio()

                                                    */
/* sendMessage(
                                            fireUser.uid, _messageController.text,null),
                                        _messageController.clear(),
                                        myFocusNode.requestFocus()*//*

                                                  },
                                              icon: Icon(
                                                Icons.mic,
                                                size: 22,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              )),
                                        );
                                      }()
                                    : () {
                                        if (chatReference != null) {
                                          chatReference.parent.set(
                                              {fireUser.uid: true},
                                              SetOptions(merge: true));
                                        }
                                        return IconButton(
                                            onPressed: () {
                                              sendMessage(fireUser.uid,
                                                  _messageController.text);
                                              _messageController.clear();
                                              myFocusNode.requestFocus();
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.send,
                                              size: 22,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ));
                                      }(),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          autofocus: false,
                          focusNode: myFocusNode,
                          onTap: () {
                            _scroll();
                          },
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 60,
                          width: attachFileWidth,
                          margin: EdgeInsets.only(right: 46),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              //    buildIconButton(context, Icons.insert_drive_file),
                              //    buildIconButton(context, Icons.headset_mic),
                              //     buildIconButton(context, Icons.perm_contact_calendar),
                              buildIconButton(context, Icons.location_on,
                                  onPress: () async {
                                String time = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString();

                                Position pos = await _getCurrentLocation();
                                FireMessage fireMessage = FireMessage(
                                    sender: fireUser.uid,
                                    time: time,
                                    longitude: pos.longitude,
                                    latitude: pos.latitude);

                                chatReference
                                    .add(fireMessage.toMap(fireMessage));
                              }),
                              buildIconButton(context, Icons.photo,
                                  onPress: () {
                                getImage().then((value) {
                                  if (value != null) {
                                    String time = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();

                                    FireMessage fireMessage = FireMessage(
                                        sender: fireUser.uid,
                                        time: time,
                                        photo: value);

                                    chatReference
                                        .add(fireMessage.toMap(fireMessage));

                                    // DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).hour;

                                    Future.delayed(
                                        Duration(milliseconds: 300), _scroll());
                                  }
                                  //   sendMessage(fireUser.uid, null, value)
                                });
                              }),
                              buildIconButton(context, Icons.videocam,
                                  onPress: () {
                                getVideo().then((value) {
                                  if (value != null) {
                                    print(value[1]);
                                    print(value[0]);
                                    String time = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();

                                    FireMessage fireMessage = FireMessage(
                                        sender: fireUser.uid,
                                        time: time,
                                        video: value[0],
                                        videoThumb: value[1]);

                                    chatReference
                                        .add(fireMessage.toMap(fireMessage));

                                    // DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).hour;

                                    Future.delayed(
                                        Duration(milliseconds: 300), _scroll());
                                  }
                                  //   sendMessage(fireUser.uid, null, value)
                                });
                                */
/*   Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MyApp()));*//*

                              }),
                              Spacer(),
                              buildIconButton(context, Icons.close,
                                  onPress: () {
                                setState(() {
                                  attachFileWidth = 0;
                                });
                              }),
                            ],
                          ),
                        ),
                        isRecording
                            ? Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width - 50,
                                margin: EdgeInsets.only(right: 46),
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: RecordTimeWidget(),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    Position currentPosition = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return currentPosition;
  }

  sendMessage(String uid, String text) {
    if (text != null && text != '') {
      print(text);
      String time = DateTime.now().millisecondsSinceEpoch.toString();

      FireMessage fireMessage = FireMessage(
          sender: uid,
          text: text,
          time: time,
          seen: isContactOnline,
          replyPhoto: replyPhoto,
          replyText: replyText,
          replyVideo: replyVideo);

      chatReference.add(fireMessage.toMap(fireMessage));

      // DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).hour;

      Future.delayed(Duration(milliseconds: 300), _scroll());

      Map<String, dynamic> chatMessageMap = {
        "sendby": widget.fireContact.fName + widget.fireContact.lName,
        "message": text,
        'imageurl': widget.fireContact.thumb,
      };
      sendNotification(chatMessageMap);
    }
  }

  Future<void> sendNotification(Map<String, dynamic> chatMessageMap) async {
    FirebaseFirestore.instance
        .collection("users")
        .document(widget.fireContact.uid)
        .snapshots()
        .forEach((element) async {
      String deviceId = element.data()["deviceid"];

      chatMessageMap.addAll({
        "deviceid": deviceId,
      });

      FirebaseFirestore.instance
          .collection("notifications")
          .add(chatMessageMap);
    });
  }

  Future<Query> addNewChat(FireUser fireUser, FireUser fireContact) async {
    Map<String, dynamic> chatMap = {
      "participants": [fireUser.uid, fireContact.uid],
      "id": widget.fireContact.uid + fireUser.uid,
      fireUser.uid: false,
      fireContact.uid: false
    };

    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection(Constants.FIRESTORE_CHATS)
        .add(chatMap);
    setState(() {
      chatReference =
          documentReference.collection(Constants.FIRESTORE_MESSAGES);
    });

    chatReference.parent.snapshots().listen((event) {
      setState(() {
        isTyping = event.data()[fireContact.uid] ?? false;
      });
    });
    */
/* chatReference.parent.snapshots().listen((event) {
      setState(() {
        isContactOnline = event.data()[widget.fireContact];
      });
    });*//*

    return chatReference.orderBy('time',descending: true);
  }

  Future<Query> getChatRoom(FireUser fireUser, FireUser fireContact) async {
    print('CALLED');
    Query query;
    try {
      query = FirebaseFirestore.instance
          .collection(Constants.FIRESTORE_CHATS)
          .where("id", whereIn: [
        widget.fireContact.uid + fireUser.uid,
        fireUser.uid + widget.fireContact.uid
      ]).limit(1);
    } catch (e) {
      print(query.toString());
    }
    print(fireUser.uid);
    QuerySnapshot querySnapshot = await query.get();
    if (querySnapshot.docs.length < 1) {
      print("newchatroom");
      return addNewChat(fireUser, fireContact);
    } else {
      print("old");
      setState(() {
        chatReference = querySnapshot.docs[0].reference
            .collection(Constants.FIRESTORE_MESSAGES);
      });

      chatReference.parent.snapshots().listen((event) {
        setState(() {
          isTyping = event.data()[fireContact.uid] ?? false;
        });
      });
      */
/*  querySnapshot.docs[0].reference.snapshots().listen((event) {

        setState(() {
          isContactOnline = event.data()[widget.fireContact];
        });
      });*//*

      return chatReference.orderBy('time',descending: true);
    }
  }

  _scroll() {
   */
/* double maxExtent = _controller.position.maxScrollExtent;
    double distanceDifference = maxExtent - _controller.offset;
    double durationDouble = distanceDifference / 100;
*//*

    _controller.animateTo(0.0,//_controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  Future<List<String>> getVideo() async {
    setState(() {
      //   uploadingImage = true;
    });
    PermissionStatus permission2 = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission2 == PermissionStatus.granted) {
      FilePickerResult result = await FilePicker.platform
          .pickFiles(type: FileType.video, allowMultiple: false);

      print(result.files.first.path + 'hellopp');

      if (result.files != null) {
        print('hellopp');
        //  setState(() {
        //     _image = File(pickedFile.path);
        return uploadVideo(File(result.files.first.path));
        //   });
      } else {}
    } else {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      permissionStatus.forEach((key, value) async {
        if (value == PermissionStatus.granted) {
          FilePickerResult result = await FilePicker.platform
              .pickFiles(type: FileType.video, allowMultiple: false);

          print(result.files.first.path + 'hellopp');

          if (result.files != null) {
            print('hellopp');
            //  setState(() {
            //     _image = File(pickedFile.path);
            return uploadVideo(File(result.files.first.path));

            //   });
          } else {}
        } else {}
      });
    }
  }

  Future<List<String>> uploadVideo(File videoFile) async {
    //  ImageTools.Image imageFile = ImageTools.decodeImage(file.readAsBytesSync());

    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    //  ImageTools.Image thumbnail = ImageTools.copyResize(imageFile, width: 400);

    // Save the thumbnail as a PNG.
    //  File _thumbFile = File('/storage/emulated/0/sendfile.png')
    //    ..writeAsBytesSync(ImageTools.encodePng(thumbnail));
    EasyLoading.show(status: 'Uploading Video...', dismissOnTap: false);
    var uint8list = await VideoThumbnail.thumbnailFile(
      video: videoFile.path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 512,
      // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    File thumbFile = File(uint8list);

    Reference userStorageReference = FirebaseStorage.instance
        .ref()
        .child(Constants.FIRESTORE_USERS)
        .child(widget.fireContact.uid);
    UploadTask task = userStorageReference
        .child("messages")
        .child(videoFile.path.split('/').last)
        .putFile(videoFile);

    */
/*.onDone(() {
      EasyLoading.dismiss();

    })*//*

    ;
    task.asStream().listen((event) {
      if (event.state != TaskState.running) {
        EasyLoading.dismiss();
      }
    });

    String videoPath = await task.snapshot.ref.getDownloadURL();

    String thumbPath = await (await userStorageReference
            .child("messages")
            .child("thumb" + thumbFile.path.split('/').last)
            .putFile(thumbFile))
        .ref
        .getDownloadURL();
    return [videoPath, thumbPath];
  }

  Future<String> getImage() async {
    setState(() {
      //   uploadingImage = true;
    });
    PermissionStatus permission2 = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    ImagePicker picker = ImagePicker();
    if (permission2 == PermissionStatus.granted) {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        //  setState(() {
        //     _image = File(pickedFile.path);
        return uploadFile(File(pickedFile.path));
        //   });
      } else {}
    } else {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      permissionStatus.forEach((key, value) async {
        if (value == PermissionStatus.granted) {
          final pickedFile = await picker.getImage(source: ImageSource.gallery);

          if (pickedFile != null) {
            //    setState(() {
            //     _image = File(pickedFile.path);
            return uploadFile(File(pickedFile.path));
            //   });
          } else {}
        } else {}
      });
    }
  }

  Future<String> uploadFile(File file) async {
    //  ImageTools.Image imageFile = ImageTools.decodeImage(file.readAsBytesSync());

    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    //  ImageTools.Image thumbnail = ImageTools.copyResize(imageFile, width: 400);

    // Save the thumbnail as a PNG.
    //  File _thumbFile = File('/storage/emulated/0/sendfile.png')
    //    ..writeAsBytesSync(ImageTools.encodePng(thumbnail));

    Reference userStorageReference = FirebaseStorage.instance
        .ref()
        .child(Constants.FIRESTORE_USERS)
        .child(widget.fireContact.uid);
    String path = await (await userStorageReference
            .child("messages")
            .child(file.path.split('/').last)
            .putFile(file))
        .ref
        .getDownloadURL();
    return path;
  }

  String tempPath;
  String audioName;

  recordAudio() async {
    Directory tempDir = await getTemporaryDirectory();
    tempPath = tempDir.path;

    String time = DateTime.now().millisecondsSinceEpoch.toString();
    Map<PermissionGroup, PermissionStatus> permissionStatus =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.microphone]);
    //   bool result = await Record.hasPermission();

// Start recording
    if (permissionStatus[PermissionGroup.microphone].value == 1) {
      audioName = '$tempPath/aud$time.aac';
      await Record.start(
        path: audioName, // required
        encoder: AudioEncoder.AAC, // by default
        bitRate: 128000, // by default
        samplingRate: 44100, // by default
      );
    }
  }
}

class RecordTimeWidget extends StatefulWidget {
  @override
  _RecordTimeWidgetState createState() => _RecordTimeWidgetState();
}

class _RecordTimeWidgetState extends State<RecordTimeWidget> {
  Timer _timer;
  int _start = 0;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 120) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.mic,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text("$_start", style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 10,
          ),
          Text(
            "Recording Audio...",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String image;
  final String time;

  DetailScreen({this.image, this.time});

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return GestureDetector(
      child: Container(
        child: Hero(
          tag: time,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fitWidth,
            placeholder: (context, s) => LoaderTransparent(),
            //      errorWidget: new Icon(Icons.error),
          ),
        ),
      ),
      onTap: () {
        timeDilation = 1.0;
        Navigator.pop(context);
      },
    );
  }
}

class MessageBubble extends StatefulWidget {
  final bool isMe;
  final String text;
  final String time;
  final bool isDelivered;
  final bool seen;
  final String image;
  final String audio;
  final FireUser sender;
  final double longitude;
  final double latitude;
  final String video;
  final String videoThumb;
  final String timeInMilli;
  final FireMessage fireMessage;

  MessageBubble(
      {this.text,
      this.time,
      this.isMe,
      this.sender,
      this.isDelivered,
      this.image,
      this.fireMessage,
      this.audio,
      this.seen = false,
      this.latitude,
      this.longitude,
      this.video,
      this.videoThumb,
      this.timeInMilli});

  @override
  State<StatefulWidget> createState() {
    return MessageBubbleState();
  }
}

class MessageBubbleState extends State<MessageBubble> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    // print(time+"timehere");
    if (widget.longitude != null) {
      return GestureDetector(
        onTap: () {
          _launchMapsUrl(widget.latitude, widget.longitude);
        },
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.width * 1 / 3,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: ClipRRect(
                      child: Image.asset('assets/map.PNG', fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            )),
      );
    }
    if (widget.video != null) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MyApp(video: widget.video, time: widget.timeInMilli);
          })).then((value) => {timeDilation = 1.0});
        },
        child: Hero(
          tag: widget.timeInMilli,
          child: Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 2 / 3,
            height: MediaQuery.of(context).size.width * 2 / 3,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      offset: Offset(1, 1),
                      spreadRadius: 2,
                      color: Colors.grey)
                ]),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: ClipRRect(
                    child: FadeInImage(image: NetworkImage(widget.videoThumb), fit: BoxFit.cover,placeholder: AssetImage('assets/chappreylogowhite.gif'),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 70,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    if (widget.audio != null) {
      print(widget.audio);
      return AudioPlayerWidget(audioUrl: widget.audio);
    }
    if (widget.image != null) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(image: widget.image, time: widget.timeInMilli);
          })).then((value) => {timeDilation = 1.0});
        },
        child: Hero(
          tag: widget.timeInMilli,
          child: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.width * 2 / 3,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                        color: Colors.grey)
                  ]),
              child: ClipRRect(
                child: FadeInImage(image: NetworkImage(widget.image), fit: BoxFit.cover,placeholder: AssetImage('assets/chappreylogowhite.gif'),),

                borderRadius: BorderRadius.circular(10),
              )),
        ),
      );
    }
    if (widget.text != null) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 2 / 3),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: (widget.fireMessage.replyText != null ||
                        widget.fireMessage.replyVideo != null ||
                        widget.fireMessage.replyPhoto != null)
                    ? BorderRadius.circular(10.0)
                    : BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: widget.isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: widget.fireMessage.replyText != null ||
                        widget.fireMessage.replyVideo != null ||
                        widget.fireMessage.replyPhoto != null,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 0, right: 0, bottom: 0),
                      padding: EdgeInsets.only(left: 5),
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.sender.fName + ": ",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            widget.fireMessage.replyVideo != null
                                ? Container(
                                    margin: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width *
                                        2 /
                                        3,
                                    height: MediaQuery.of(context).size.width *
                                        2 /
                                        3,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              offset: Offset(1, 1),
                                              spreadRadius: 2,
                                              color: Colors.grey)
                                        ]),
                                    child: Stack(
                                      children: [
                                        SizedBox.expand(
                                          child: ClipRRect(
                                            child: Image.network(
                                                widget.fireMessage.replyVideo,
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        Center(
                                          child: Icon(
                                            Icons.play_circle_outline,
                                            size: 70,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            widget.fireMessage.replyPhoto != null
                                ? Container(
                                    margin: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width *
                                        2 /
                                        3,
                                    height: MediaQuery.of(context).size.width *
                                        2 /
                                        3,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              offset: Offset(1, 1),
                                              spreadRadius: 2,
                                              color: Colors.grey)
                                        ]),
                                    child: ClipRRect(
                                      child: Image.network(
                                          widget.fireMessage.replyPhoto,
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ))
                                : Container(),
                            Text(
                              widget.fireMessage.replyText != null
                                  ? widget.fireMessage.replyText
                                  : "",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.text,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Opacity(
              opacity: 0.4,
              child: Text(
                widget.time,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
            widget.seen
                ? Opacity(
                    opacity: 0.4,
                    child: Text(
                      ' seen ',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  )
                : Container(),
          ],
        )
        */
/* : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                (image == null)
                    ? Container(
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 2 / 3),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      )
                    : Container(),
                image != null
                    ? GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) {
                          return DetailScreen(image: image, time: time);
                        })).then((value) => {timeDilation = 1.0});
                  },
                  child: Hero(
                      tag: time,
                      child:

                      Container(
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 2 / 3),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(image, fit: BoxFit.fitWidth),
                            (text != null && text != "")
                                ? Text(
                                    text,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  )
                                : Container(),
                          ],
                        ))
                  ))
                    : Container(),
                SizedBox(width: 12.0),
                Opacity(
                  opacity: 0.4,
                  child: Text(
                    time,
                    style: Theme.of(context).textTheme.caption.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                )
              ],
            ),*//*

        );
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
*/
