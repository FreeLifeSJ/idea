import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';


class SplashPage extends StatefulWidget{

  @override
  State createState() {
    return SplashPageState();
  }
}


class SplashPageState extends State<SplashPage>{
  TimerUtil _timerUtil;
  int _count = 3;

  @override
  void initState() {
    super.initState();
    _doCountDown();
  }

  void _doCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: 2 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _goMain(){
    Navigator.of(context).pushReplacementNamed('homepage');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child:Stack(
      children: <Widget>[
        Image.asset(
          'images/splash_bg.png',
          width: double.infinity,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(bottom: 20,right: 20),
          child: InkWell(
            onTap: _goMain,
            child: Container(
              child: Text("跳过$_count",style: TextStyle(color: Colors.white,fontSize: 14),),
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 7),
              decoration: BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
            ),
          ),
        )
      ],
     )
    );
  }

}

