import 'package:flutter/material.dart';
import 'package:shared_prefer/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? username, userpass;
  bool? loginStatus;

  //bool? loginStatus;
  TextEditingController NameConroller = TextEditingController();

  TextEditingController PassController = TextEditingController();

  TextEditingController ConfirmPassController = TextEditingController();

  setData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();
    mySharedInstance.setString('username', NameConroller.text);
    mySharedInstance.setString('pass', PassController.text);
    // mySharedInstance.setString('Confirmpass', ConfirmPassController.text);
    getData();
  }

  getData() async {
    SharedPreferences mySharedInstance = await SharedPreferences.getInstance();

    setState(() {
      username = mySharedInstance.getString('username');
      userpass = mySharedInstance.getString('pass');
      loginStatus = mySharedInstance.getBool('status');
    });

    //mySharedInstance.getString('Confirmpass');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: ConfirmPassController,
              decoration: InputDecoration(
                  hintText: "Enter your PassWord",
                  label: Text("Confirm PassWord:"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (PassController.text == ConfirmPassController.text) {
                    await setData();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Cogrates!',
                          style: TextStyle(color: Colors.green),
                        ),
                        content: const Text('User registration success'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return login();
                              }));
                            },
                            child: const Text('GoTo LoginPage'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text(
                            'Please check: PassWord and Confirm pass are not Same'),
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
