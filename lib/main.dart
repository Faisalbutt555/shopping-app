import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:transact/loginSignUp.dart';
import 'package:transact/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
       statusBarColor:HexColor("#3B444B")
    ));
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
