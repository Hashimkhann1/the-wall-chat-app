import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thewall/data/getx/like_getx.dart';
import 'package:thewall/data/post_services/post_services.dart';
import 'package:thewall/view/comment/comment.dart';
import 'package:thewall/widgets/like_button.dart';

class WallPosts extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  final String time;

  const WallPosts(
      {super.key,
      required this.message,
      required this.time,
      required this.user,
      required this.postId,
      required this.likes});

  @override
  State<WallPosts> createState() => _WallPostsState();
}

class _WallPostsState extends State<WallPosts> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final LikeGetx likeGetx = Get.put(LikeGetx());
  final PostsServices postsServices = PostsServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[400]),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.user.toString(),
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                widget.message.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                return Row(
                  children: [
                    Text(widget.likes.length.toString()),
                    LikeButton(
                        onTap: () {
                          likeGetx.toggleLike(widget.postId);
                          print(likeGetx.isLiked.contains(widget.postId));
                          print(likeGetx.isLiked);
                        },
                        isLiked: likeGetx.isLiked.contains(widget.postId)),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        postsServices.showCommentDialog(context, widget.postId);},
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.comment,color: Colors.grey[500],),
                            const SizedBox(width: 4,),
                            Text(
                              'Add Comment',
                              style: TextStyle(color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('wallPosts')
                      .doc(widget.postId)
                      .collection('comments')
                      .orderBy('commantTime', descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return Container(
                         decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(8)
                         ),
                            width: MediaQuery.of(context).size.width * 0.63,
                            child: ExpansionTile(
                              title: Text('Comments',style: TextStyle(color: Colors.grey[600]),),
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final commentData =
                                          snapshot.data!.docs[index];
                                      final commentTime =
                                      (commentData['commantTime'] as Timestamp).toDate();
                                      return Comments(
                                          time: DateFormat('dd/MM/yyyy').format(commentTime),
                                          user: commentData['commentUser'],
                                          comment: commentData['commentText']);
                                    })
                              ],
                            ));
                      } else {
                        return SizedBox();
                      }
                    } else if (snapshot.hasError) {
                      return Text("Error");
                    }
                    return Text('no comments');
                  })
            ],
          ),
        ],
      ),
    );
  }
}
