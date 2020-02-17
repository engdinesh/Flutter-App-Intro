import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class RecentFriendsPageView extends StatefulWidget {
  @override
  _RecentFriendsPageViewState createState() => _RecentFriendsPageViewState();
}

class _RecentFriendsPageViewState extends State<RecentFriendsPageView> {
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
                name: 'Priya',
                assetName: 'dancing.jpg',
                offset: pageOffset,
              ),
              SlidingCard(
                name: 'Dinesh',
                assetName: 'me.jpg',
                offset: pageOffset - 2,
              ),
              SlidingCard(
                name: 'Sonu',
                assetName: 'photography.jpg',
                offset: pageOffset - 2,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(100),
              bottom: Radius.circular(100)),
          child: new Container(
              height: 70,
              width: 70,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new AssetImage('assets/$assetName'),
                    fit: BoxFit.fill
                ),
              ),
              alignment: Alignment(0.0, 0.0),
              child: new Container(
                child: new Text('$name',style: TextStyle(color: Colors.white,fontSize: 16),),
                alignment: Alignment.center,
                decoration: BoxDecoration( shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.6),),
              )
          ),
        ),
      ),
    );
  }
}
