import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/screens/chat_ui/chat_home.dart';
import 'package:coach_netic/screens/client_profile.dart';
import 'package:coach_netic/screens/my_coaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../animated_bottom_bar.dart';
import 'client_home.dart';

class ClientBottomBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final User user;

  ClientBottomBar({this.user});

  @override
  _ClientBottomBarState createState() => _ClientBottomBarState();
}

class _ClientBottomBarState extends State<ClientBottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  static String bottomIconHome = 'assets/footermenu/ic_home.png';

  static String bottomIconMessage = 'assets/chat.png';

  static String bottomIconOrder = 'assets/footermenu/ic_orders.png';

  static String bottomIconAccount = 'assets/footermenu/ic_profile.png';


  static String bottomIconHomeact = 'assets/footermenu/ic_homeact.png';

  static String bottomIconMessageaxt = 'assets/chat.png';

  static String bottomIconOrderact = 'assets/footermenu/ic_ordersact.png';

  static String bottomIconAccountact = 'assets/footermenu/ic_profileact.png';

  @override
  Widget build(BuildContext context) {
    final List<BarItem> barItems = [
      BarItem(
        text: "Home",
        image: bottomIconHome,
        imageact: bottomIconHomeact,
      ),
      BarItem(
        text: "Chat",
        image: bottomIconMessage,
        imageact: bottomIconMessageaxt,
      ),
      BarItem(
        text: "Coaches",
        image: bottomIconOrder,
        imageact: bottomIconOrderact,
      ),
      BarItem(
        text: "Profile",
        image: bottomIconAccount,
        imageact: bottomIconAccountact,
      ),
    ];

    final List<Widget> _children = [
      ClientHome(user: widget.user),
      Chat_Home_Page(),
      My_Coaches(),
      ClientProfile(),
    ];
    return Scaffold(
      key: widget.scaffoldKey,
      //  drawer: DrawerWidget(),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
