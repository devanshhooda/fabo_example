import 'package:flutter/material.dart';
import '../sizeConfig.dart';

TextStyle _nameStyle = new TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 7,
    color: Colors.deepPurple[900],
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic);
TextStyle _addressStyle = new TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 5,
    color: Colors.deepPurple[900],
    fontWeight: FontWeight.w500);
TextStyle _adDetailStyle = new TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.7,
    color: Colors.deepPurple[700],
    fontWeight: FontWeight.w400,
    wordSpacing: 2,
    letterSpacing: 2);
String imageUrl = 'assets/cris.jpeg';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple[200], Colors.white],
                radius: 1)),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 15,
              ),
              alignment: Alignment.center,
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ExtendedImage();
                  }));
                },
                child: new Hero(tag: 1, child: profilePhoto()),
              ),
            ),
            info(context),
          ],
        ),
      ),
      floatingActionButton: new Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 5,
            right: SizeConfig.safeBlockHorizontal * 5),
        child: new FloatingActionButton(
          onPressed: () => print('Geolocation Should be printed'),
          child: Icon(Icons.location_on),
        ),
      ),
    );
  }
}

Widget profilePhoto() {
  return new CircleAvatar(
    radius: SizeConfig.blockSizeVertical * 15,
    backgroundColor: Colors.grey[300],
    backgroundImage: AssetImage(
      imageUrl,
    ),
  );
}

Widget info(BuildContext context) {
  return new Container(
    child: new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
          child: new Text(
            'Chris Evans',
            style: _nameStyle,
          ),
        ),
        new Container(
          padding: new EdgeInsets.only(
              right: SizeConfig.safeBlockHorizontal * 60,
              top: SizeConfig.safeBlockVertical * 3),
          child: new Text(
            'Address : ',
            style: _addressStyle,
          ),
        ),
        new Container(
          padding: new EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 13,
              right: SizeConfig.safeBlockHorizontal * 10,
              top: SizeConfig.safeBlockVertical * 1.5),
          child: new Text(
            '3 Arts Entertainment 9460 Wilshire Blvd. 7th Floor Beverly Hills, CA 90212 USA',
            style: _adDetailStyle,
          ),
        )
      ],
    ),
  );
}

class ExtendedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragDown: (DragDownDetails dragDownDetails) {
          Navigator.pop(context);
        },
        child: Center(
            child: new Container(
          height: SizeConfig.blockSizeVertical * 45,
          width: SizeConfig.blockSizeVertical * 45,
          color: Colors.white,
          child: Hero(
              tag: 1,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              )),
        )),
      ),
    );
  }
}
