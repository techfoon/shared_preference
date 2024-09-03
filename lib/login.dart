import 'package:flutter/material.dart';
import 'package:shared_prefer/dashbord.dart';
import 'package:shared_prefer/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefer/components/appbar.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  TextEditingController NameConroller = TextEditingController();

  TextEditingController PassController = TextEditingController();
  String? username, userpass;
  bool? loginStatus;
  @override
  void initState() {
    // TODO: implement ini
    // tState
    super.initState();

    getData();
  }

  getData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    setState(() {
      username = mySharedInstance.getString('username');
      userpass = mySharedInstance.getString('pass');
      loginStatus = mySharedInstance.getBool('staus');
    });

    if (loginStatus == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Dashboard();
      }));
    }
  }

  setData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    if (NameConroller.text == username && PassController.text == userpass) {
      mySharedInstance.setBool('staus', true);
    } else {
      mySharedInstance.setBool('staus', false);
    }

    getData();
  }

  // After getting the data, check the login status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 

      AppBar(
        title: Text("LoginPage"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.login))],
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
                        title: const Text('Not Found'),
                        content: const Text('Registar Now!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Signup();
                              }));
                            },
                            child: const Text('REGISTOR NOW'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
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
