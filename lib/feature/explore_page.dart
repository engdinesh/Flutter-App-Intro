import 'dart:async';
import 'package:flutter/material.dart';
import 'just_in_page.dart';
import 'designer_homes_page.dart';
import 'search_page.dart';
import 'package:flutter/services.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String str_password;
  String str_email;
  PageController _pageController;
  DateTime selectedDate = DateTime.now();

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(primaryColor: Colors.pink,accentColor: Colors.pink),
          child: child,
        );
      },);
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(primaryColor: Colors.pink,accentColor: Colors.pink),
          child: child,
        );
      },);
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
            Container(

            ),
            const SizedBox(height: 20),
            new Row(
              children: <Widget>[
                new Container(
                  child: Icon(Icons.location_on, size: 35,
                      color: Colors.pink),
                  margin: EdgeInsets.all(10),
                ),
                new Column (
                  children: <Widget>[
                    new Container(
                        width: 120,
                        child: Text(
                            'Location',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "Roboto")
                        )
                    ),
                    const SizedBox(height: 6),
                    new Container(
                      width: 120,
                      child: Text(
                          'Bengaluru',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Roboto")
                      ),
                    ),
                  ],),
                Spacer(),
                new GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                child: new Container(
                  child: Icon(Icons.date_range, size: 32,
                      color: Colors.pink),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 0),),
                ),
                new GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: new Container(
                    child: Icon(Icons.access_time, size: 32,
                        color: Colors.pink),
                    margin: EdgeInsets.fromLTRB(0, 15, 30, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPageView()),
              );
              },
              child: new Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: EdgeInsets.all(15),
                child: Text(
                    'Search by Location, Area or Pin Code',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Roboto")
                ),
                decoration: new BoxDecoration (
                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                    border: Border.all(color: Colors.grey[200], width: 2),
                    color: Colors.grey[100]
                ),
              ),
              ),

            const SizedBox(height: 20),
            new Row(children: <Widget>[
              new Container(
                child: Text(
                    "Just In", style: TextStyle(fontWeight: FontWeight.bold,
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
            JustInPageView(),
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
