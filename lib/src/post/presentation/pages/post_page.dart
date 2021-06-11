import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../widgets/home_page.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Center(
      child: Text("Explore"),
    ),
    Center(
      child: Text("Reservation"),
    ),
    Center(
      child: Text("Dashboard"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: ElevatedButton(
            child: Icon(Icons.person_outline),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          title: _currentIndex == 2
              ? Text("Reservation")
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "DELIVERING TO",
                      style: TextStyle(color: Colors.black54, fontSize: 10),
                      children: [
                        TextSpan(
                          text: "\nNoble House",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )
                      ]),
                ),
          centerTitle: true,
          actions: [
            Badge(
                badgeContent: Text("3"),
                badgeColor: Color(0xFFFBBB3D),
                position: BadgePosition.bottomEnd(bottom: 10, end: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () {},
                  child: Icon(Icons.shopping_bag),
                ))
          ],
        ),
        body: SafeArea(
          child: _children[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xFFFBBB3D),
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.date_range), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "")
          ],
        ));
  }
}
