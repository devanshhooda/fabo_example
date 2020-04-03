import 'package:fabo_example_app/main.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import 'package:fabo_example_app/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loginPage.dart';

String phoneNumber;

class NameSignUp extends StatefulWidget {
  String phoneNumber;
  NameSignUp(String phnNmbr) {
    phoneNumber = phnNmbr;
  }

  @override
  _NameSignUpState createState() => _NameSignUpState();
}

class _NameSignUpState extends State<NameSignUp> {
  TextEditingController _firstName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _address = new TextEditingController();

  String errorMsg = "";

  Color firstNameClr = Colors.black12;
  Color lastNameClr = Colors.black12;

  void changeFirstNameColor(String input) {
    setState(() {
      if (input.isNotEmpty) {
        firstNameClr = Colors.red[100];
      } else {
        firstNameClr = Colors.black12;
      }
    });
  }

  void changeLastNameColor(String input) {
    setState(() {
      if (input.isNotEmpty) {
        lastNameClr = Colors.red[100];
      } else {
        lastNameClr = Colors.black12;
      }
    });
  }

  void detectError() {
    setState(() {
      errorMsg = "Above fields can't be empty";
    });
  }

  // UserAuth _userAuth;

  // @override
  // void initState() {
  //   _userAuth = new UserAuth();
  //   super.initState();
  // }

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
                    backgroundColor: Colors.indigoAccent,
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
                new Container(
                  padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 9,
                      left: SizeConfig.safeBlockHorizontal * 9),
                  child: new Text(
                    'Enter your details :',
                    style:
                        TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 7,
                    right: SizeConfig.safeBlockHorizontal * 7,
                  ),
                  child: new Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 3,
                        top: SizeConfig.safeBlockHorizontal * 0.5),
                    decoration: BoxDecoration(
                      color: firstNameClr,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: new TextField(
                      controller: _firstName,
                      style: inputTextStyle,
                      textCapitalization: TextCapitalization.words,
                      cursorWidth: 2.5,
                      cursorColor: Colors.indigo,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: hintStyle,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            size: SizeConfig.safeBlockVertical * 3,
                          )),
                      onChanged: (String firstName) {
                        firstName = _firstName.text;
                        changeFirstNameColor(firstName);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 7,
                    right: SizeConfig.safeBlockHorizontal * 7,
                  ),
                  child: new Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 3,
                        top: SizeConfig.safeBlockHorizontal * 0.5),
                    decoration: BoxDecoration(
                      color: lastNameClr,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: new TextField(
                      controller: _lastName,
                      style: inputTextStyle,
                      textCapitalization: TextCapitalization.words,
                      cursorWidth: 2.5,
                      cursorColor: Colors.indigo,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: hintStyle,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            size: SizeConfig.safeBlockVertical * 3,
                          )),
                      onChanged: (String lastName) {
                        lastName = _lastName.text;
                        changeLastNameColor(lastName);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Container(
                  margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    minLines: 3,
                    maxLines: 5,
                    controller: _address,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        hintText: 'Enter your address...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 30),
                  child: new Text(
                    errorMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                new Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 25,
                      right: SizeConfig.safeBlockHorizontal * 25),
                  child: new RaisedButton(
                    onPressed: () {
                      String firstName = _firstName.text,
                          lastName = _lastName.text,
                          address = _address.text;
                      if (firstName.isNotEmpty &&
                          lastName.isNotEmpty &&
                          address.isNotEmpty) {
                        final userAuth =
                            Provider.of<UserAuth>(context, listen: false);
                        userAuth.addNewUser(
                            phoneNumber, firstName, lastName, address);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MyApp()),
                            ModalRoute.withName(''));
                        print('Home Page Screen');
                      } else {
                        detectError();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    elevation: 0,
                    child: new Container(
                      child: new Text(
                        'Finish',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
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
