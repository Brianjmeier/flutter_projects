import 'package:flutter/material.dart';

class Box extends StatelessWidget {

  final String name;
  const Box({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,
        children: <Widget>[
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
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            ),)),
    ]);
  }
}
