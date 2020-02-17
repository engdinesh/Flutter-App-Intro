import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AccountPageView extends StatefulWidget {
  @override
  _AccountPageViewState createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {

  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;

      setState(() {
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }


  @override
  Widget build(BuildContext context)
  {

    int _current = 0;

    return SingleChildScrollView(
    child: Stack(children: <Widget>[
      new Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/photography.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      new Container(
          margin: EdgeInsets.fromLTRB(10,150, 10, 0),
          child: new Icon(Icons.edit, size: 30, color: Colors.grey),
          alignment: Alignment.centerRight,
      ),
      new Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        color: Colors.black.withOpacity(0.2),
          child: new Container(
            padding: EdgeInsets.all(10),
            child: new Icon(Icons.camera_alt, size: 30, color: Colors.white.withOpacity(0.7)),
            alignment: Alignment.bottomRight,
          )
      ),
      new GestureDetector(
        onTap: () {
          _openFileExplorer();
        },
        child: new Container(
            margin: EdgeInsets.fromLTRB(10, 80, 0, 0),
            width: 120,
            height: 120,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: new AssetImage('assets/me.jpg'),
                  fit: BoxFit.contain
              ),
              border: new Border.all(
                color: Colors.white,
                width: 6.0,
              ),
            ),
            alignment: Alignment(0.0, 0.0),
            child: new Container(
              child: new Icon(Icons.camera_alt, size: 34, color: Colors.white.withOpacity(0.7)),
              alignment: Alignment.center,
              decoration: BoxDecoration( shape: BoxShape.circle,color: Colors.black.withOpacity(0.2),),
            )
        ),
      ),
        new Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.fromLTRB(0,180,0,0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: Text(
                    'Dinesh Singh',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black,
                        height: 2)
                ),
              ),
              new Container(
                child: Text(
                    'Product Lead',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[700])
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(0,20,10,0),
                child: Text(
                    'Android   |   Flutter   |   Kotlin',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500])
                ),
              ),
              SizedBox(height: 20),
              new Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.fromLTRB(0,0,4,0),
                        child: new Icon(Icons.favorite_border,size: 18,color: Colors.pink)
                    ),
                    new Container(
                      child: Text(
                          'Like',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink)
                      ),
                    ),
                    new Container(
                        margin: EdgeInsets.fromLTRB(10,0,4,0),
                        child: new Icon(Icons.comment,size: 18,color: Colors.pink)
                    ),
                    new Container(
                      child: Text(
                          'Comment',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink)
                      ),
                    ),
                    new Container(
                        margin: EdgeInsets.fromLTRB(10,0,4,0),
                        child: new Icon(Icons.share,size: 18,color: Colors.pink)
                    ),
                    new Container(
                      child: Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink)
                      ),
                    ),
                  ],

                ),
              ),


            ],

          ),
        ),



      ],
    )
    );
  }
}

