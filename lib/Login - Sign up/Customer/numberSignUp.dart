import 'package:fabo_example_app/Login%20-%20Sign%20up/Customer/signUpPass.dart';
import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

TextEditingController _number = new TextEditingController();
String errorMsg = "";

class PhoneNumber extends StatefulWidget {
  // PhoneNumber(String name) {}
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
                  height: SizeConfig.safeBlockVertical * 22,
                ),
                new Container(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                  child: new Text(
                    'Please enter your phone number :',
                    style:
                        TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),
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
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple),
                          controller: _number,
                          keyboardType: TextInputType.number,
                          cursorWidth: 2.5,
                          cursorColor: Colors.purpleAccent,
                          decoration: InputDecoration(
                              hintText: 'e.x.- 987651234',
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.phone,
                                size: SizeConfig.safeBlockVertical * 4.5,
                              )),
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
                      left: SizeConfig.safeBlockHorizontal * 60,
                      right: SizeConfig.safeBlockHorizontal * 5),
                  child: new RaisedButton(
                    onPressed: () {
                      print('Password Screen');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Password()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 7,
                    child: new Container(
                      child: new Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
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
