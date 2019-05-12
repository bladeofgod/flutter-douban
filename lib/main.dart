import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if(Platform.isAndroid){
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //百度的到 还可以控制界面 横竖
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RestartWidget(
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Colors.white),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: ,
        ),
      ),
    );
  }

}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget{

  final Widget child;

  RestartWidget({Key key,@required this.child}) : assert(child != null),super(key : key);

  static restartApp(BuildContext context){
    final _RestartWidgetState state = context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RestartWidgetState();
  }

}

class _RestartWidgetState extends State<RestartWidget> {

  Key key = UniqueKey();

  void restartApp(){
    setState(() {
      //通过重置key 是两次key 不相同 已达到重启app的作用
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      key: key,
      child: widget.child,
    );
  }

}
























