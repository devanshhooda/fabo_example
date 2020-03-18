import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'signUpPage.dart';

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
      // color: Color.fromARGB(205, 125, 135, 215),
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text(
                'Prizey',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            new Text(
              'Find the best price \n in your neighbourhood',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            new Container(
              height: SizeConfig.blockSizeVertical * 60,
              width: SizeConfig.blockSizeHorizontal * 100,
              color: Colors.white70,
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 1,
                right: SizeConfig.safeBlockHorizontal * 1,
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 3,
                      // right: SizeConfig.safeBlockHorizontal * 30
                    ),
                    child: new Text(
                      'New User ?',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
                  ),
                  new Container(
                    height: SizeConfig.blockSizeVertical * 10,
                    width: SizeConfig.blockSizeHorizontal * 70,
                    padding: EdgeInsets.only(
                        // top: SizeConfig.safeBlockHorizontal * 5,
                        left: SizeConfig.safeBlockHorizontal * 9,
                        right: SizeConfig.safeBlockHorizontal * 9),
                    child: new Container(
                      height: SizeConfig.blockSizeVertical * 8.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.indigo[300]),
                      child: new MaterialButton(
                        onPressed: () {
                          print('Sign Up page');
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Name()));
                        },
                        child: new Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 7),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(
                        // left: SizeConfig.safeBlockHorizontal * 43
                        top: SizeConfig.blockSizeVertical * 5),
                    child: new Container(
                      child: new Text(
                        'OR',
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.indigoAccent[200],
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 5,
                      // right: SizeConfig.safeBlockHorizontal * 20
                    ),
                    child: new Text(
                      'Existing User ?',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
                  ),
                  new Container(
                    child: new Container(
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeHorizontal * 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.indigo[300]),
                      child: new MaterialButton(
                        onPressed: () {
                          print('Login Page');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: new Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 7),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // ),
            ),
          ],
        ),
      ));
}
