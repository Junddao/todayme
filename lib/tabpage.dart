import 'package:flutter/material.dart';
import 'package:todayme/model/menu_item.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  PageController _pageController;

  List items = [
    MenuItem(x: 0, name: 'rive_one.flr', color: Colors.blueAccent),
    MenuItem(x: 1, name: 'rive_two.flr', color: Colors.yellowAccent),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(left:0, right: 0, top: 0, bottom: 0, child: PageView(
            controller: _pageController,
            children: items.map((item){
              return _page(item);
            }).toList(),
          ),)
      ],),

    );
  }

  Widget _page(MenuItem item) => Container(color: item.color,);
}