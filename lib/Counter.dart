import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {

  int _counter = 0 ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new CounterIncrementer(onPress: _increment,),
        new CounterDisplay(count: _counter,),
      ],
    );
  }

  void _increment(){
    setState(() {
      _counter ++;
    });
  }
}

class CounterIncrementer extends StatelessWidget {
  
  CounterIncrementer({Key key,this.onPress}):super(key:key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: onPress,child: new Text('increment'),);
  }
}

class CounterDisplay extends StatelessWidget {

  CounterDisplay({Key key,this.count}):super(key:key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count:$count');
  }
}