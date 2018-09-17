import 'package:flutter/material.dart';
import 'MyButton.dart';
import 'Counter.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key, this.title}) :super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0 + 24.0,
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(children: <Widget>[
        new IconButton(icon: new Icon(Icons.menu, color: Colors.black,),
          onPressed: null,
          tooltip: 'menu',),
        new Expanded(child: title),
        new IconButton(
            icon: new Icon(Icons.search, color: Colors.black), onPressed: null)
      ],),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(title: new Text('自定义appbar')),
          new Expanded(child: new Center(child: new Text('hello word'),))
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Counter(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}