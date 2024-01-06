import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thewall/data/auth_services/authServices.dart';
import 'package:thewall/data/post_services/post_services.dart';
import 'package:thewall/widgets/my_text_field.dart';
import 'package:thewall/widgets/wall_posts.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  final _auth = FirebaseAuth.instance;
  final AuthService authService = AuthService();
  final PostsServices postsServices = PostsServices();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("The Wall"),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => authService.signOut(context),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("wallPosts")
                  .orderBy('TimeStamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context , index) {
                        final post = snapshot.data!.docs[index];
                        final dateTime = (post['TimeStamp'] as Timestamp).toDate();
                      return WallPosts(message: post['Message'], time: DateFormat('dd/MM/yyyy').format(dateTime), user: post['UserEmail']);
                    }),
                  );
                } else if(snapshot.hasError) {
                  return Center(child: Text("Error: " + snapshot.error.toString()));

                }
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black87,),
                );
              }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: MyTextField(
                        controller: messageController,
                        hintText: "Write Your Message!",
                        obbsecureText: false,
                        validator: (value) {})),
                const SizedBox(
                  width: 16.0,
                ),
                // Post Button
                InkWell(
                  onTap: () {
                    if(messageController.text.isNotEmpty){
                      postsServices.addPost(messageController.text.toString());
                      messageController.clear();
                    }
                  },
                  child: Container(
                    // alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(Icons.arrow_circle_up,size: 28,color: Colors.white,)
                  ),
                )
              ],
            ),
          ),
          Text("Logged in as: " + _auth.currentUser!.email.toString(),style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
