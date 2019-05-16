
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget{

  final String url;

  WebViewPage(this.url,{Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewPageState();
  }

}

class WebViewPageState extends State<WebViewPage> {

  Rect rect;
  bool needFullScreen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
