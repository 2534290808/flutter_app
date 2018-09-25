import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class _LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

class _GrowTransition extends StatelessWidget {
  _GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

class _LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<_LogoApp> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
    new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new _GrowTransition(child: new _LogoWidget(), animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedBuilderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("AnimatedBuilderLogo"),),
      body: new _LogoApp(),
    );
  }
}