import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:where_is_it/box.dart';

class Boxes extends StatefulWidget {
  @override
  _BoxesState createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  List<Widget> _boxes;

  @override
  void initState() {
    super.initState();
    _boxes = List<Widget>.generate(
        10,
        (index) => Box(
              name: 'Box N°$index',
            ));
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget tmp = _boxes.removeAt(oldIndex);
        _boxes.insert(newIndex, tmp);
      });
    }

    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();

    return Center(
      child: ReorderableWrap(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        children: _boxes,
        onReorder: _onReorder,
      ),
    );
  }
}
