import 'package:flutter/material.dart';

TextEditingController _pass = new TextEditingController();
TextEditingController cnfrm_pass = new TextEditingController();
TextStyle _style = new TextStyle(fontSize: 17, color: Colors.blue);
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
              padding: EdgeInsets.only(top: 100, left: 30),
              child: new Text(
                'Now choose a password :',
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
                      controller: _pass,
                      obscureText: true,
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
                          )),
                    ),
                  )),
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
                      obscureText: true,
                      controller: cnfrm_pass,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                      cursorWidth: 2.5,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
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
              padding: EdgeInsets.only(left: 50, right: 50),
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
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 70),
              child: new Column(
                children: <Widget>[
                  new Text('By signing up, you agree to the Metaducator\'s'),
                  new Container(
                    padding: EdgeInsets.only(left: 35),
                    child: new Row(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () => print('Terms & Conditions Page'),
                            child:
                                new Text('Terms & Conditions', style: _style)),
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
