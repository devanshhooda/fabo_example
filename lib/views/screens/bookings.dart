import 'package:fabo_example_app/models/replies.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  String productName, productId;
  Bookings(String productName, String productId) {
    this.productName = productName;
    this.productId = productId;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$productName'),
      ),
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: new ListView(
          children: <Widget>[
            _itemPicture('imageUrl'),
            _itemDetails(productName, 'features'),
            new Container(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 3,
                right: SizeConfig.safeBlockHorizontal * 3,
              ),
              child: Divider(
                thickness: 5,
                height: SizeConfig.blockSizeVertical * 3,
              ),
            ),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _sortButton('Distance'),
                  _sortButton('Price'),
                ],
              ),
            ),

            // Here are the replies
            FutureBuilder<List<RepliesModel>>(builder: (BuildContext context,
                AsyncSnapshot<List<RepliesModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, i) {
                  return _booking(
                      snapshot.data[i].message, snapshot.data[i].price);
                });
              } else {
                return Center(
                  child: Text(
                    'No replies yet',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            }),

            // _booking('Apple Provider', '1.2', '80,000'),
            // _booking('Apple Provider', '1.2', '80,000'),
          ],
        ),
      ),
    );
  }
}

Widget _itemPicture(String imageUrl) {
  return new Container(
    height: SizeConfig.blockSizeVertical * 30,
    padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        top: SizeConfig.safeBlockVertical * 1),
    child: new Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(imageUrl), fit: BoxFit.contain)),
              child: FlutterLogo(),
    ),
  );
}

Widget _itemDetails(String productName, String features) {
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
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
          child: new Text(
            'Features: $features',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}

Widget _booking(String message, String price) {
  return new Container(
    padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 1,
        bottom: SizeConfig.safeBlockVertical * 1,
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2),
    child: new Container(
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
      child: new Row(
        children: <Widget>[
          _picture(),
          _details('vendorName', 'address', price, message)
        ],
      ),
    ),
  );
}

Widget _picture() {
  return new Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: SizeConfig.blockSizeVertical * 7,
        child: new FlutterLogo(
          size: SizeConfig.blockSizeVertical * 9,
        ),
      ));
}

Widget _details(
    String providerName, String distance, String price, String message) {
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
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
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
                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                color: Colors.black54),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Text(
          'Rs. $price',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Text(
          'Rs. $message',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
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
                  color: Colors.indigo,
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
                  color: Colors.indigo,
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

Widget _sortButton(String sortingMethod) {
  return new Container(
    child: new FlatButton(
        onPressed: () {},
        child: new Row(
          children: <Widget>[
            Text(sortingMethod),
            Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 1)),
            Icon(Icons.sort)
          ],
        )),
  );
}
