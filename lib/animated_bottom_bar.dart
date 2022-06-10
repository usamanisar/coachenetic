import 'package:flutter/material.dart';

import 'colors.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Function onBarTap;

  AnimatedBottomBar({
    this.barItems,
    this.onBarTap,
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  Duration duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Material(

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color:CoColors.darkblue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          duration: duration,
          decoration: BoxDecoration(
              color:/* isSelected
                  ? Colors.white
                  : */Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              ImageIcon(
                AssetImage(item.image),
                color: isSelected
                    ?Colors.white
                    : Colors.grey,
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                duration: duration,
                curve: Curves.easeInOut,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(color: isSelected?Colors.white:Colors.grey,fontWeight:  isSelected?FontWeight.w800:FontWeight.w600),
                  //         style: heading1
                  //         .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return _barItems;
  }
}

class BarItem {
  String text;
  String image;
  String imageact;

  BarItem({this.text, this.image,this.imageact});
}
