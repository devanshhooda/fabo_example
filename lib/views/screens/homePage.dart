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
    UserAuth content = Provider.of<UserAuth>(context);
    return new Scaffold(
      body: new Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: FutureBuilder<List<CategoriesModel>>(
              future: content.getCategories(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CategoriesModel>> snapshot) {
                // print(snapshot.hasData);
                // if (snapshot.connectionState == ConnectionState.none &&
                //     snapshot.error) {
                //   return Center(child: CircularProgressIndicator());
                // }
                if (snapshot.hasData) {
                  return ListView.builder(
                      // itemCount: int.parse(content.noOfCategories),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return _categories(content, snapshot.data[i].name,
                            snapshot.data[i].id);
                      });
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}

Widget _categories(
    UserAuth productsContent, String categoryName, String categoryId) {
  if (categoryName == null) {
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
              FutureBuilder<List<ProductsModel>>(
                  future: productsContent.getProducts(categoryId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductsModel>> snapshot) {
                    // if (snapshot.connectionState == ConnectionState.none &&
                    //     snapshot.error) {
                    //   return Center(child: CircularProgressIndicator());
                    // }
                    if (snapshot.hasData) {
                      return new SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: new Row(
                          children: <Widget>[
                            snapshot.data.length>=1 ? _services(snapshot.data[0].name,
                                snapshot.data[0].imageUrl) : Container(),
                            snapshot.data.length>=2 ? _services(snapshot.data[1].name,
                                snapshot.data[1].imageUrl) : Container(),
                            snapshot.data.length>=3 ? _services(snapshot.data[2].name,
                                snapshot.data[2].imageUrl) : Container(),
                            snapshot.data.length>=4 ? _services(snapshot.data[3].name,
                                snapshot.data[3].imageUrl) : Container(),
                            snapshot.data.length>=5 ? _services(snapshot.data[4].name,
                                snapshot.data[4].imageUrl) : Container(),
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  })
            ],
          ),
        )
      ],
    ),
  );
}

Widget _services(String productName, String imageUrl) {
  //print(productName);
  if (productName == null || imageUrl == null) {
    return Container();
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
                productName,
                style:
                    TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
              )
            ],
          ),
        ),
      ));
}
