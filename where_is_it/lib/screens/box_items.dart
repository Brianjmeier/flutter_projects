import 'package:flutter/material.dart';

class BoxItems extends StatefulWidget {
  @override
  _BoxItemsState createState() => _BoxItemsState();
}

class _BoxItemsState extends State<BoxItems> {
  List<Widget> _items;
  @override
  Widget build(BuildContext context) {
    _items = List<Widget>.generate(10, (index) {
      return ListTile(
          key: ValueKey(index),
          title: Text(
            'Item $index',
            style: TextStyle(fontSize: 28.0),
          ));
    });

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget tmp = _items.removeAt(oldIndex);
        _items.insert(newIndex, tmp);
      });
    }

    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();

    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          'Where Is It?',
          style: TextStyle(fontSize: 23.5, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReorderableListView(
          onReorder: _onReorder,
          children: _items,
        ),
      ),
    );
  }
}
