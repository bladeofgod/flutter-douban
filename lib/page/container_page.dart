
import 'package:flutter/material.dart';



///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
///
class ContainerPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContainerPageState();
  }

}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}


















