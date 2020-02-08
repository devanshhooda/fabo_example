// import 'package:fabo_example_app/Home%20Page/HomePage.dart';
import 'package:fabo_example_app/main.dart';
import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

TextEditingController _phNum = new TextEditingController();
TextEditingController _pass = new TextEditingController();
String errorMsg = "";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void detectError() {
    setState(() {
      errorMsg = "The above column can't be empty";
    });
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
                    backgroundColor: Colors.deepPurpleAccent,
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
                  height: SizeConfig.safeBlockVertical * 7,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 35),
                  child: new Text(
                    'Login',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 8,
                ),
                new Card(
                    margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: new Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: new Container(
                          height: SizeConfig.blockSizeVertical * 7,
                          padding:
                              EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                          child: new TextField(
                            controller: _phNum,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple),
                            keyboardType: TextInputType.number,
                            cursorWidth: 2.5,
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.phone,
                                size: SizeConfig.safeBlockVertical * 4.5,
                              ),
                            ),
                          )),
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                new Card(
                  margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: new Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: new Container(
                        height: SizeConfig.blockSizeVertical * 7,
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                        child: new TextField(
                          obscureText: true,
                          controller: _pass,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple),
                          cursorWidth: 2.5,
                          cursorColor: Colors.purpleAccent,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              size: SizeConfig.safeBlockVertical * 4,
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 43),
                  child: FlatButton(
                    onPressed: () => print('Forgot Passwod process'),
                    child: new Text('Forgot Password ?',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                new Container(
                  child: new Text(
                    errorMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 20,
                      right: SizeConfig.safeBlockHorizontal * 20),
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 7,
                    child: new Container(
                      child: new Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 45),
                  child: new Text(
                    'OR',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
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
                      elevation: 10,
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
                            new Text(
                              'Sign In with Google',
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 5.5),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
