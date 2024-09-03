import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  bool? loginStatus;

  CommonNavBar({required this.title});
  getData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    loginStatus = mySharedInstance.getBool('staus');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.logout_outlined),
          onPressed: () {
            // Handle search action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}



//Syntax to use
//appBar: CommonNavBar(title: "Home Page"),