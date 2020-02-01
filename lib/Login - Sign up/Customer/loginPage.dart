import 'package:fabo_example_app/Home%20Page/HomePage.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(left: 150),
              child: new Text(
                'Login',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 70,
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
                        controller: _phNum,
                        style: TextStyle(
                            fontSize: 22,
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
                            size: 35,
                          ),
                        ),
                      )),
                )),
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
                      obscureText: true,
                      controller: _pass,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                      cursorWidth: 2.5,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        // suffix: new Container(
                        //     child: new IconButton(
                        //   onPressed: () => print('Change Visible State'),
                        //   iconSize: 30,
                        //   icon: Icon(Icons.remove_red_eye),
                        // )),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            new Container(
              width: 200,
              child: MaterialButton(
                onPressed: () => print('Forgot Passwod process'),
                child: new Text(errorMsg,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w300)),
              ),
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
              height: 25,
            ),
            new Container(
              height: 50,
              padding: EdgeInsets.only(left: 250, right: 20),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                      settings: RouteSettings(isInitialRoute: true)));
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
              width: 200,
              child: MaterialButton(
                onPressed: () => print('Forgot Passwod process'),
                child: new Text(errorMsg,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
