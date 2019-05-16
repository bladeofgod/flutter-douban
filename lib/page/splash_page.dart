import 'package:flutter/material.dart';
import 'dart:async';
import '../constant/constant.dart';
import 'container_page.dart';
import '../util/screen_util.dart';
import '../widget/countdown_widget.dart';


/*
*  这个项目的 splash 运行方式为 ： 页面和主页都在同一个，当倒计时结束后，直接隐藏 splash page 显示后面的
*
* */

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
                        child: Text(
                          '落花有意随流水,流水无心恋落花',
                          style: TextStyle(fontSize: 15.0,color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                //确保绘制内容 不会因为 如刘海屏之类的屏幕而绘制在错误的位置
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment(1.0, 0.0),
                        child: Container(
                          margin: const  EdgeInsets.only(right: 30.0,top: 20.0),
                          padding: const EdgeInsets.only(left: 10.0,right:10.0,top: 2.0,bottom: 2.0),
                          child:CountDownWidget(onCountDownFinishCallBack: (bool value){
                            if(value){
                              setState(() {
                                showAd = false;
                              });
                            }
                          }) ,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius:const BorderRadius.all(Radius.circular(10.0))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              Constant.ASSETS_IMG + 'ic_launcher.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Hi,豆芽',
                                style: TextStyle(
                                  color:Colors.green,
                                  fontSize: 30.0,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            width: ScreenUtil.screenW(),
            height:ScreenUtil.screenH(),
          ),
          offstage: !showAd,
        )
      ],
    );
  }
}















