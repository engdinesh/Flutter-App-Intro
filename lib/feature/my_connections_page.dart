import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/recent_friends_page.dart';
import 'just_in_page.dart';
import 'designer_homes_page.dart';
import 'search_page.dart';
import 'saved_page.dart';
import 'package:flutter/services.dart';

class MyConnectionPage extends StatefulWidget {
  @override
  _MyConnectionPageState createState() => _MyConnectionPageState();
}

class _MyConnectionPageState extends State<MyConnectionPage> {
  int _counter = 0;
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String str_password;
  String str_email;
  int _currentIndex = 0;
  PageController _pageController;

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(children: <Widget>[
        new Column(
          children: <Widget>[
            const SizedBox(height: 40),
            new Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Search by Location, Area or Pin Code",
                      fillColor: Colors.grey[100]),
                ),
              ),
            const SizedBox(height: 20),
            new Row(children: <Widget>[
              new Container(
                child: Text(
                    "Recent", style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: "Roboto")),
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
              Spacer(),
              new Container(
                child: Text(
                    "View All", style: TextStyle(fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: "Roboto")),
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              )
            ]),
            const SizedBox(height: 10),
            RecentFriendsPageView(),
            const SizedBox(height: 10),
            new Row(children: <Widget>[
              new Container(
                child: Text("Designer Homes",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: "Roboto")),
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
              Spacer(),
              new Container(
                child: Text(
                    "View All", style: TextStyle(fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: "Roboto")),
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              )
            ]),
            const SizedBox(height: 10),
            new SingleChildScrollView(
                child : DesignerHomesView()
            ),
          ],),
      ],)

    );
  }
}
