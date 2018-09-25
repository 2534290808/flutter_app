import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class _AnimatedLogo extends AnimatedWidget {
  _AnimatedLogo({Key key,Animation<double> animation})
      :super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}

class _LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LogoAppState();
  }
}

class _LogoAppState extends State<_LogoApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;


  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    ..addStatusListener((status){
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new _AnimatedLogo(animation:animation,);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class AnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("LogoApp"),),
      body: new _LogoApp(),
    );
  }
}