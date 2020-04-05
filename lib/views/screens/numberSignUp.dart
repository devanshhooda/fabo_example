import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loginPage.dart';
import 'signUpOtp.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  static TextEditingController _number = new TextEditingController();
  static String phoneNumber = _number.text;
  TextStyle _style = new TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 4, color: Colors.blue);

  String errorMsg = "";

  Color nmbrClr = Colors.black12;

  void changePhoneNumberColor(String input) {
    setState(() {
      if (input.isNotEmpty) {
        nmbrClr = Colors.red[100];
      } else {
        nmbrClr = Colors.black12;
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
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: SizeConfig.safeBlockVertical * 2.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 33),
                  child: new Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 7,
                ),
                new Container(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 7),
                  child: new Text(
                    'Please enter your phone number :',
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
                        color: nmbrClr,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: new TextField(
                        style: inputTextStyle,
                        controller: _number,
                        keyboardType: TextInputType.number,
                        cursorWidth: 2.5,
                        cursorColor: Colors.indigo,
                        decoration: InputDecoration(
                            hintText: 'e.x.- 987651234',
                            hintStyle: hintStyle,
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.phone,
                              size: SizeConfig.safeBlockVertical * 3,
                            )),
                        onChanged: (String nmbr) {
                          nmbr = _number.text;
                          changePhoneNumberColor(nmbr);
                        },
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 28),
                  child: new Text(
                    errorMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 30,
                      right: SizeConfig.safeBlockHorizontal * 30),
                  child: new RaisedButton(
                    onPressed: () {
                      String phoneNumber = _number.text;
                      if (phoneNumber.isNotEmpty) {
                        userAuth.sendOtp(phoneNumber);
                        print('OTP Screen');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Password(
                                  phoneNumber,
                                )));
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
                        'Send OTP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 45),
                  child: new Text(
                    'OR',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                new Container(
                    height: SizeConfig.blockSizeVertical * 8,
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 10,
                        right: SizeConfig.safeBlockHorizontal * 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: new Card(
                      margin:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: new MaterialButton(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        onPressed: () => print('Google Sign In method'),
                        child: new Row(
                          children: <Widget>[
                            new CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: new Image.asset(
                                'assets/gLogo.png',
                                height: SizeConfig.blockSizeVertical * 5,
                                width: SizeConfig.blockSizeHorizontal * 13.5,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 2)),
                            new Text(
                              'Sign In with Google',
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5),
                            )
                          ],
                        ),
                      ),
                    )),
                new Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 4,
                    left: SizeConfig.safeBlockHorizontal * 17,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 3)),
                      new GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                          print('Login Page');
                        },
                        child: new Text(
                          'Login.',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical * 6),
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
