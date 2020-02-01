import 'package:fabo_example_app/Login%20-%20Sign%20up/Customer/signUpPass.dart';
import 'package:flutter/material.dart';

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
          child: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(right: 300, top: 10),
              child: new CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: new IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            new Container(
              padding: EdgeInsets.only(top: 100, left: 30),
              child: new Text(
                'Please enter your phone number :',
                style: TextStyle(fontSize: 35),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            new Card(
              margin: EdgeInsets.all(15),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: new Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.purpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  width: 380,
                  child: new Container(
                    padding: EdgeInsets.all(10),
                    child: new TextField(
                      style: TextStyle(
                          fontSize: 22,
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
                            size: 30,
                          )),
                    ),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            new Container(
              child: new Text(
                errorMsg,
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            new Container(
              height: 50,
              padding: EdgeInsets.only(left: 250, right: 20),
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
                    style: TextStyle(color: Colors.white, fontSize: 23),
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
