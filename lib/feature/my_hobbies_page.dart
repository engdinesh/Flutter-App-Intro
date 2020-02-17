import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class MyHobbiesPageView extends StatefulWidget {
  @override
  _MyHobbiesPageViewState createState() => _MyHobbiesPageViewState();
}

class _MyHobbiesPageViewState extends State<MyHobbiesPageView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.2);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SlidingCard(
                name: 'Dancing',
                assetName: 'dancing.jpg',
                offset: pageOffset,
              ),
              SlidingCard(
                name: 'Painting',
                assetName: 'painting.jpeg',
                offset: pageOffset - 1,
              ),
              SlidingCard(
                name: 'Photography',
                assetName: 'photography.jpg',
                offset: pageOffset - 3,
              ),

            ],),
        ));
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.2), 1) / 0.02));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),
              bottom: Radius.circular(20)),
          /*child: Image.asset(
            'assets/$assetName',
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.50,
            fit: BoxFit.fill,
          ),*/
          child: new Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width * 0.26,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: new DecorationImage(
                    image: new AssetImage('assets/$assetName'),
                    fit: BoxFit.fill
                ),
              ),
              alignment: Alignment(0.0, 0.0),
              child: new Container(
                child: new Text('$name',style: TextStyle(color: Colors.white,fontSize: 16),),
                alignment: Alignment.center,
                decoration: BoxDecoration( shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20),color: Colors.black.withOpacity(0.6),),
              )
          ),
        ),
      ),
    );
  }
}
