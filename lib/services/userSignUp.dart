import 'dart:convert';
import 'package:fabo_example_app/models/categoriesModel.dart';
import 'package:fabo_example_app/models/productsModel.dart';
import 'package:fabo_example_app/models/query.dart';
import 'package:fabo_example_app/models/replies.dart';
import 'package:fabo_example_app/models/vendorModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
        print("Get Send Otp Request:");
        print(data);
        if (data != null) {
          sendOtpStatus = data['status'];
          print('send-otp status : $sendOtpStatus');
          token = data['token'];
          await addTokenToSP(token);
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
      print(e);
      return false;
    }
  }

  Future<bool> verifyOtp(String otp) async {
    String verifyOtpUrl = '$url' + '/api/auth/verifyotp';
    try {
      if (otp.isNotEmpty) {
        token = await getTokenFromSP();
        http.Response response = await http.post(
          verifyOtpUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token},
          body: {'otp': otp, 'medium': 'SMS'},
        );
        var data = json.decode(response.body);
        print("Get Verify OTP Request: ");
        print(data);
        if (data != null) {
          verifyOtpStatus = data['status'];
          print('verify-otp status : $verifyOtpStatus');
          token = data['token'];
          await addTokenToSP(token);
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
      print(e);
      return false;
    }
  }

  Future<bool> getRegisteredUser() async {
    String checkPhoneUrl = '$url' + '/api/user/getuser';
    try {
      token = await getTokenFromSP();
      http.Response response = await http.get(checkPhoneUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token});
      var data = json.decode(response.body);
      print("Get Registered User: ");
      print(data);
      if (data != null) {
        userStatus = data['status'];
        print('user status : $userStatus');
        userDetails = data['user'];
        token = data['token'];
      }
      notifyListeners();
      // print('Get registered method: ' + data);
      if (userStatus == 'Success') {
        await addTokenToSP(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getUserProfile() async {
    String profileFetchingUrl = '$url' + '/api/user/profile';
    try {
      token = await getTokenFromSP();
      http.Response response = await http.post(profileFetchingUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token},
          body: {'type': 'Customer'});
      var data = json.decode(response.body);
      if (data != null) {
        userStatus = data['status'];
        print('user status : $userStatus');
        userDetails = data['user'];
        await addTokenToSP(token);
      }
      notifyListeners();
      // print('Get user profile method : ' + data);
      if (userStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createUser(
      String firstName, String lastName, String address) async {
    String addUserUrl = '$url' + '/api/user/adduser';
    try {
      if (firstName.isNotEmpty && lastName.isNotEmpty && address.isNotEmpty) {
        token = await getTokenFromSP();
        var fcmToken = await _firebaseMessaging.getToken();
        print("Asked to create new User:");
        print(token);
        print('token : $token');
        http.Response response =
            await http.post(addUserUrl, headers: <String, String>{
          'Authorization': 'jwt ' + token
        }, body: {
          'type': 'Customer',
          'token': fcmToken,
          'firstName': firstName,
          'lastName': lastName,
          'address': address
        });
        var data = json.decode(response.body);
        print("Create User Request: ");
        print(data);
        if (data != null) {
          userStatus = data['status'];
          print('user status : $userStatus');
          userDetails = data['user'];
          token = data['token'];
          await addTokenToSP(token);
        }
        // print('Create new user method: ' + data);
      } else {
        detailsPageMsg = 'Above Fields can\'t be empty';
      }
      notifyListeners();
      if (userStatus == 'Success') {
        await addUserStatusToSP();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  addTokenToSP(String token) async {
    print("Add Token: $token");
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
    print("Get Token: $_token");
    return _token;
  }

  addUserStatusToSP() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    sharedPreferences.setBool('userExist', true);
  }

  getUserStatusFromSP() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    bool _status = sharedPreferences.getBool('userExist');
    return _status;
  }

  String getCategoriesStatus, getProdeuctsStatus;
  int noOfCategories;

  Future<List<CategoriesModel>> getCategories() async {
    String categoryUrl = url + '/api/category/list';
    List<CategoriesModel> categoriesList = List<CategoriesModel>();
    try {
      http.Response response = await http.get(categoryUrl);
      var data = json.decode(response.body);
      List _categories;
      _categories = data['catgories'] as List;
      // print("Get All Categories");
      // print(_categories);
      for (var i in _categories) {
        CategoriesModel category = CategoriesModel(
            id: i['_id'], name: i['name'], imageUrl: i['image_url']);
        categoriesList.add(category);
      }
      noOfCategories = data['count'];
      getCategoriesStatus = data['status'];
      notifyListeners();
    } catch (e) {
      print(e);
    }
    return categoriesList;
  }

  Future<List<ProductsModel>> getProducts(String categoryId) async {
    String categoryUrl = url + '/api/product/incategory?limit=5&id=$categoryId';
    List<ProductsModel> productsList = List<ProductsModel>();
    try {
      token = await getTokenFromSP();
      http.Response response = await http.get(categoryUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token});
      var data = json.decode(response.body);
      List _products;
      _products = data['products'] as List;
      for (var i in _products) {
        ProductsModel product = ProductsModel(
            id: i['_id'],
            name: i['name'],
            imageUrl: i['image_url'],
            features: i['features'],
            categoryId: i['category'][0],
            productId: i['_id']);
        productsList.add(product);
      }
      getProdeuctsStatus = data['status'];
      notifyListeners();
    } catch (e) {
      print(e);
    }
    return productsList;
  }

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  // String fcmToken;

  UserAuth() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage : $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch : $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume : $message');
      },
    );
  }

  String createQueryStatus, removeQueryStatus;

  Future<bool> createQuery(
      String productName, String productId, String categoryId) async {
    try {
      String createQueryUrl = url + '/api/query/create';
      List<QueryModel> queriesList = List<QueryModel>();
      token = await getTokenFromSP();
      http.Response response = await http.post(createQueryUrl, body: {
        'product_name': productName,
        'category': categoryId,
        'product': productId
      }, headers: <String, String>{
        'Authorization': 'jwt ' + token
      });
      var data = json.decode(response.body);
      List _queries = data['query'] as List;
      createQueryStatus = data['status'];
      for (var i in _queries) {
        QueryModel query = QueryModel(
            id: i['_id'],
            productName: i['product_name'],
            queryStatus: i['status'],
            replies: i['response']);
        queriesList.add(query);
      }
      if (createQueryStatus == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<QueryModel>> getQueries() async {
    String getQueriesUrl = url + '/api/query/queries';
    try {
      token = await getTokenFromSP();
      List<QueryModel> queriesList = List<QueryModel>();
      http.Response response = await http.get(getQueriesUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token});

      var data = json.decode(response.body);
      print(data);
      List _queries = data['queries'] as List;
      for (var i in _queries) {
        QueryModel query = QueryModel(
            id: i['_id'],
            productName: i['product_name'],
            productId: i['product'],
            queryStatus: i['status'],
            replies: i['replies']);
        queriesList.add(query);
      }
      return queriesList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<RepliesModel>> getReplies(String queryId) async {
    String getReplies = url + '/api/query/replies?query=$queryId';
    try {
      token = await getTokenFromSP();
      List<RepliesModel> repliesList = List<RepliesModel>();
      http.Response response = await http.get(getReplies,
          headers: <String, String>{'Authorization': 'jwt ' + token});

      var data = json.decode(response.body);
      List _replies = data['replies'] as List;
      for (var i in _replies) {
        RepliesModel reply = RepliesModel(
            id: i['_id'],
            vendorId: i['seller'],
            message: i['message'],
            price: i['price']);
        repliesList.add(reply);
      }
      return repliesList;
    } catch (e) {
      print(e);
    }
  }

  Future<VendorModel> getVendorDetails(String queryId) async {
    String vendorDetailsUrl = url + '/api/user/vendor?id=$queryId';
    try {
      token = await getTokenFromSP();
      http.Response response = await http.get(vendorDetailsUrl,
          headers: <String, String>{'Authorization': 'jwt ' + token});
      var data = json.decode(response.body);

      VendorModel vendorDetails = VendorModel(
          fistName: data['profile']['firstName'],
          lastName: data['profile']['lastName'],
          mobileNumber: data['mobile'],
          address: data['Address']);

      return vendorDetails;
    } catch (e) {
      print(e);
    }
  }
}
