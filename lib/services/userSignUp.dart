import 'dart:convert';
import 'package:fabo_example_app/models/categoriesModel.dart';
import 'package:fabo_example_app/models/productsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth with ChangeNotifier {
  SharedPreferences sharedPreferences;
  String url = 'http://13.232.214.36:7777';
  String token,
      sendOtpStatus,
      verifyOtpStatus,
      userStatus,
      sendOtpMsg = '',
      verifyOtpMsg = '',
      detailsPageMsg = '';
  var userDetails;

  Future<bool> sendOtp(String phoneNumber) async {
    String sendOtpUrl = '$url' + '/api/auth/sendotp';
    try {
      if (phoneNumber.isNotEmpty) {
        http.Response response = await http.post(sendOtpUrl,
            body: {'mobile': phoneNumber, 'medium': 'SMS', 'type': 'Customer'});
        var data = json.decode(response.body);
        if (data != null) {
          sendOtpStatus = data['status'];
          token = data['token'];
          // addTokenToSP(token);
        }
        // print('Send OTP method: ' + data.toString());
      } else {
        sendOtpMsg = 'Above Field can\'t be empty';
      }
      notifyListeners();
      if (sendOtpStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> verifyOtp(String otp) async {
    String verifyOtpUrl = '$url' + '/api/auth/verifyotp';
    try {
      if (otp.isNotEmpty) {
        http.Response response = await http.post(
          verifyOtpUrl,
          headers: <String, String>{
            // 'Authorization': 'jwt ' + getTokenFromSP()
            'Authorization': 'jwt ' + token
          },
          body: {'otp': otp, 'medium': 'SMS'},
        );
        var data = json.decode(response.body);
        if (data != null) {
          verifyOtpStatus = data['status'];
          token = data['token'];
          addTokenToSP(token);
        }
        // print('Verify OTP method: ' + data);
      } else {
        verifyOtpMsg = 'Above Field can\'t be empty';
      }
      notifyListeners();
      if (verifyOtpStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> getRegisteredUser() async {
    String checkPhoneUrl = '$url' + '/api/user/getuser';
    try {
      http.Response response =
          await http.get(checkPhoneUrl, headers: <String, String>{
        'Authorization': 'jwt ' + getTokenFromSP()
        // 'Authorization': 'jwt ' + token
      });
      var data = json.decode(response.body);
      if (data != null) {
        userStatus = data['status'];
        userDetails = data['user'];
        token = data['token'];
        addTokenToSP(token);
      }
      notifyListeners();
      // print('Get registered method: ' + data);
      if (userStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> getUserProfile() async {
    String profileFetchingUrl = '$url' + '/api/user/profile';
    try {
      http.Response response =
          await http.post(profileFetchingUrl, headers: <String, String>{
        'Authorization': 'jwt ' + getTokenFromSP()
        // 'Authorization': 'jwt ' + token
      }, body: {
        'type': 'Customer'
      });
      var data = json.decode(response.body);
      if (data != null) {
        userStatus = data['status'];
        userDetails = data['user'];
        addTokenToSP(token);
      }
      notifyListeners();
      // print('Get user profile method : ' + data);
      if (userStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> createUser(
      String firstName, String lastName, String address) async {
    String addUserUrl = '$url' + '/api/user/adduser';
    try {
      if (firstName.isNotEmpty && lastName.isNotEmpty && address.isNotEmpty) {
        http.Response response =
            await http.post(addUserUrl, headers: <String, String>{
          'Authorization': 'jwt ' + getTokenFromSP()
          // 'Authorization': 'jwt ' + token
        }, body: {
          'type': 'Customer',
          'token': 'Firebase Token',
          'firstName': firstName,
          'lastName': lastName,
          'address': address
        });
        var data = json.decode(response.body);
        if (data != null) {
          userStatus = data['status'];
          userDetails = data['user'];
          token = data['token'];
          addTokenToSP(token);
        }
        // print('Create new user method: ' + data);
      } else {
        detailsPageMsg = 'Above Fields can\'t be empty';
      }
      notifyListeners();
      if (userStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  addTokenToSP(String token) async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    sharedPreferences.setString('token', token);
  }

  getTokenFromSP() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    String _token = sharedPreferences.getString('token');
    if (_token.isEmpty || _token == null) {
      return '';
    } else {
      return _token;
    }
  }

  List<CategoriesModel> categoriesList;
  List<ProductsModel> productsList;
  String getCategoriesStatus, getProdeuctsStatus;
  String noOfCategories, categoryId, productId;
  // String categoryName, productName;
  // String catImgUrl, prodImgUrl;

  Future getCategories() async {
    String categoryUrl = url + '/api/category/list';
    try {
      http.Response response =
          await http.get(categoryUrl, headers: <String, String>{
        'Authorization': 'jwt ' + getTokenFromSP()
        // 'Authorization': 'jwt ' + _auth.token
      });
      var data = json.decode(response.body);
      if (data != null) {
        categoriesList = data['categories'] as List;
        noOfCategories = data['count'];
        categoryId = data['count']['_id'];
        // categoryName = data['categories']['name'];
        // catImgUrl = data['categories']['image_url'];
        getCategoriesStatus = data['status'];
        notifyListeners();
        print('getCategories : ' + data.toString());
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
        'Authorization': 'jwt ' + getTokenFromSP()
        // 'Authorization': 'jwt ' + _auth.token
      });
      var data = json.decode(response.body);

      if (data != null) {
        productsList = data['products'] as List;
        productId = data['products']['_id'];
        getProdeuctsStatus = data['status'];
        notifyListeners();
        print('getProducts : ' + data.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
