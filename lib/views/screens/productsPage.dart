import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  String productName, imageUrl, features, productId, categoryId;

  ProductDetailsPage(
      {this.productName,
      this.imageUrl,
      this.features,
      this.productId,
      this.categoryId});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  UserAuth content;

  @override
  void initState() {
    content = UserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.productName),
        ),
        body: new Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: new ListView(children: <Widget>[
              _itemPicture(widget.imageUrl),
              _itemDetails(widget.productName, widget.features),
              _queryButton(context, content)
            ])));
  }

  Widget _itemPicture(String imageUrl) {
    return new Container(
      height: SizeConfig.blockSizeVertical * 30,
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

  Widget _queryButton(BuildContext context, UserAuth query) {
    return Container(
      height: SizeConfig.blockSizeVertical * 5.5,
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 5,
          horizontal: SizeConfig.safeBlockHorizontal * 20),
      child: new RaisedButton(
        onPressed: () async {
          bool querySent = await query.createQuery(
              widget.productName, widget.productId, widget.categoryId);
          if (querySent) {
            // This snackbar is not showing
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Query sent.. Thank you !'),
              duration: Duration(seconds: 3),
            ));
            print('Query Will be sent');
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        color: Colors.green,
        child: new Container(
          child: new Text(
            'Send Query',
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5),
          ),
        ),
      ),
    );
  }
}
