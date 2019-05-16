import 'package:flutter/material.dart';
import 'dart:async';




class CountDownWidget extends StatefulWidget{

  final onCountDownFinishCallBack;

  CountDownWidget({Key key,@required this.onCountDownFinishCallBack})
    : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CountDownWidgetState();
  }

}

class CountDownWidgetState extends State<CountDownWidget> {

  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '$_seconds',
      style:  TextStyle(fontSize: 17.0),
    );
  }

  void _startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(_seconds <= 1){
          widget.onCountDownFinishCallBack(true);
          _cancelTimer();
          return;
        }
        _seconds --;
      });
    });
  }

  void _cancelTimer(){
    _timer?.cancel();
  }

}















