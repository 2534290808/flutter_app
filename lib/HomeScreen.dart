import 'package:flutter/material.dart';
export 'ContainerScreen.dart';

class _RouteData {
  _RouteData({this.title, this.path});

  final String title;
  final String path;
}

class HomeScreen extends StatelessWidget {
  final _routeData = <_RouteData>[
    new _RouteData(title: 'Container', path: '/container'),
    new _RouteData(title: 'LogoApp',path: '/logoApp')
  ];

  /**
   * 构建整个页面
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Flutter编程练习"),),
      body: new ListView.builder(
          itemBuilder: (context, i) {
            if(i.isOdd)return new Divider();
            final index = i~/2;
            if(index>=_routeData.length){
              return null;
            }
            return _buildRow(context,_routeData[index]);
          }
      ),
    );
  }

  /**
   * 构建每一行数据
   */
  Widget _buildRow(BuildContext context,_RouteData data) {
    return new ListTile(
      title: new Text(data.title, style: new TextStyle(fontSize: 18.0),),
      onTap: (){
        _onItemPress(context,data);
      },
    );
  }

  void _onItemPress(BuildContext context,_RouteData data){
    Navigator.pushNamed(context, data.path);
  }
}
