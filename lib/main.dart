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

  ///setDAta

  setData() async {
    SharedPreferences setDatapref = await SharedPreferences.getInstance();

    setDatapref.setString('datavalues', mycontroller.text);
  }

//getDAta
  getData() async {
    SharedPreferences getDatapref = await SharedPreferences.getInstance();

    datavalue = getDatapref.getString('datavalues');
    setState(() {});
  }

  TextEditingController mycontroller = TextEditingController();
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

                await getData();
              },
              child: Text("click here"))
        ],
      ),
    );
  }
}
