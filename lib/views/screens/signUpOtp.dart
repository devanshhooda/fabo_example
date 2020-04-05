import 'package:fabo_example_app/main.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:fabo_example_app/views/screens/enterDetails.dart';
import 'package:fabo_example_app/views/screens/numberSignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loginPage.dart';

// String phoneNumber;

class Password extends StatefulWidget {
  Password(String phnNmbr) {
    phoneNumber = phnNmbr;
  }
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _pass = new TextEditingController();
  String errorMsg = "";
  Color passClr = Colors.black12;
  Color confirmPassClr = Colors.black12;

  void changPassColor(String input) {
    setState(() {
      if (input.isNotEmpty) {
        passClr = Colors.red[100];
      } else {
        passClr = Colors.black12;
      }
    });
  }

  void detectError() {
    setState(() {
      errorMsg = "Above field can't be empty";
    });
  }

  // UserAuth userAuth;

  // @override
  // void initState() {
  //   userAuth = new UserAuth();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context, listen: false);
    return new Scaffold(
      body: new Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: new Center(
            child: new ListView(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(
                      right: SizeConfig.safeBlockHorizontal * 70,
                      top: SizeConfig.safeBlockVertical * 2),
                  child: new CircleAvatar(
                    radius: SizeConfig.blockSizeVertical * 2.2,
                    backgroundColor: Colors.indigoAccent,
                    child: new IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.white,
                          size: SizeConfig.safeBlockVertical * 2.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 10),
                  child: new Text(
                    'Enter OTP :',
                    style:
                        TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                    height: SizeConfig.blockSizeVertical * 6,
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 7,
                      right: SizeConfig.safeBlockHorizontal * 7,
                    ),
                    child: new Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 3,
                          top: SizeConfig.safeBlockHorizontal * 0.5),
                      decoration: BoxDecoration(
                        color: passClr,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: new TextField(
                        controller: _pass,
                        obscureText: true,
                        style: inputTextStyle,
                        cursorWidth: 2.5,
                        cursorColor: Colors.indigo,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'OTP',
                            hintStyle: hintStyle,
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              size: SizeConfig.safeBlockVertical * 3,
                            )),
                        onChanged: (String pass) {
                          pass = _pass.text;
                          changPassColor(pass);
                        },
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 30),
                  child: new Text(
                    errorMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 25,
                      right: SizeConfig.safeBlockHorizontal * 25),
                  child: new RaisedButton(
                    onPressed: () {
                      String otp = _pass.text;
                      if (otp.isNotEmpty) {
                        // final userAuth =
                        //     Provider.of<UserAuth>(context);
                        userAuth.verifyOtp(phoneNumber, otp);
                        userAuth.checkRegistration(phoneNumber);
                        if (userAuth.loginStatus == 'Success') {
                          if (userAuth.userStatus == 'Verified') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyApp()));
                            print('User exist');
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NameSignUp(phoneNumber)));
                            print('Enter details screen');
                          }
                        } else {
                          setState(() {
                            errorMsg = userAuth.otpStatus;
                          });
                        }
                      } else {
                        detectError();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 0,
                    child: new Container(
                      child: new Text(
                        'Verify',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
