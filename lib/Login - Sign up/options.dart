import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fabo_example_app/Login%20-%20Sign%20up/Customer/signUpPage.dart';
import 'package:flutter/material.dart';
import '../sizeConfig.dart';

class OptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: _options(context),
    );
  }
}

Widget _options(BuildContext context) {
  return new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.white70],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 10,
                  left: SizeConfig.safeBlockHorizontal * 5),
              child: RotateAnimatedTextKit(
                transitionHeight: 100,
                onTap: () {
                  print('Animation Done');
                },
                text: ['Welcome to..', 'Fabo App'],
                textStyle: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white70,
                ),
              ),
            ),
            new Container(
              height: SizeConfig.blockSizeVertical * 70,
              padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 1,
                  right: SizeConfig.safeBlockHorizontal * 1,
                  top: SizeConfig.safeBlockVertical * 5),
              child: new Card(
                color: Color.fromARGB(255, 255, 215, 255),
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46)),
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 8,
                          left: SizeConfig.safeBlockHorizontal * 8),
                      child: new Text(
                        'Sign in as : ',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 8.5,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 8),
                    ),
                    new Container(
                      height: SizeConfig.blockSizeVertical * 10,
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 9,
                          right: SizeConfig.safeBlockHorizontal * 9),
                      child: new Container(
                        height: SizeConfig.blockSizeVertical * 8.5,
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
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 7),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 7),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 43),
                      child: new Container(
                        child: new Text(
                          'OR',
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.deepPurpleAccent,
                              fontSize: SizeConfig.safeBlockHorizontal * 7,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 7),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 9,
                          right: SizeConfig.safeBlockHorizontal * 9),
                      child: new Container(
                        height: SizeConfig.blockSizeVertical * 10,
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
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 7),
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
