import 'package:fabo_example_app/appBar.dart';
import 'package:flutter/material.dart';

TextStyle _nameStyle = new TextStyle(
    fontSize: 28,
    color: Colors.deepPurple[900],
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic);
TextStyle _emailStyle = new TextStyle(
    fontSize: 22, color: Colors.deepPurple[900], fontWeight: FontWeight.w500);
TextStyle _addressStyle = new TextStyle(
    fontSize: 20,
    color: Colors.deepPurple[700],
    fontWeight: FontWeight.w400,
    wordSpacing: 2);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: app_Bar(context),
      body: new Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple, Colors.white],
                radius: 0.9)),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(40),
              alignment: Alignment.center,
              child: new GestureDetector(
                child: profilePhoto(),
              ),
            ),
            new Container(
              // padding: EdgeInsets.only(top: 10),
              child: new Text(
                'Cris Evans',
                style: _nameStyle,
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 30, bottom: 5, right: 250),
              child: new Text(
                'Address: ',
                style: _emailStyle,
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: new Text(
                '3 Arts Entertainment 9460 Wilshire Blvd. 7th Floor Beverly Hills, CA 90212 USA',
                style: _addressStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            new Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [Colors.purple, Colors.redAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () => print('Geolocation Should be displayed'),
                child: new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),
                      new Text(
                        'Geolocation',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),
                      new Icon(
                        Icons.location_on,
                        size: 27,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget profilePhoto() {
  return new CircleAvatar(
    radius: 100,
    backgroundColor: Colors.grey[300],
    backgroundImage: AssetImage(
      'assets/cris.jpeg',
    ),
  );
}
