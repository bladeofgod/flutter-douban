import 'package:flutter/material.dart';
import 'dart:ui';

//系统默认的appBar等高度
//位于Dart Packages/flutter/src/material/constans.dart
///https://zhuanlan.zhihu.com/p/52959378
///

class ScreenUtil{
  static MediaQueryData mediaQueryData = MediaQueryData.fromWindow(window);
  static double _width = mediaQueryData.size.width;
  static double _height = mediaQueryData.size.height;
  static double _topbarH = mediaQueryData.padding.top;
  static double _botbarH = mediaQueryData.padding.bottom;
  static double _pixelRatio = mediaQueryData.devicePixelRatio;

  static var _ratio;

  static init(int number){
    //    750设计图 宽

    int uiWidth = number is int ? number : 750;
    _ratio = _width / uiWidth;

  }


  static px(number){
    if(!(_ratio is double || _ratio is int)){
      ScreenUtil.init(750);
    }
    return number * _ratio;
  }

  static onePx(){
    return 1/_pixelRatio;
  }

  static screenW(){
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }




}

//
//解析：
//
//1、默认750设计图
//
//2、引入 'dart:ui' 获得屏幕尺寸相关信息
//
//3、计算真实像素值
//
//
//
//使用方式：
//// 设置文本大小 30 为设计图尺寸
//new Text(
//'Hello World!',
//style: TextStyle(
//fontSize: Adapt.px(30),
//)
//)
//
//
//// 容器尺寸大小设置 一个设计图为 300*300像素的容器
//new Container(    width: Adapt.px(300),
//height: Adapt.px(300),
//)
//
//
//// 1px
//new Container(
//decoration: new BoxDecoration(
//border: new Border(bottom:BorderSide(width: Adapt.one())),
//),
//)
//
//
//Adapt.px(100) 计算适配后的尺寸
//Adapt.onepx() 1px像素大小












