import 'package:flutter/material.dart';
import 'package:shared_prefer/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Signup(),
    );
  }
}
