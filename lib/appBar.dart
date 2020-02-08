import 'package:fabo_example_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'notifications.dart';

TextEditingController _srch = new TextEditingController();

Widget app_Bar(
  BuildContext context,
) {
  SizeConfig().init(context);
  return PreferredSize(
      preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 13),
      child: Container(
          child: new AppBar(
        elevation: 10,
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        title: new Container(
          padding: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 2,
              right: SizeConfig.safeBlockHorizontal * 2,
              // top: SizeConfig.safeBlockVertical * 2,
              bottom: SizeConfig.safeBlockVertical * 1),
          child: Text(
            'FaBo',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 7, letterSpacing: 3),
          ),
        ),
        centerTitle: true,
        flexibleSpace: new Container(
            padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 10,
                left: SizeConfig.safeBlockHorizontal * 5,
                right: SizeConfig.safeBlockHorizontal * 5,
                bottom: SizeConfig.safeBlockVertical * 0.5),
            child: new Container(
              margin: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 0.5,
                  top: SizeConfig.safeBlockVertical * 0.5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(100, 255, 255, 255),
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.white60],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: new TextField(
                  cursorColor: Colors.white30,
                  cursorWidth: 1.5,
                  controller: _srch,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      color: Colors.white70),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: new TextStyle(
                        color: Colors.white60,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        fontWeight: FontWeight.w500),
                    hintText: 'Search',
                    icon: Container(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 3.5),
                        child: Icon(
                          Icons.search,
                          color: Colors.white54,
                          size: SizeConfig.safeBlockVertical * 3.2,
                        )),
                  )),
            )),
        actions: <Widget>[
          new Container(
              padding:
                  EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2),
              child: new Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Notifications());
                      Navigator.push(context, route);
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: SizeConfig.safeBlockVertical * 3.7,
                    ),
                  ),
                  // new Positioned(
                  //   left: SizeConfig.safeBlockHorizontal * 7,
                  //   top: SizeConfig.safeBlockVertical * 1.5,
                  //   child: new CircleAvatar(
                  //     radius: SizeConfig.blockSizeVertical * 0.9,
                  //     backgroundColor: Colors.pink[200],
                  //     child: Text(
                  //       '10',
                  //       style: TextStyle(
                  //           fontSize: SizeConfig.safeBlockHorizontal * 2.2,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //     ),
                  //   ),
                  // )
                ],
              ))
        ],
      )));
}
