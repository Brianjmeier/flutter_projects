import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String name;
  const Box({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
        child: Image.asset(
          'assets/box.png',
          width: 150,
          height: 150,
        ),
      ),
      Container(
          padding: EdgeInsets.only(top: 17.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          )),
    ]);
  }
}

class Box2 extends StatelessWidget {
  final List<Widget> stuff = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4'),
    Text('Item 5')
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 5.0),
            child: Text(
              'Box Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 10.0,
            color: Colors.blue,
          ),
          Container(
            child: ListView(
              children: stuff,
            ),
          )
        ],
      ),
    );
  }
}
