import 'package:flutter/material.dart';
import '../appBar.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: app_Bar(context),
      body: new Container(
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
    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
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
    padding: EdgeInsets.all(5),
    child: new Container(
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      height: 125,
      width: 125,
      child: new FlutterLogo(
        size: 50,
      ),
    ),
  );
}

Widget _details(String serviceName, String providerName, double price) {
  return new Container(
    padding: EdgeInsets.all(15),
    child: new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
            right: 50,
          ),
          child: new Text(
            serviceName,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(bottom: 30, right: 40),
          child: new Text(
            providerName,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
        new Container(
            // padding: EdgeInsets.only(right: 100),
            child: new Row(
          children: <Widget>[
            new Text(
              '\$$price',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
            ),
            new IconButton(
              onPressed: () => print('Location of service will be shown'),
              icon: Icon(Icons.location_on, color: Colors.deepPurple,),
              iconSize: 30,
            ),
          ],
        ))
      ],
    ),
  );
}
