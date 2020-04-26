import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/models/query.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'bookings.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  UserAuth queries;
  List<QueryModel> queriesList = List<QueryModel>();

  @override
  void initState() {
    queries = new UserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
      child: FutureBuilder<List<QueryModel>>(
          future: queries.getQueries(),
          builder:
              (BuildContext context, AsyncSnapshot<List<QueryModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int i) {
                    String productId = snapshot.data[i].productId;
                    String replies = snapshot.data[i].replies.length.toString();
                    String queryId = snapshot.data[i].id;
                    return QueryDetails(
                      productId: productId,
                      replies: replies,
                      queryId: queryId,
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Network Error !'),
                );
              }
            } else {
              return Center(
                child: Text(
                  'Your query list is empty',
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),
                ),
              );
            }
          }),
    ));
  }
}

class QueryDetails extends StatefulWidget {
  String productId, replies, queryId;
  QueryDetails({this.productId, this.replies, this.queryId});

  @override
  _QueryDetailsState createState() => _QueryDetailsState();
}

class _QueryDetailsState extends State<QueryDetails> {
  UserAuth queries;
  ProductsModel productsModel;

  TextStyle _subtitle =
      new TextStyle(fontSize: (SizeConfig.safeBlockHorizontal ?? 0) * 3.5);

  @override
  void initState() {
    queries = UserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder<ProductsModel>(
              future: queries.getQueryProduct(widget.productId),
              builder: (context, AsyncSnapshot<ProductsModel> snapshot) {
                if (snapshot.hasData) {
                  String productImageUrl = snapshot.data.imageUrl;
                  String productFeatures = snapshot.data.features;
                  String productName = snapshot.data.name;
                  return new ListTile(
                    leading: productPicture(productImageUrl),
                    title: new Container(
                      child: Text(
                        productName,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    subtitle: new Container(
                      child: new Text(
                        'Replies: ${widget.replies}',
                        style: _subtitle,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Bookings(
                                productName: productName,
                                imageUrl: productImageUrl,
                                features: productFeatures,
                                queryId: widget.queryId,
                              )));
                    },
                  );
                }
                return Center(
                  child: LinearProgressIndicator(),
                );
              }),
          new Container(
            padding: EdgeInsets.only(
                right: SizeConfig.safeBlockHorizontal * 3,
                left: SizeConfig.safeBlockHorizontal * 3),
            child: new Divider(
              thickness: 0.7,
            ),
          )
        ],
      ),
    );
  }

  Widget productPicture(String imageUrl) {
    return new Container(
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        radius: SizeConfig.blockSizeVertical * 4,
        child: (imageUrl != null && imageUrl.isNotEmpty)
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.contain)),
              )
            : null,
      ),
    );
  }
}
