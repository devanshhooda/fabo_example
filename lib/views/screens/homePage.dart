import 'package:fabo_example_app/models/categoriesModel.dart';
import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:fabo_example_app/views/screens/productsPage.dart';
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
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length - 1,
                      itemBuilder: (context, i) {
                        String categoryName = snapshot.data[i].name;
                        String categoryId = snapshot.data[i].id;
                        return ChangeNotifierProvider(
                          create: (context) => UserAuth(),
                          child: CategoriesWidget(categoryName, categoryId),
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  String categoryName, categoryId;

  CategoriesWidget(String categoryName, String categoryId) {
    this.categoryName = categoryName;
    this.categoryId = categoryId;
  }
  @override
  Widget build(BuildContext context) {
    UserAuth productsContent = Provider.of<UserAuth>(context);
    return _categories(productsContent, categoryName, categoryId);
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
                      if (snapshot.hasData) {
                        return new SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: new Row(
                            children: <Widget>[
                              snapshot.data.length >= 1
                                  ? ProductsWidget(
                                      snapshot.data[0].name,
                                      snapshot.data[0].imageUrl,
                                      snapshot.data[0].features)
                                  : Container(),
                              snapshot.data.length >= 2
                                  ? ProductsWidget(
                                      snapshot.data[1].name,
                                      snapshot.data[1].imageUrl,
                                      snapshot.data[1].features)
                                  : Container(),
                              snapshot.data.length >= 3
                                  ? ProductsWidget(
                                      snapshot.data[2].name,
                                      snapshot.data[2].imageUrl,
                                      snapshot.data[2].features)
                                  : Container(),
                              snapshot.data.length >= 4
                                  ? ProductsWidget(
                                      snapshot.data[3].name,
                                      snapshot.data[3].imageUrl,
                                      snapshot.data[3].features)
                                  : Container(),
                              snapshot.data.length >= 5
                                  ? ProductsWidget(
                                      snapshot.data[4].name,
                                      snapshot.data[4].imageUrl,
                                      snapshot.data[4].features)
                                  : Container(),
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
}

class ProductsWidget extends StatelessWidget {
  String productName, imageUrl, features;

  ProductsWidget(String productName, String imageUrl, String features) {
    this.productName = productName;
    this.imageUrl = imageUrl;
    this.features = features;
  }
  @override
  Widget build(BuildContext context) {
    return _services(context, productName, imageUrl, features);
  }

  Widget _services(BuildContext context, String productName, String imageUrl,
      String features) {
    if (productName == null || imageUrl == null) {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetailsPage(productName, imageUrl, features)));
        print('Details of Service');
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.contain)),
          margin: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 2,
              bottom: SizeConfig.safeBlockHorizontal * 2),
          height: SizeConfig.blockSizeVertical * 20,
          width: SizeConfig.blockSizeHorizontal * 40,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 3,
                top: SizeConfig.safeBlockVertical * 1),
            margin: EdgeInsets.only(top: 150),
            child: new Text(
              productName,
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
            ),
          )),
    );
  }
}
