import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'bookings.dart';

TextStyle _subtitle =
    new TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4);

class Requests extends StatelessWidget {
  List<String> titles = [
    'Macbook Air (13 inch)',
    'Onida Washing machine',
    'Fastrack Watch'
  ];

  List<String> noOfReplies = ['53', '13', '3'];

  List<String> prices = ['80,000', '10,000', '2,000'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, int i) {
          return _requests(context, titles[i], noOfReplies[i], prices[i], i);
        },
      ),
    ));
  }
}

Widget _requests(
    BuildContext context, String title, String replies, String price, int i) {
  return new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new ListTile(
        // enabled: false,
        isThreeLine: true,
        leading: profilePhoto(context, i),
        title: new Container(
          child: Text(
            '$title',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                color: Colors.black,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        ),
        subtitle: new Column(
          children: <Widget>[
            new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Replies: $replies',
                  style: _subtitle,
                ),
                new Text(
                  'Rs $price (min)',
                  style: _subtitle,
                ),
              ],
            )),
          ],
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Bookings(title)));
        },
      ),
      new Container(
        padding: EdgeInsets.only(
            right: SizeConfig.safeBlockHorizontal * 3,
            left: SizeConfig.safeBlockHorizontal * 3),
        child: new Divider(
          thickness: 0.7,
        ),
      )
    ],
  );
}

Widget profilePhoto(BuildContext context, int i) {
  return new Container(
    child: new GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Details(i);
          }));
        },
        child: new Hero(
          tag: i,
          child: new CircleAvatar(
            radius: SizeConfig.blockSizeVertical * 4,
            backgroundColor: Colors.grey[300],
            child: FlutterLogo(
              size: SizeConfig.blockSizeVertical * 5,
            ),
          ),
        )),
  );
}

class Details extends StatelessWidget {
  int index;
  Details(int i) {
    index = i;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragDown: (DragDownDetails dragDownDetails) {
          Navigator.pop(context);
        },
        child: Center(
            child: new Container(
          height: SizeConfig.blockSizeVertical * 40,
          width: SizeConfig.blockSizeHorizontal * 90,
          color: Colors.white,
          child: Hero(
            tag: index,
            child: FlutterLogo(),
          ),
        )),
      ),
    );
  }
}
