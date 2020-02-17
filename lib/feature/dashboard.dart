import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/saved_page.dart';
import 'account.dart';
import 'explore_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPagePageState createState() => _DashboardPagePageState();
}

class _DashboardPagePageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;
  int _currentIndex = 0;
  List<Widget> tabs = [
    new ExplorePage(),
    new SavedPageView(),
    new AccountPageView()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Set the TabBar view as the body of the Scaffold
      body: tabs[_currentIndex],
      drawer: Drawer(child: Column(children: <Widget>[
        ListTile(leading: Icon(Icons.home,size: 25,color: Colors.pink,),
          title: Text("Home",style: TextStyle(fontSize: 18,color: Colors.pink),),),
        ListTile(leading: Icon(Icons.supervised_user_circle,size: 25,color: Colors.pink,),
          title: Text("Profile",style: TextStyle(fontSize: 18,color: Colors.pink),),),
        ListTile(leading: Icon(Icons.email,size: 25,color: Colors.pink,),
          title: Text("Email",style: TextStyle(fontSize: 18,color: Colors.pink),),)
      ],)),
      // Set the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.search, size: 22, color: _currentIndex == 0
                  ? Colors.pink
                  : Colors.black),
              title: new Text('Explore',
                  style: new TextStyle(
                      fontSize: 12, fontStyle: FontStyle.normal,
                      color: _currentIndex == 0 ? Colors.pink : Colors.black,
                      fontFamily: "Roboto"))
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite_border, size: 22,
                  color: _currentIndex == 1 ? Colors.pink : Colors.black),
              title: new Text('Saved',
                  style: new TextStyle(
                      fontSize: 12, fontStyle: FontStyle.normal,
                      color: _currentIndex == 1 ? Colors.pink : Colors.black,
                      fontFamily: "Roboto"))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account, size: 22,
                  color: _currentIndex == 2 ? Colors.pink : Colors.black),
              title: Text('Account',
                  style: new TextStyle(
                      fontSize: 12, fontStyle: FontStyle.normal,
                      color: _currentIndex == 2 ? Colors.pink : Colors.black,
                      fontFamily: "Roboto"))
          )
        ],
      ),

    );
  }
}
