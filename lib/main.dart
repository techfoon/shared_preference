import 'package:flutter/material.dart';


void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myAppDash(),
    );
  }
}

class myAppDash extends StatelessWidget {
  TextEditingController NameConroller = TextEditingController();
  TextEditingController PassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$datavalue"),
          TextField(
            controller: mycontroller,
          ),
          ElevatedButton(
              onPressed: () async {
                await setData();
                print(mycontroller.text.toString());

                await getData(); //ok
                
              },
              child: Text("click here"))
        ],
=======
      appBar: AppBar(
        title: Text("DashBoard"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: NameConroller,
              decoration: InputDecoration(
                  hintText: "Enter your UserName",
                  label: Text("UserName:"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: PassController,
              decoration: InputDecoration(
                  hintText: "Enter your PassWord",
                  label: Text("PassWord:"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            ElevatedButton(onPressed: () {}, child: Text("click here"))
          ],
        ),
>>>>>>> 3591697d16f204318d03313f7e6ff6d424846011
      ),
    );
  }
}
