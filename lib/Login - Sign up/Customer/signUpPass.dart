import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

TextEditingController _pass = new TextEditingController();
TextEditingController cnfrm_pass = new TextEditingController();
TextStyle _style = new TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4, color: Colors.blue);
String errorMsg = "";

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  void detectError() {
    setState(() {
      errorMsg = "The above columns can't be empty";
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
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 10),
                  child: new Text(
                    'Now choose a password :',
                    style:
                        TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 9),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Card(
                  margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: new Container(
                      height: SizeConfig.blockSizeVertical * 7.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: new Container(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                        child: new TextField(
                          controller: _pass,
                          obscureText: true,
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
                              )),
                        ),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Card(
                  margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: new Container(
                      height: SizeConfig.blockSizeVertical * 7.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: new Container(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                        child: new TextField(
                          obscureText: true,
                          controller: cnfrm_pass,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple),
                          cursorWidth: 2.5,
                          cursorColor: Colors.purpleAccent,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: InputBorder.none,
                              icon: Icon(Icons.lock,
                                  size: SizeConfig.safeBlockVertical * 4)),
                        ),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  child: new Text(
                    errorMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 10,
                      right: SizeConfig.safeBlockHorizontal * 10),
                  child: new RaisedButton(
                    onPressed: () {
                      if (_pass.toString().isEmpty ||
                          cnfrm_pass.toString().isEmpty) {
                        detectError();
                      } else {
                        print('Home Page screen');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 7,
                    child: new Container(
                      child: new Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical * 10),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                          'By signing up, you agree to the Metaducator\'s'),
                      new Container(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 7),
                        child: new Row(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: () =>
                                    print('Terms & Conditions Page'),
                                child: new Text('Terms & Conditions',
                                    style: _style)),
                            new Text('and'),
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
                )
              ],
            ),
          )),
    );
  }
}
