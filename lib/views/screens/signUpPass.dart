import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'loginPage.dart';

String phoneNumber;

class Password extends StatefulWidget {
  Password(String phnNmbr) {
    phoneNumber = phnNmbr;
  }
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _pass = new TextEditingController();
  TextStyle _style = new TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 4, color: Colors.blue);
  String errorMsg = "";
  Color passClr = Colors.black12;
  Color confirmPassClr = Colors.black12;
  UserAuth userAuth;

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
      errorMsg = "Above fields can't be empty";
    });
  }

  @override
  void initState() {
    userAuth = UserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    'Verify OTP :',
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
                      left: SizeConfig.safeBlockHorizontal * 15,
                      right: SizeConfig.safeBlockHorizontal * 15),
                  child: new RaisedButton(
                    onPressed: () {
                      String otp = _pass.text;
                      if (otp.isNotEmpty) {
                        userAuth.verifyOtp(phoneNumber, otp);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MyApp()),
                            ModalRoute.withName(''));
                        print('Home Page screen');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 0,
                    child: new Container(
                      child: new Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                          'By signing up, you agree to the Metaducator\'s'),
                      new FlatButton(
                          onPressed: () => print('Terms & Conditions Page'),
                          child: new Text('Terms & Conditions', style: _style)),
                      new Text('&'),
                      new FlatButton(
                          onPressed: () => print('Privacy policies Page'),
                          child: new Text(
                            'Privacy policies',
                            style: _style,
                          )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
