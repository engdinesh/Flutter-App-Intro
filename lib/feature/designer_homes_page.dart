import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class DesignerHomesView extends StatefulWidget {
  @override
  _DesignerHomesViewState createState() => _DesignerHomesViewState();
}

class _DesignerHomesViewState extends State<DesignerHomesView> {
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
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: PageController(
          viewportFraction: 0.8,
          initialPage: 0,
        ),
        children: <Widget>[
          SlidingCard(
            price: '\$1,251 - 5,299',
            assetName: 'home1.png',
            offset: pageOffset,
          ),
          SlidingCard(
            price: '\$4,299',
            assetName: 'sofa2.png',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            price: '\$4,299',
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
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.price,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20),
              bottom: Radius.circular(20)),
              child: Image.asset(
              'assets/$assetName',
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.90,
              fit: BoxFit.fill,
              ),
          ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String price;
  final double offset;

  const CardContent(
      {Key key,
        @required this.price,
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
        ],
      ),
    );
  }
}