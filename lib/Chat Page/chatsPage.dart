import 'package:fabo_example_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, int i) {
          return chats(context, i);
        },
      ),
    ));
  }
}

Widget chats(BuildContext context, int i) {
  return new Column(
    children: <Widget>[
      new ListTile(
        enabled: false,
        leading: profilePhoto(context, i),
        title: new Container(
          child: Text(
            'Name',
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        subtitle: new Container(
          child: new Text('Last message...'),
        ),
      ),
      new Container(
        width: SizeConfig.blockSizeHorizontal * 90,
        child: new Divider(),
      )
    ],
  );
}

Widget profilePhoto(BuildContext context, int i) {
  return new Container(
    child: new GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Details(i);
          }));
        },
        child: new Hero(
          tag: i,
          child: new CircleAvatar(
            radius: SizeConfig.blockSizeVertical * 3.5,
            backgroundColor: Colors.grey[300],
            child: FlutterLogo(
              size: SizeConfig.blockSizeVertical * 5,
            ),
          ),
        )),
  );
}

class Details extends StatelessWidget {
  int index;
  Details(int i) {
    index = i;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragDown: (DragDownDetails dragDownDetails) {
          Navigator.pop(context);
        },
        child: Center(
            child: new Container(
          height: SizeConfig.blockSizeVertical * 40,
          width: SizeConfig.blockSizeHorizontal * 90,
          color: Colors.white,
          child: Hero(
            tag: index,
            child: FlutterLogo(),
          ),
        )),
      ),
    );
  }
}
