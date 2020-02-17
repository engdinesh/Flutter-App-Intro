import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, Marker> _markers = {};
  Position position=null;
/*  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }*/

  final Geolocator _geolocator = Geolocator();
  String _placemark = '';

  Future<void> _onLookupAddressPressed() async {

    final List<Placemark> placemarks =
    await _geolocator.placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark pos = placemarks[0];
      setState(() {
        _placemark = pos.thoroughfare + ', ' + pos.locality;
      });
    }
  }

/*  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen(
          (Position position) {
        print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
      });*/



  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initLastKnownLocation() async {

    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _onLookupAddressPressed();
    final marker = Marker(
      markerId: MarkerId("You are here"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: InfoWindow(
        title: "You are here",
        snippet: _placemark,
      ),
    );
    _markers["You are here"] = marker;

  }


  Map<String, double> currentLocation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initLastKnownLocation();

  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Near by PropHomes',style: TextStyle(color: Colors.black),),
        backgroundColor: Color.fromRGBO(166,213,205,1),
      ),
      body: Stack(
        children: <Widget>[
          new GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(12.9716, 77.5946) ,
              zoom: 16,
            ),
            markers: _markers.values.toSet(),),
            new Column(
              children: <Widget>[
              Spacer(),
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: position == null
                    ? CircularProgressIndicator()
                    : Text("Current Location :  "+_placemark),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 15,
                ),],),
              )
            ],)


        ],
      ),
    ),
  );
}