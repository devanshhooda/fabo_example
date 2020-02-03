import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fabo_example_app/Login%20-%20Sign%20up/Customer/signUpPage.dart';
import 'package:flutter/material.dart';

TextStyle _style = new TextStyle(color: Colors.black, fontSize: 25);

class OptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _options(context),
    );
  }
}

Widget _options(BuildContext context) {
  return new Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.white70],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 85, left: 20),
              child: RotateAnimatedTextKit(
                transitionHeight: 100,
                displayFullTextOnTap: true,
                onTap: () {
                  print('Animation Done');
                },
                text: ['Welcome to..', 'Fabo App'],
                textStyle: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Colors.white70,
                ),
              ),
              // child: new Text('Fabo App',
              //     style: TextStyle(
              //         fontSize: 50,
              //         fontWeight: FontWeight.w800,
              //         color: Colors.white70)),
            ),
            new Container(
              height: 750,
              width: 410,
              padding: EdgeInsets.only(bottom: 170, left: 5, right: 5, top: 50),
              child: new Card(
                color: Color.fromARGB(255, 255, 215, 255),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top: 50, left: 30),
                      child: new Text(
                        'Sign in as : ',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: new Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.purpleAccent,
                                  Colors.cyanAccent
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: new MaterialButton(
                          onPressed: () {
                            print('Service Provider Page');
                          },
                          child: new Text(
                            'Service Provider',
                            style: TextStyle(color: Colors.black, fontSize: 27),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 170),
                      child: new Container(
                        child: new Text(
                          'OR',
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.deepPurpleAccent,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: new Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                                colors: [Colors.deepPurple, Colors.cyanAccent],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight)),
                        child: new MaterialButton(
                          onPressed: () {
                            print('Customer Page');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Name()));
                          },
                          child: new Text(
                            'Customer',
                            style: TextStyle(color: Colors.black, fontSize: 28),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
