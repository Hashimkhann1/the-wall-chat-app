import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataServices {

  final firestore = FirebaseFirestore.instance.collection('Users');
  final logedinUser = FirebaseAuth.instance.currentUser!;

  void editField(BuildContext context, String field) async {
    String newValue = "";

    await showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Edit " + field.toString(),style: TextStyle(color: Colors.white),),
          content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey)
            ),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            // cancle button
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancle',style: TextStyle(color: Colors.white))),

            // save button
            TextButton(onPressed: () async {
              if(newValue.trim().length > 0){
                firestore.doc(logedinUser.email.toString()).update({
                  field : newValue
                });
              }
              Navigator.pop(context);
            }, child: Text('Save',style: TextStyle(color: Colors.white))),
          ],
        )
    );

    if(newValue.trim().length > 0){

    }
  }

}
