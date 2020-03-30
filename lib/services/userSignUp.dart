import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserAuth with ChangeNotifier {
  String url = 'http://13.233.195.211:7777';

  Future sendOtp(String phoneNumber) async {
    try {
      String sendOtpUrl = '$url' + '/api/auth/sendotp';
      http.Response response =
          await http.post(sendOtpUrl, body: {'mobile': phoneNumber});
      var data = json.decode(response.body);
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future verifyOtp(String otp) async {
    
  }
}
