import 'package:flutter/material.dart';
import 'package:shared_prefer/components/appbar.dart';



class Dashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonNavBar(title: "Home Page"),
      
      /*AppBar(
        title: Text("DashBoard"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("Cogrates you are logged in"),

        ],
      ),
    );
  }
}
