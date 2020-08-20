import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String name;
  Box({this.name = 'Box Name'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.brown[500],
          width: 170.0,
          height: 170.0,
          child: Center(
              child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
        ),
      ),
    );
  }
}
