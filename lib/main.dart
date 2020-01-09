import 'package:flutter/material.dart';
import 'package:loginn/ui/login_page.dart';
import 'package:loginn/ui/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:loginn/utils/scope_model_wrapper.dart';

import 'package:loginn/utils/translation.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        
      ),
      home: Splash(),
    );
  }
}
