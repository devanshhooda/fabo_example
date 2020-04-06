import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserAuth with ChangeNotifier {
  String url = 'http://13.232.214.36:7777';
  String token,
      sendOtpStatus,
      verifyOtpStatus,
      userStatus,
      sendOtpMsg = '',
      verifyOtpMsg = '',
      detailsPageMsg = '';
  var userDetails;

  Future sendOtp(String phoneNumber) async {
    String sendOtpUrl = '$url' + '/api/auth/sendotp';
    try {
      if (phoneNumber.isNotEmpty) {
        http.Response response = await http.post(sendOtpUrl,
            body: {'mobile': phoneNumber, 'medium': 'SMS', 'type': 'Customer'});
        var data = json.decode(response.body);
        if (data != null) {
          sendOtpStatus = data['status'];
          token = data['token'];
        }
        print(data);
      } else {
        sendOtpMsg = 'Above Field can\'t be empty';
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future verifyOtp(String otp) async {
    String verifyOtpUrl = '$url' + '/api/auth/verifyotp';
    try {
      if (otp.isNotEmpty) {
        http.Response response = await http.post(
          verifyOtpUrl,
          headers: <String, String>{'Authorization': token},
          body: {'otp': otp, 'medium': 'SMS'},
        );
        var data = json.decode(response.body);
        if (data != null) {
          verifyOtpStatus = data['status'];
          token = data['token'];
        }
        print(data);
      } else {
        verifyOtpMsg = 'Above Field can\'t be empty';
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getRegisteredUser() async {
    String checkPhoneUrl = '$url' + '/api/user/getuser';
    try {
      http.Response response = await http.get(checkPhoneUrl,
          headers: <String, String>{'Authorization': token});
      var data = json.decode(response.body);
      if (data != null) {
        userStatus = data['status'];
        userDetails = data['user'];
        token = data['token'];
      }
      notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUserProfile() async {
    String profileFetchingUrl = '$url' + '/api/user/profile';
    try {
      http.Response response =
          await http.post(profileFetchingUrl, body: {'type': 'Customer'});
      var data = json.decode(response.body);
      if (data != null) {
        userStatus = data['status'];
        userDetails = data['user'];
      }
      notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future createUser(String firstName, String lastName, String address) async {
    String addUserUrl = '$url' + '/api/user/adduser';
    try {
      if (firstName.isNotEmpty && lastName.isNotEmpty && address.isNotEmpty) {
        http.Response response =
            await http.post(addUserUrl, headers: <String, String>{
          'Authorization': token
        }, body: {
          'type': 'Customer',
          'token': token,
          'firstName': firstName,
          'lastName': lastName,
          'address': address
        });
        var data = json.decode(response.body);
        if (data != null) {
          userStatus = data['status'];
          userDetails = data['user'];
          token = data['token'];
        }
        print(data);
      } else {
        detailsPageMsg = 'Above Field can\'t be empty';
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
