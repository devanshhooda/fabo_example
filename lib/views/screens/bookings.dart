import 'package:fabo_example_app/models/replies.dart';
import 'package:fabo_example_app/models/vendorModel.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  String productName, imageUrl, features, queryId;
  Bookings({this.productName, this.features, this.imageUrl, this.queryId});

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  UserAuth query;
  String vendorName = '', vendorAddress = '', mobileNumber = '';

  @override
  void initState() {
    query = UserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            (widget.productName != null && widget.productName.isNotEmpty)
                ? '${widget.productName}'
                : ''),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('Are you sure to delete the query ?'),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              // print('query id : ${widget.queryId}');
                              bool queryRemoved =
                                  await query.removeQuery(widget.queryId);
                              if (queryRemoved) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text('Yes')),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'))
                      ],
                    ));
              })
        ],
      ),
      body: new Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: new Column(
          children: <Widget>[
            _productPortion(),

            // Here are the replies
            Expanded(
              flex: 5,
              child: FutureBuilder<List<RepliesModel>>(
                  future: query.getReplies(widget.queryId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RepliesModel>> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data);
                      if (snapshot.data.length > 0) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              // print(snapshot.data[i].price);
                              getVendor(snapshot.data[i].vendorId);
                              return _booking(snapshot.data[i].message,
                                  snapshot.data[i].price);
                            });
                      } else
                        return Center(
                          child: Text(
                            'No replies yet',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                color: Colors.black54),
                          ),
                        );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _productPortion() {
    return Container(
      child: Column(
        children: <Widget>[
          _itemPicture(widget.imageUrl),
          _itemDetails(widget.productName, widget.features),
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
        ],
      ),
    );
  }

  Widget _itemPicture(String imageUrl) {
    return new Container(
      height: SizeConfig.blockSizeVertical * 15,
      padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 2,
          right: SizeConfig.safeBlockHorizontal * 2,
          top: SizeConfig.safeBlockVertical * 1),
      child: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.contain)),
      ),
    );
  }

  Widget _itemDetails(String productName, String features) {
    return new Container(
      padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 3,
          top: SizeConfig.safeBlockVertical * 1),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              (productName != null && productName.isNotEmpty)
                  ? productName
                  : '',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
            child: new Text(
              (features != null && features.isNotEmpty)
                  ? 'Features: $features'
                  : '',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _booking(String message, int price) {
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
          children: <Widget>[_picture(), _details(price, message)],
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

  Widget _details(int price, String message) {
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
              vendorName,
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
              'Distance: $vendorAddress KM',
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
            'Message: $message',
            style: TextStyle(
                fontWeight: FontWeight.w500,
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
                    size: SizeConfig.safeBlockHorizontal * 6,
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
                    size: SizeConfig.safeBlockHorizontal * 6,
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
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 1)),
              Icon(Icons.sort)
            ],
          )),
    );
  }

  getVendor(String vendorId) async {
    VendorModel vendorModel = await query.getVendorDetails(vendorId);
    setState(() {
      vendorName = vendorModel.fistName + ' ' + vendorModel.lastName;
      vendorAddress = vendorModel.address;
      mobileNumber = vendorModel.mobileNumber;
    });
  }
}
