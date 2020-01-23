import 'package:flutter/material.dart';

import 'notifications.dart';

TextEditingController _srch = new TextEditingController();

Widget app_Bar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
          child: new AppBar(
        elevation: 10,
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        title: new Container(
          padding: EdgeInsets.all(25),
          child: Text(
            'FaBo',
            style: TextStyle(fontSize: 30, letterSpacing: 3),
          ),
        ),
        // centerTitle: true,
        flexibleSpace: new Container(
            padding: EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
            ),
            child: new Container(
              margin: EdgeInsets.only(bottom: 7, top: 5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(100, 255, 255, 255),
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.white60],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: new TextField(
                  controller: _srch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle:
                        new TextStyle(color: Colors.white60, fontSize: 17),
                    hintText: 'Search',
                    icon: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.white54,
                          size: 30,
                        )),
                  )),
            )),
        actions: <Widget>[
          new Container(
            padding: EdgeInsets.only(right: 7),
            child: IconButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => Notifications());
                Navigator.push(context, route);
              },
              icon: Icon(
                Icons.notifications_none,
                size: 30,
              ),
            ),
          )
        ],
      )));
}
