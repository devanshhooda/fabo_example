import 'package:flutter/material.dart';
import '../sizeConfig.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: new ListView(
          children: <Widget>[
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
            _booking('Service Name', 'Company/Shop Name', 20.99),
          ],
        ),
      ),
    );
  }
}

Widget _booking(String serviceName, String providerName, double price) {
  return new Container(
    padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 1,
        bottom: SizeConfig.safeBlockVertical * 1,
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2),
    child: new Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: new Row(
        children: <Widget>[
          _picture(),
          _details(serviceName, providerName, price)
        ],
      ),
    ),
  );
}

Widget _picture() {
  return new Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
    child: new Container(
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      height: SizeConfig.blockSizeVertical * 14,
      width: SizeConfig.blockSizeHorizontal * 30,
      child: new FlutterLogo(),
    ),
  );
}

Widget _details(String serviceName, String providerName, double price) {
  return new Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
            right: SizeConfig.safeBlockHorizontal * 10,
          ),
          child: new Text(
            serviceName,
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(
              bottom: SizeConfig.safeBlockVertical * 3.5,
              right: SizeConfig.safeBlockHorizontal * 9),
          child: new Text(
            providerName,
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                color: Colors.grey),
          ),
        ),
        new Container(
            child: new Row(
          children: <Widget>[
            new Text(
              '\$ $price',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.safeBlockHorizontal * 4),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 20),
            ),
            new IconButton(
              onPressed: () => print('Location of service will be shown'),
              icon: Icon(
                Icons.location_on,
                color: Colors.deepPurple,
              ),
              iconSize: SizeConfig.safeBlockVertical * 3.5,
            ),
          ],
        ))
      ],
    ),
  );
}
