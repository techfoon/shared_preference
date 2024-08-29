// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AsyncAndAwait extends StatefulWidget {
//   @override
//   State<AsyncAndAwait> createState() => _AsyncAndAwaitState();
// }

// class _AsyncAndAwaitState extends State<AsyncAndAwait> {
//   String? datavalue;

//   ///setDAta

//   setData() async {
//     SharedPreferences setDatapref = await SharedPreferences.getInstance();

//     await setDatapref.setString('datavalue', mycontroller.text);
//   }

//   getData() async {
//     SharedPreferences getDatapref = await SharedPreferences.getInstance();

//     datavalue = getDatapref.getString('datavalue');
//     setState(() {});
//   }

//   //setData
//   TextEditingController mycontroller = TextEditingController();
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("$datavalue"),
//           TextField(
//             controller: mycontroller,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 await setData();
//                 print(mycontroller.text.toString());

//                 // await getData();
//               },
//               child: Text("click here"))
//         ],
//       ),
//     );
//   }
// }
