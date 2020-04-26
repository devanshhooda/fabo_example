import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/models/query.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    // fetchQueries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UserAuth queries = Provider.of<UserAuth>(context);
    return new Scaffold(
        body: new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
      child: FutureBuilder<List<QueryModel>>(
          future: queries.getQueries(),
          builder:
              (BuildContext context, AsyncSnapshot<List<QueryModel>> snapshot) {
            print('get queries');
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int i) {
                  String productId = queriesList[i].id;
                  // String productName = queriesList[i].productName;
                  String replies = queriesList[i].replies.length.toString();
                  print(snapshot.data.length);
                  return QueryDetails(
                    // productName: productName,
                    productId: productId,
                    replies: replies,
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'Your query list is empty',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
          }),

      // child: (queriesList != null && queriesList.isNotEmpty)
      //     ? ListView.builder(
      //         itemCount: queriesList.length,
      //         itemBuilder: (context, int i) {
      // String productId = queriesList[i].id;
      // String productName = queriesList[i].productName;
      // String replies = queriesList[i].replies.length.toString();
      //           if (productName != null && productName.isNotEmpty) {
      //             print('product id : $productId');
      //             print('product bane : $productName');
      //             return QueryDetails(
      //               productId: productId,
      //               productName: productName,
      //               replies: replies,
      //             );
      //           } else {
      //             return QueryDetails(productName: productName);
      //           }
      //         },
      //       )
      //     : Center(
      //         child: Text(
      //           'Your query list is empty',
      //           style: TextStyle(fontSize: 18),
      //         ),
      //       ),
    ));
  }

  // fetchQueries() async {
  //   var data = await queries.getQueries();
  //   setState(() {
  //     queriesList = data;
  //   });
  // }
}

class QueryDetails extends StatefulWidget {
  String productId, replies, productName;
  QueryDetails({this.productId, this.replies, this.productName});

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
    // fetchProduct(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // fetchProduct(widget.productId);
    return Container(
      child:
          // new Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          FutureBuilder<ProductsModel>(
              future: queries.getQueryProduct(widget.productId),
              builder: (context, AsyncSnapshot<ProductsModel> snapshot) {
                print('get product');
                if (snapshot.hasData) {
                  return new ListTile(
                    isThreeLine: true,
                    leading: productPicture(snapshot.data.imageUrl),
                    title: new Container(
                      child: Text(
                        snapshot.data.name,
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
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) =>
                    //           Bookings(widget.productName, widget.productId)));
                    // },
                  );
                }
                return Center(
                  child: LinearProgressIndicator(),
                );
              }),

      // (productsModel != null)
      //     ? ListTile(
      //         isThreeLine: true,
      //         leading: productPicture(productsModel.imageUrl),
      //         title: new Container(
      //           child: Text(
      //             productsModel.name,
      //             style: TextStyle(
      //                 fontSize: SizeConfig.safeBlockHorizontal * 4,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.w500),
      //             textAlign: TextAlign.start,
      //           ),
      //         ),
      //         subtitle: new Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             new Container(
      //               child:
      //                   //   new Column(
      //                   // crossAxisAlignment: CrossAxisAlignment.start,
      //                   // children: <Widget>[
      //                   new Text(
      //                 'Replies: ${widget.replies}',
      //                 style: _subtitle,
      //               ),
      //               // new Text(
      //               //   'Rs $price (min)',
      //               //   style: _subtitle,
      //               // ),
      //               //   ],
      //               // )
      //             ),
      //           ],
      //         ),
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) =>
      //                   Bookings(widget.productName, widget.productId)));
      //         },
      //       )
      //     : Center(
      //         child: LinearProgressIndicator(),
      //       ),

      // new Container(
      //   padding: EdgeInsets.only(
      //       right: SizeConfig.safeBlockHorizontal * 3,
      //       left: SizeConfig.safeBlockHorizontal * 3),
      //   child: new Divider(
      //     thickness: 0.7,
      //   ),
      // )
      //   ],
      // ),
    );
  }

  Widget productPicture(String imageUrl) {
    return new Container(
      child: new CircleAvatar(
        // backgroundImage: NetworkImage(imageUrl),
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

  // fetchProduct(String productId) async {
  //   if (productId == null) {
  //     setState(() {
  //       productsModel.name = widget.productName;
  //     });
  //   } else {
  //     var data = await queries.getQueryProduct(productId);
  //     setState(() {
  //       productsModel = data;
  //     });
  //   }
  // }
}
