import 'dart:convert';

import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeContent with ChangeNotifier {
  SharedPreferences sharedPreferences;
  String url = 'http://13.232.214.36:7777';
  UserAuth _auth;
  List<String> categories, products;
  String getCategoriesStatus, getProdeuctsStatus;
  String noOfCategories, categoryId;

  Future getCategories() async {
    String categoryUrl = url + '/api/category/list';
    try {
      http.Response response =
          await http.get(categoryUrl, headers: <String, String>{
        'Authorization': 'jwt ' + _auth.getTokenFromSP()
        // 'Authorization': 'jwt ' + _auth.token
      });
      var data = json.decode(response.body);
      if (data != null) {
        categories = data['categories'];
        noOfCategories = data['count'];
        categoryId = data['count']['_id'];
        getCategoriesStatus = data['status'];
        notifyListeners();
        print('getCategories : ' + data);
        getProducts();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getProducts() async {
    String categoryUrl =
        url + '/api/product/incategory?limit=$noOfCategories&id=$categoryId';
    try {
      http.Response response =
          await http.get(categoryUrl, headers: <String, String>{
        'Authorization': 'jwt ' + _auth.getTokenFromSP()
        // 'Authorization': 'jwt ' + _auth.token
      });
      var data = json.decode(response.body);
      if (data != null) {
        categories = data['categories'];
        noOfCategories = data['count'];
        categoryId = data['count']['_id'];
        getProdeuctsStatus = data['status'];
        notifyListeners();
        print('getProducts : ' + data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
