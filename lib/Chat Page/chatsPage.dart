import 'package:flutter/material.dart';

import '../appBar.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: app_Bar(context),
        body: new Container(
          padding: EdgeInsets.only(top: 10),
          child: new ListView(
            children: <Widget>[
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
              chats(context),
            ],
          ),
        ));
  }
}

Widget chats(BuildContext context) {
  return new Column(
    children: <Widget>[
      new ListTile(
        enabled: false,
        leading: profilePhoto(context),
        title: new Container(
          child: Text(
            'Name',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        subtitle: new Container(
          child: new Text('Last message...'),
        ),
      ),
      new Container(
        width: 405,
        child: new Divider(),
      )
    ],
  );
}

Widget profilePhoto(BuildContext context) {
  return new Container(
    // padding: EdgeInsets.all(10),
    child: new GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Details();
        }));
      },
      child: new CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey[300],
        child: FlutterLogo(
          size: 45,
        ),
      ),
    ),
  );
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: new Container(
          height: 350,
          width: 350,
          color: Colors.white,
          child: FlutterLogo(
            size: 95,
          ),
        )),
      ),
    );
  }
}
