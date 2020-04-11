import 'package:fabo_example_app/models/categoriesModel.dart';
import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final content = Provider.of<UserAuth>(context);
    return new Scaffold(
      body: new Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: FutureBuilder(
              future: content.getCategories(),
              builder: (context, snapshot) {
                List<CategoriesModel> categoriesList = content.categoriesList;
                List<ProductsModel> productsList = content.productsList;

                if (snapshot.connectionState != ConnectionState.done &&
                    !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                    itemCount: int.parse(content.noOfCategories),
                    itemBuilder: (context, i) {
                      return _categories(categoriesList[i].name,
                          productsList[i].name, productsList[i].imageUrl);
                    });
              })),
    );
  }
}

Widget _categories(String categoryName, String productname, String imageUrl) {
  if (categoryName == null || productname == null || imageUrl == null) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  return new Container(
    padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 0.5,
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        bottom: SizeConfig.safeBlockVertical * 0.5),
    child: new Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1,
        ),
        new Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black26),
          child: Column(
            children: <Widget>[
              new FlatButton(
                onPressed: () => print('$categoryName page'),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 3),
                    ),
                    new Text(
                      categoryName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                    ),
                    // new SizedBox(),
                    new Icon(
                      Icons.chevron_right,
                      size: SizeConfig.safeBlockVertical * 2.5,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    _services(productname, imageUrl),
                    _services(productname, imageUrl),
                    _services(productname, imageUrl),
                    _services(productname, imageUrl),
                    _services(productname, imageUrl),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _services(String productname, String imageUrl) {
  if (productname == null || imageUrl == null) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  return Container(
      padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 2,
          bottom: SizeConfig.safeBlockHorizontal * 2),
      height: 200,
      width: 175,
      child: new GestureDetector(
        onTap: () => print('Details of Service'),
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // new FlutterLogo(
              //   size: SizeConfig.blockSizeVertical * 10,
              // ),
              new Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
              new Text(
                productname,
                style:
                    TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
              )
            ],
          ),
        ),
      ));
}

//  new ListView(
//                   children: <Widget>[
//                     _categories('Categories', 'Service'),
//                     _categories('Recommended for you', 'Service'),
//                     _categories('Special offers', 'Service'),
//                     _categories('Top offers', 'Service'),
//                     _categories('Favourites', 'Service'),
//                   ],
//                 );
