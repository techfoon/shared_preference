import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_prefer/components/appbar.dart';
import 'package:shared_prefer/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        actions: [
          IconButton(
              onPressed: () {
                clearData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return login();
                }));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cogrates you are logged in"),
          ],
        ),
      ),
    );
  }
}
