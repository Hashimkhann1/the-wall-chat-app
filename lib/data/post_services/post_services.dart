


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

}