import 'package:fabo_example_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: new ListView(
          children: <Widget>[
            _categories('Categories', 'Service'),
            _categories('Recommended for you', 'Service'),
            _categories('Special offers', 'Service'),
            _categories('Top offers', 'Service'),
            _categories('Favourites', 'Service'),
          ],
        ),
      ),
    );
  }
}

Widget _categories(String title, String subtitle) {
  return new Container(
    padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 0.5,
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        bottom: SizeConfig.safeBlockVertical * 0.5),
    child: new Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 40.0,
                  spreadRadius: 5.0,
                  offset: Offset(
                    10.0,
                    30.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(200, 255, 255, 255),
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            children: <Widget>[
              new FlatButton(
                onPressed: () => print('$title page'),
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 3),
                    ),
                    new Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.5),
                    ),
                    new Icon(
                      Icons.chevron_right,
                      size: SizeConfig.safeBlockVertical * 3,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _services(String subtitle) {
  return new Container(
      padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 2,
          bottom: SizeConfig.safeBlockHorizontal * 2),
      height: SizeConfig.blockSizeVertical * 17,
      width: SizeConfig.blockSizeHorizontal * 38,
      child: new GestureDetector(
        onTap: () => print('Details of Service'),
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
              ),
              new FlutterLogo(
                size: SizeConfig.blockSizeVertical * 9,
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
              ),
              new Text(
                subtitle,
                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
              )
            ],
          ),
        ),
      ));
}
