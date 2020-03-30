import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserAuth with ChangeNotifier {
  String url = 'http://13.233.195.211:7777';
  String otpId, loginStatus, otpStatus, userStatus,details;

  Future sendOtp(String phoneNumber) async {
    String sendOtpUrl = '$url' + '/api/auth/sendotp';
    try {
      http.Response response =
          await http.post(sendOtpUrl, body: {'mobile': phoneNumber});
      var data = json.decode(response.body);
      otpId = data['otp_id'];
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future verifyOtp(String phoneNumber, String otp) async {
    String verifyOtpUrl = '$url' + '/api/auth/verifyotp';
    try {
      http.Response response = await http.post(verifyOtpUrl,
          body: {'mobile': phoneNumber, 'otp': otp, 'otp_id': otpId});
      var data = json.decode(response.body);
      loginStatus = data['Status'];
      otpStatus = data['Details'];
      // notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future checkRegistration(String phoneNumber) async {
    String checkPhoneUrl = '$url' + '/api/user/checkphone';
    try {
      http.Response response =
          await http.post(checkPhoneUrl, body: {'mobile': phoneNumber});
      var data = json.decode(response.body);
      userStatus = data['Status'];
      // notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUserProfile(String phoneNumber) async {
    String profileFetchingUrl = '$url' + '/api/user/profile';
    try {
      http.Response response = await http.post(profileFetchingUrl,
          body: {'mobile': phoneNumber, 'type': 'Customer'});
      var data = json.decode(response.body);
      userStatus = data['Status'];
      // notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addNewUser(String phoneNumber) async {
    String addUserUrl = '$url' + '/api/user/addnew';
    try {
      http.Response response = await http
          .post(addUserUrl, body: {'mobile': phoneNumber, 'type': 'Customer'});
      var data = json.decode(response.body);
      details = data['user'];
      // notifyListeners();
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }
}
