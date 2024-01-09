


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thewall/utils/utils.dart';

class PostsServices {
  final _auth = FirebaseAuth.instance;
  final Utils utils = Utils();

  void addPost(String message) async {
    print("function is hitted");
    try{
      await FirebaseFirestore.instance.collection('wallPosts').add({
        "UserEmail" : _auth.currentUser!.email,
        "Message" : message,
        "TimeStamp" : DateTime.now(),
        "Likes" : [],
      });
    }catch(e) {
      utils.toastMessage("Something went wrong");
    }
  }

  void addComments(String postId, String commentText) async {
    try{
      await FirebaseFirestore.instance.collection('wallPosts').doc(postId).collection("comments").add({
        "commentText" : commentText,
        "commentUser" : _auth.currentUser!.email,
        "commantTime" : Timestamp.now()
      }).then((value){
        utils.toastMessage("Comment added");
      }).onError((error, stackTrace) {
        utils.toastMessage("error from adding comment fire function" + error.toString());
      });
    }catch(e){
      utils.toastMessage("error from adding comments" + e.toString());
    }
  }

  void showCommentDialog(BuildContext context , String postId) {

    String newCommet = '';

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Add Comment"),
      content: TextField(
        decoration: InputDecoration(
          hintText: "Add a Comment",
        ),
        onChanged: (value) {
          newCommet = value;
        },
      ),
      actions: [
        // save
        
        TextButton(onPressed: () async {
          if(newCommet.trim().length > 0){
            addComments(postId, newCommet);
          }
          Navigator.pop(context);
        }, child: Text("Save")),

        // cancle
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Cancle"))
      ],
    ));
  }

}