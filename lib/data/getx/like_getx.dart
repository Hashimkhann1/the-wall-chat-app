
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LikeGetx extends GetxController {
  final logedInUser = FirebaseAuth.instance.currentUser!;
  RxList isLiked = [].obs;


  void toggleLike(String postId) {
    final firestore = FirebaseFirestore.instance.collection('wallPosts').doc(postId);

    if(isLiked.contains(postId)){
      isLiked.remove(postId);
      firestore.update({
        "Likes" : FieldValue.arrayRemove([logedInUser.email])
      });
    }else{
      isLiked.add(postId);
      firestore.update({
        "Likes" : FieldValue.arrayUnion([logedInUser.email])
      });
    }
  }

  // checkmyPostLikes(List likes , String postId) async {
  //   // QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('wallPosts').get();
  //   // List<QueryDocumentSnapshot> documents = querySnapshot.docs;
  //   //
  //   // for(QueryDocumentSnapshot documentSnapshot in documents){
  //   //   List likeLists = List.from(documentSnapshot['Likes']);
  //   //   if(likeLists.contains(logedInUser.email)){
  //   //     print(documentSnapshot.id);
  //   //   }
  //   // }
  //
  //   // for(int i in firestore.docs.length){
  //   //   print(firestore.docs[i].data());
  //   // }
  //
  //   if(likes.contains(logedInUser.email)){
  //     isLiked.add(postId);
  //   }
  //   print('likefunction is hitted');
  // }

  // void initialize() async {
  //   QuerySnapshot querySnapshot =
  //   await FirebaseFirestore.instance.collection('wallPosts').get();
  //   List<QueryDocumentSnapshot> documents = querySnapshot.docs;
  //   for (QueryDocumentSnapshot documentSnapshot in documents) {
  //     List likeLists = List.from(documentSnapshot['Likes']);
  //     if (likeLists.contains(logedInUser.email)) {
  //       isLiked.add(documentSnapshot.id);
  //     }
  //   }
  // }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('wallPosts').get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    for(QueryDocumentSnapshot documentSnapshot in documents){
      List likeLists = List.from(documentSnapshot['Likes']);
      if(likeLists.contains(logedInUser.email)){
        isLiked.add(documentSnapshot.id);
      }
    }
  }

}