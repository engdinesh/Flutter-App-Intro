import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class JustInPageView extends StatefulWidget {
  @override
  _JustInPageViewState createState() => _JustInPageViewState();
}

class _JustInPageViewState extends State<JustInPageView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.9);
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
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: PageController(
          viewportFraction: 0.6,
          initialPage: 0,
        ),
        children: <Widget>[
          SlidingCard(
            price: '\$1,251 - 5,299',
            feature: '1-4 Beds, 1-2 Baths',
            address: '253-A Bengaluru',
            assetName: 'home1.png',
            offset: pageOffset,
          ),
          SlidingCard(
            price: '\$4,299',
            feature: '5 Beds, 2 Baths',
            address: '24 Delhi',
            assetName: 'home2.png',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            price: '\$3,299',
            feature: '3 Beds, 2 Baths',
            address: '38-B Pune',
            assetName: 'table1.png',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String price;
  final String feature;
  final String address;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.price,
    @required this.feature,
    @required this.address,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 24),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: CardContent(
                price: price,
                feature: feature,
                address: address,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String price;
  final String feature;
  final String address;
  final double offset;

  const CardContent(
      {Key key,
        @required this.price,
        @required this.feature,
        @required this.address,
        @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height:4),
          Transform.translate(offset: Offset(32 * offset, 0),
            child: Text(
              feature,
              style: TextStyle(color: Colors.grey[600],fontSize: 14),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
          new Icon(Icons.location_on,size: 22,
          color:  Colors.pink ),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  address,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey[400]
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}