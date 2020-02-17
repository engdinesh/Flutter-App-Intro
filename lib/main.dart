import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'feature/dashboard.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(// navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(new MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      home: new MyApp(),
      debugShowCheckedModeBanner: false));

}

/*
class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new IntroScreen();
}


void main() => runApp(new MyApp());
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

//------------------ Custom your own tabs ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Drawing room",
        description: "A drawing room is a room in a house where visitors may be entertained, and a historical term for what would now usually be called a living room. ",
        backgroundImage: "assets/drawingroom1.jpg",
        marginDescription: EdgeInsets.fromLTRB(10, 300, 10, 0)
      ),
    );
    slides.add(
      new Slide(
        title: "Bedroom",
        description: "A bedroom is a room of a house, mansion, castle, palace, hotel, dormitory, apartment, condominium, duplex or townhouse where people sleep.",
        backgroundImage: "assets/bedroom1.jpg",
        marginDescription: EdgeInsets.fromLTRB(10, 300, 10, 0)
      ),
    );
    slides.add(
      new Slide(
        title: "Kitchen",
        description:
        "A kitchen is a room or part of a room used for cooking and food preparation in a dwelling or in a commercial establishment.",
        backgroundImage: "assets/kitchen2.jpg",
        marginDescription: EdgeInsets.fromLTRB(10, 300, 10, 0)
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      colorDot: Color(0x80000000),
      colorActiveDot: Color(0xffffffff),
    );
  }
}