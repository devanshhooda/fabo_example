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

  // final GlobalKey<AsyncLoaderState> categoryLoaderState =
  //     new GlobalKey<AsyncLoaderState>();

  @override
  void initState() {
    content = new UserAuth();
    fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UserAuth content = Provider.of<UserAuth>(context);
    // fetchCategories();
    return new Scaffold(
        body: new Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,

            // child: FutureBuilder<List<CategoriesModel>>(
            //     future: content.getCategories(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<List<CategoriesModel>> snapshot) {
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //             itemCount: snapshot.data.length - 1,
            //             itemBuilder: (context, i) {
            //               String categoryName = snapshot.data[i].name;
            //               String categoryId = snapshot.data[i].id;
            //               return ChangeNotifierProvider(
            //                 create: (context) => UserAuth(),
            //                 child: CategoriesWidget(categoryName, categoryId),
            //               );
            //             });
            //       }
            //       return Center(child: CircularProgressIndicator());
            //     })),

            // child: AsyncLoader(
            //   key: categoryLoaderState,
            //   initState: () async => await content.getCategories(),
            //   renderError: ([error]) => Center(
            //     child: Text('$error'),
            //   ),
            //   renderLoad: () => Center(child: CircularProgressIndicator()),
            //   renderSuccess: ({data}) => ListView.builder(
            //       itemCount: data.length - 1,
            //       itemBuilder: (content, i) {
            //         return CategoriesWidget(data[i].name, data[i].id);
            //       }),
            // ),

            child: (categoriesList != null && categoriesList.isNotEmpty)
                ? ListView.builder(
                    itemCount: categoriesList.length - 1,
                    itemBuilder: (context, i) {
                      return CategoriesWidget(categoriesList[i].name,
                          categoriesList[i].id, content);
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }

  // Widget showFetchCategoriesError() {
  //   return Column(
  //     children: <Widget>[
  //       Text('There was an error'),
  //       RaisedButton(
  //         onPressed: () => categoryLoaderState.currentState.reloadState(),
  //         child: Container(
  //           color: Colors.black,
  //           child: Text(
  //             'Reload',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

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
  // final GlobalKey<AsyncLoaderState> productLoaderState =
  //     GlobalKey<AsyncLoaderState>();

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
    // UserAuth productsContent = Provider.of<UserAuth>(context);
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
                // FutureBuilder<List<ProductsModel>>(
                //     future: productsContent.getProducts(categoryId),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<List<ProductsModel>> snapshot) {
                //       if (snapshot.hasData) {
                // return new SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: new Row(
                //     children: <Widget>[
                //       snapshot.data.length >= 1
                //           ? ProductsWidget(
                //               snapshot.data[0].name,
                //               snapshot.data[0].imageUrl,
                //               snapshot.data[0].features,
                //               snapshot.data[0].productId,
                //               snapshot.data[0].categoryId)
                //           : Container(),
                //       snapshot.data.length >= 2
                //           ? ProductsWidget(
                //               snapshot.data[1].name,
                //               snapshot.data[1].imageUrl,
                //               snapshot.data[1].features,
                //               snapshot.data[1].productId,
                //               snapshot.data[1].categoryId)
                //           : Container(),
                //       snapshot.data.length >= 3
                //           ? ProductsWidget(
                //               snapshot.data[2].name,
                //               snapshot.data[2].imageUrl,
                //               snapshot.data[2].features,
                //               snapshot.data[2].productId,
                //               snapshot.data[2].categoryId)
                //           : Container(),
                //       snapshot.data.length >= 4
                //           ? ProductsWidget(
                //               snapshot.data[3].name,
                //               snapshot.data[3].imageUrl,
                //               snapshot.data[3].features,
                //               snapshot.data[3].productId,
                //               snapshot.data[3].categoryId)
                //           : Container(),
                //       snapshot.data.length >= 5
                //           ? ProductsWidget(
                //               snapshot.data[4].name,
                //               snapshot.data[4].imageUrl,
                //               snapshot.data[4].features,
                //               snapshot.data[4].productId,
                //               snapshot.data[4].categoryId)
                //           : Container(),
                //     ],
                //   ),
                // );
                //       }
                //       return Center(child: LinearProgressIndicator());
                //     })

                // AsyncLoader(
                //     key: productLoaderState,
                //     initState: () async =>
                //         await productsContent.getProducts(categoryId),
                //     renderError: ([error]) => Center(
                //           child: showFetchProductsError(),
                //         ),
                //     renderLoad: () =>
                //         Center(child: CircularProgressIndicator()),
                // renderSuccess: ({data}) => new SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: new Row(
                //         children: <Widget>[
                //           data.length >= 1
                //               ? ProductsWidget(
                //                   data[0].name,
                //                   data[0].imageUrl,
                //                   data[0].features,
                //                   data[0].productId,
                //                   data[0].categoryId)
                //               : Container(),
                //           data.length >= 2
                //               ? ProductsWidget(
                //                   data[1].name,
                //                   data[1].imageUrl,
                //                   data[1].features,
                //                   data[1].productId,
                //                   data[1].categoryId)
                //               : Container(),
                //           data.length >= 3
                //               ? ProductsWidget(
                //                   data[2].name,
                //                   data[2].imageUrl,
                //                   data[2].features,
                //                   data[2].productId,
                //                   data[2].categoryId)
                //               : Container(),
                //           data.length >= 4
                //               ? ProductsWidget(
                //                   data[3].name,
                //                   data[3].imageUrl,
                //                   data[3].features,
                //                   data[3].productId,
                //                   data[3].categoryId)
                //               : Container(),
                //           data.length >= 5
                //               ? ProductsWidget(
                //                   data[4].name,
                //                   data[4].imageUrl,
                //                   data[4].features,
                //                   data[4].productId,
                //                   data[4].categoryId)
                //               : Container(),
                //         ],
                //       ),
                //     )),
                (productsList != null && productsList.isNotEmpty)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: new Row(
                          children: <Widget>[
                            productsList.length >= 1
                                ? ProductsWidget(
                                    productsList[0].name,
                                    productsList[0].imageUrl,
                                    productsList[0].features,
                                    productsList[0].productId,
                                    productsList[0].categoryId)
                                : Container(),
                            productsList.length >= 2
                                ? ProductsWidget(
                                    productsList[1].name,
                                    productsList[1].imageUrl,
                                    productsList[1].features,
                                    productsList[1].productId,
                                    productsList[1].categoryId)
                                : Container(),
                            productsList.length >= 3
                                ? ProductsWidget(
                                    productsList[2].name,
                                    productsList[2].imageUrl,
                                    productsList[2].features,
                                    productsList[2].productId,
                                    productsList[2].categoryId)
                                : Container(),
                            productsList.length >= 4
                                ? ProductsWidget(
                                    productsList[3].name,
                                    productsList[3].imageUrl,
                                    productsList[3].features,
                                    productsList[3].productId,
                                    productsList[3].categoryId)
                                : Container(),
                            productsList.length >= 5
                                ? ProductsWidget(
                                    productsList[4].name,
                                    productsList[4].imageUrl,
                                    productsList[4].features,
                                    productsList[4].productId,
                                    productsList[4].categoryId)
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

    // Widget showFetchProductsError() {
    //   return Column(
    //     children: <Widget>[
    //       Text('There was an error'),
    //       RaisedButton(
    //         onPressed: () => productLoaderState.currentState.reloadState(),
    //         child: Container(
    //           color: Colors.black,
    //           child: Text(
    //             'Reload',
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       )
    //     ],
    //   );
    // }
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

  ProductsWidget(String productName, String imageUrl, String features,
      String productId, String categoryId) {
    this.productName = productName;
    this.imageUrl = imageUrl;
    this.features = features;
    this.productId = productId;
    this.categoryId = categoryId;
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
            builder: (context) => ChangeNotifierProvider<UserAuth>(
                  create: (context) => UserAuth(),
                  child: ProductDetailsPage(
                      productName, imageUrl, features, productId, categoryId),
                )));
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
            margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 17),
            child: new Text(
              productName,
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3),
            ),
          )),
    );
  }
}
