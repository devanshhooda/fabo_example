import 'package:fabo_example_app/Login%20-%20Sign%20up/Customer/loginPage.dart';
import 'package:flutter/material.dart';
import 'numberSignUp.dart';

TextEditingController _name = new TextEditingController();
String errorMsg = "";

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
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
              height: 50,
            ),
            new Container(
              padding: EdgeInsets.only(left: 130),
              child: new Text(
                'Sign Up',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 100, left: 30),
              child: new Text(
                'Enter your name :',
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
                      controller: _name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                      textCapitalization: TextCapitalization.words,
                      cursorWidth: 2.5,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                          hintText: 'Chris Evans',
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            size: 35,
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
                  if (_name.toString().isNotEmpty) {
                    print('No. Screen');
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PhoneNumber()));
                  } else {
                    detectError();
                  }
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
            new Container(
              padding: EdgeInsets.only(left: 30, top: 200),
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      'Already have an account ?',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  new Container(
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                        print('Login Page');
                      },
                      child: new Text(
                        'Login.',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic),
                      ),
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
