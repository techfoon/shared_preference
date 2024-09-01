import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Dasborard()
      home: AsyncAndAwait(),
    );
  }
}

class AsyncAndAwait extends StatefulWidget {
  @override
  State<AsyncAndAwait> createState() => _AsyncAndAwaitState();
}

class _AsyncAndAwaitState extends State<AsyncAndAwait> {
  String? datavalue;
  TextEditingController mycontroller = TextEditingController();

  ///setData

  setData() async {
    SharedPreferences mydata = await SharedPreferences.getInstance();

    mydata.setString('data', mycontroller.text);
    getData();
  }

  //getData

  getData() async {
    SharedPreferences mydata = await SharedPreferences.getInstance();

    setState(() {
       datavalue= mydata.getString('data');
    });
  
  }

  //initState

  @override
  void initState() {
    // TODO: implement initState
  
    super.initState();
      getData();
  }

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
                //get
              },
              child: Text("click here"))
        ],
      ),
    );
  }
}
