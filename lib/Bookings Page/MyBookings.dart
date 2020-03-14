import 'package:flutter/material.dart';
import '../sizeConfig.dart';

class Bookings extends StatelessWidget {
  String appBarTitle;
  Bookings(String title) {
    appBarTitle = title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('$appBarTitle'),
          backgroundColor: Colors.deepPurpleAccent),
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: new ListView(
          children: <Widget>[
            _itemPicture(),
            _itemDetails('MackBook Air (13 inch)', '2016', 'Laptops'),
            new Container(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 3,
                right: SizeConfig.safeBlockHorizontal * 3,
              ),
              child: Divider(
                thickness: 5,
                height: SizeConfig.blockSizeVertical * 5,
              ),
            ),
            _booking('Apple Provider', '1.2', '80,000'),
            _booking('Apple Provider', '1.2', '80,000'),
          ],
        ),
      ),
    );
  }
}

Widget _itemPicture() {
  return new Container(
    height: SizeConfig.blockSizeVertical * 30,
    // width: SizeConfig.blockSizeHorizontal * 15,
    padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        top: SizeConfig.safeBlockVertical * 1),
    child: new Card(
      elevation: 10,
      color: Colors.black54,
      child: new FlutterLogo(
        size: SizeConfig.blockSizeVertical * 25,
      ),
    ),
  );
}

Widget _itemDetails(String productName, String year, String category) {
  return new Container(
    padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 3,
        top: SizeConfig.safeBlockVertical * 1),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Text(
            productName,
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
          child: new Text(
            'Model Year: $year',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.black54),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
          child: new Text(
            'Category: $category',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}

Widget _booking(String providerName, String address, String price) {
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
        children: <Widget>[_picture(), _details(providerName, address, price)],
      ),
    ),
  );
}

Widget _picture() {
  return new Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: SizeConfig.blockSizeVertical * 8,
        child: new FlutterLogo(
          size: SizeConfig.blockSizeVertical * 10,
        ),
      ));
}

Widget _details(String providerName, String distance, String price) {
  return new Container(
    padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 2,
        bottom: SizeConfig.safeBlockVertical * 2,
        left: SizeConfig.safeBlockHorizontal * 3),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Text(
            providerName,
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Container(
          child: new Text(
            'Distance: $distance KM',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.black45),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Text(
          'Rs. $price',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.safeBlockHorizontal * 4),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 3,
        ),
        new Container(
            child: new Row(
          children: <Widget>[
            new CircleAvatar(
              radius: SizeConfig.safeBlockVertical * 3,
              backgroundColor: Colors.black12,
              child: new IconButton(
                onPressed: () => print('Calling...'),
                icon: Icon(
                  Icons.phone,
                  color: Colors.deepPurple,
                ),
                iconSize: SizeConfig.safeBlockVertical * 4,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
            ),
            new CircleAvatar(
              radius: SizeConfig.safeBlockVertical * 3,
              backgroundColor: Colors.black12,
              child: new IconButton(
                onPressed: () => print('Location of service will be shown'),
                icon: Icon(
                  Icons.location_on,
                  color: Colors.deepPurple,
                ),
                iconSize: SizeConfig.safeBlockVertical * 3.5,
              ),
            )
          ],
        ))
      ],
    ),
  );
}
