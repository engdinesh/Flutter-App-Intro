import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'filter_page.dart';
import 'dart:math' as math;

class SearchPageView extends StatelessWidget {

  var fruits = ["Within 2 mi","Luxury", "Schools","Security"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            new Container(
                margin: EdgeInsets.fromLTRB(15,20,20,10),
                child:new Row( children: <Widget>[
                  SuggestionCard(value:'Within 2 mi'),
                  SuggestionCard(value:'Luxury'),
                  SuggestionCard(value:'Schools'),
                  SuggestionCard(value:'Security'),
                ],)),
            PropertyList(),

          ],),
        FilterPageView()
      ],)

    );
  }
}

class PropertyList extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.70 ,
      child :new ListView(
         children: <Widget>[
           SlidingCard(
             price: '\$4,999',
             area: '1,200 sq.ft',
             feature: '4 Beds - 2 Bath',
             address: '253-A Bengaluru',
             assetName: 'home2.png',
           ),
           SlidingCard(
             price: '\$2,992',
             area: '1,499 sq.ft',
             feature: '3 Beds - 2 Bath',
             address: '24 Delhi',
             assetName: 'sofa1.png',
           ),
           SlidingCard(
             price: '\$2,299',
             area: '1,099 sq.ft',
             feature: '3 Beds - 2 Bath',
             address: '38-B Pune',
             assetName: 'table2.png',
           ),
         ],
       ),
     );
  }

}



class SlidingCard extends StatelessWidget {
  SlidingCard({this.price,this.area,this.feature,this.address,this.assetName});

  final String price;
  final String area;
  final String feature;
  final String address;
  final String assetName;


  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20),
                  bottom: Radius.circular(20)),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10,10,10,0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    area,
                    style: new TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                  ),
                  SizedBox(width:4),
                  new Text(
                    feature,
                    style: new TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                  ),
                Spacer(),
                new Text(
                price,
                style: new TextStyle(fontSize: 22.0, color: Colors.pink,
                    fontWeight: FontWeight.bold),
              )
                ],
              ),
            ),
            new Container(
                margin: EdgeInsets.fromLTRB(10,5,10,0),
                child: new Row(
                children: <Widget>[
                  new Icon(Icons.location_on,size: 16, color: Colors.pink),
                  new Text(address, style: new TextStyle(fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[400]),)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class SuggestionCard extends StatelessWidget {
  SuggestionCard({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        padding: EdgeInsets.all(5),
        child: Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.indigo)
        ),
        decoration: new BoxDecoration (
          borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
          border: Border.all(color: Colors.indigo, width: 1.6),
        ),
    );
  }
}
