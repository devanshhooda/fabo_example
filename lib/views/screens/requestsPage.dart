import 'package:fabo_example_app/models/query.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookings.dart';

class Requests extends StatelessWidget {
  TextStyle _subtitle =
      new TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5);
  // List<String> titles = [
  //   'Macbook Air (13 inch)',
  //   'Onida Washing machine',
  //   'Fastrack Watch'
  // ];

  // List<String> noOfReplies = ['53', '13', '3'];

  // List<String> prices = ['80,000', '10,000', '2,000'];

  @override
  Widget build(BuildContext context) {
    UserAuth queries = Provider.of<UserAuth>(context);
    return new Scaffold(
        body: new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
      child: FutureBuilder<List<QueryModel>>(
          future: queries.getQueries(),
          builder:
              (BuildContext context, AsyncSnapshot<List<QueryModel>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int i) {
                if (snapshot.hasData) {
                  if (snapshot.data[i].productName != null &&
                      snapshot.data[i].productName.isNotEmpty) {
                    return _requests(context, snapshot.data[i].productName, '',
                        snapshot.data[i].replies.length.toString());
                  } else if (snapshot.data[i].productId != null &&
                      snapshot.data[i].productId.isNotEmpty) {
                    return _requests(context, '', snapshot.data[i].productId,
                        snapshot.data[i].replies.length.toString());
                  }
                } else {
                  return Center(
                    child: Text(
                      'Your query list is empty',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
              },
            );
          }),
    ));
  }

  Widget _requests(BuildContext context, String productName, String productId,
      String replies) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListTile(
          isThreeLine: true,
          leading: productPcture(),
          title: new Container(
            child: Text(
              '$productName',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
          ),
          subtitle: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child:
                    //   new Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // children: <Widget>[
                    new Text(
                  'Replies: $replies',
                  style: _subtitle,
                ),
                // new Text(
                //   'Rs $price (min)',
                //   style: _subtitle,
                // ),
                //   ],
                // )
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Bookings(productName, 'productId')));
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

  Widget productPcture() {
    return new Container(
      child: new CircleAvatar(
        radius: SizeConfig.blockSizeVertical * 4,
        backgroundColor: Colors.grey[300],
        child: FlutterLogo(
          size: SizeConfig.blockSizeVertical * 5,
        ),
      ),
    );
  }
}
