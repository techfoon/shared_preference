import 'package:flutter/material.dart';
import 'package:shared_prefer/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? username, userpass;
  bool? loginStatus;
  TextEditingController NameConroller = TextEditingController();

  TextEditingController PassController = TextEditingController();

  setData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    if (NameConroller.text == username && PassController.text == userpassg) {
      mySharedInstance.setBool('staus', true);
    } else {
      mySharedInstance.setBool('staus', false);
    }

    getData();
  }

  getData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    setState(() {
      username = mySharedInstance.getString('username');
      userpass = mySharedInstance.getString('pass');
      loginStatus = mySharedInstance.getBool('staus');
    });
  }

  @override
  void initState() {
    // TODO: implement ini
    // tState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("$username"),
            
            Text("$userpass"),
            Text("$loginStatus"),
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
            ElevatedButton(
                onPressed: () {
                  if (NameConroller.text == username &&
                      PassController.text == userpass) {
                    setData();

                    showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Success'),
                    content: const Text('You are logged in'),
                    actions: <Widget>[
                      /* TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),*/
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                  } else {


                    showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Wrong Password'),
                    actions: <Widget>[
                      /* TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),*/
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                  }
                },
                child: Text("click here"))
          ],
        ),
      ),
    );
  }
}
