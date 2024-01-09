//
//
// import 'package:flutter/material.dart';
//
// class MyAlertDialog {
//
//   void showAlertDialog(BuildContext context , String hintText , void Function()? onPressed) async {
//
//     String comment = '';
//
//     await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Add comment..."),
//           content: TextField(
//             decoration: InputDecoration(
//               hintText: hintText
//             ),
//             onChanged: (value) {
//               comment = value;
//             },
//           ),
//           actions: [
//             // save
//             TextButton(onPressed: (), child: Text('Save')),
//              // Cancle
//             TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancle')),
//           ],
//     ));
//   }
//
// }