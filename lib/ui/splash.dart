import 'dart:async';
import 'package:loginn/style/theme.dart' as Theme;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    Timer(Duration(seconds: 3), () {_onSplashEnd();});
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: AppColors.mainColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
         decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Theme.Colors.loginGradientStart,
                        Theme.Colors.loginGradientEnd
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
        child: Image.asset("assets/img/1.png"),
      )
    );
  }

  _onSplashEnd() {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => Login()));

  }
}