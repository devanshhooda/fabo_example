import 'package:fabo_example_app/models/categoriesModel.dart';
import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:fabo_example_app/views/screens/productsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<CategoriesModel> categoriesList = new List<CategoriesModel>();
List<ProductsModel> productsList = new List<ProductsModel>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserAuth content;

  @override
  void initState() {
    content = new UserAuth();
    fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: (categoriesList.isNotEmpty)
                ? (categoriesList != null)
                    ? ListView.builder(
                        itemCount: categoriesList.length - 1,
                        itemBuilder: (context, i) {
                          return CategoriesWidget(categoriesList[i].name,
                              categoriesList[i].id, content);
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      )
                : Center(
                    child: Text('Network Error !'),
                  )));
  }

  fetchCategories() async {
    var data = await content.getCategories();
    setState(() {
      categoriesList = data;
    });
  }
}

class CategoriesWidget extends StatefulWidget {
  UserAuth productsContent;
  String categoryName, categoryId;

  CategoriesWidget(String categoryName, String categoryId, UserAuth content) {
    this.productsContent = content;
    this.categoryName = categoryName;
    this.categoryId = categoryId;
  }

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _categories();
  }

  Widget _categories() {
    if (widget.categoryName == null) {
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
                  onPressed: () => print('${widget.categoryName} page'),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 3),
                      ),
                      new Text(
                        widget.categoryName,
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
                (productsList != null && productsList.isNotEmpty)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: new Row(
                          children: <Widget>[
                            productsList.length >= 1
                                ? ProductsWidget(
                                    productName: productsList[0].name,
                                    imageUrl: productsList[0].imageUrl,
                                    features: productsList[0].features,
                                    productId: productsList[0].id,
                                    categoryId: productsList[0].categoryId)
                                : Container(),
                            productsList.length >= 2
                                ? ProductsWidget(
                                    productName: productsList[1].name,
                                    imageUrl: productsList[1].imageUrl,
                                    features: productsList[1].features,
                                    productId: productsList[1].id,
                                    categoryId: productsList[1].categoryId)
                                : Container(),
                            productsList.length >= 3
                                ? ProductsWidget(
                                    productName: productsList[2].name,
                                    imageUrl: productsList[2].imageUrl,
                                    features: productsList[2].features,
                                    productId: productsList[2].id,
                                    categoryId: productsList[2].categoryId)
                                : Container(),
                            productsList.length >= 4
                                ? ProductsWidget(
                                    productName: productsList[3].name,
                                    imageUrl: productsList[3].imageUrl,
                                    features: productsList[3].features,
                                    productId: productsList[3].id,
                                    categoryId: productsList[3].categoryId)
                                : Container(),
                            productsList.length >= 5
                                ? ProductsWidget(
                                    productName: productsList[4].name,
                                    imageUrl: productsList[4].imageUrl,
                                    features: productsList[4].features,
                                    productId: productsList[4].id,
                                    categoryId: productsList[4].categoryId)
                                : Container(),
                          ],
                        ),
                      )
                    : Center(
                        child: LinearProgressIndicator(),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  fetchProducts() async {
    var data = await widget.productsContent.getProducts(widget.categoryId);
    setState(() {
      productsList = data;
    });
  }
}

class ProductsWidget extends StatelessWidget {
  String productName, imageUrl, features, productId, categoryId;

  ProductsWidget(
      {this.productName,
      this.imageUrl,
      this.features,
      this.productId,
      this.categoryId});
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
            builder: (context) => ChangeNotifierProvider<UserAuth>(
                  create: (context) => UserAuth(),
                  child: ProductDetailsPage(
                      productName: productName,
                      imageUrl: imageUrl,
                      features: features,
                      productId: productId,
                      categoryId: categoryId),
                )));
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
            margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 17),
            child: new Text(
              productName,
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3),
            ),
          )),
    );
  }
}
