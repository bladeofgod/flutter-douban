import 'package:flutter/material.dart';
import 'dart:async';
import '../constant/constant.dart';
import 'container_page.dart';
import '../util/screen_util.dart';


class SplashPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }

}

class SplashPageState extends State<SplashPage> {

  var container = ContainerPage();

  bool showAd =true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: ScreenUtil.screenW() / 3,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(Constant.ASSETS_IMG + 'home_png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}











