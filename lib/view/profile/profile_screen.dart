import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thewall/data/user_data_services/user_data_services.dart';
import 'package:thewall/widgets/my_text_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final logedinUser = FirebaseAuth.instance.currentUser!;
  final UserDataServices userDataServices = UserDataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(logedinUser.email.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Profile Pic
                Icon(
                  Icons.person,
                  size: 70,
                ),
                // user email
                const SizedBox(
                  height: 10,
                ),
                Text(
                  logedinUser.email.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                // user detail
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ),

                // username
                MyTextBox(
                  text: userData['Username'].toString(),
                  sectionName: 'Username',
                  onPressed: () =>
                      userDataServices.editField(context, 'Username'),
                ),
                // bio
                MyTextBox(
                    text: userData['Bio'].toString(),
                    sectionName: "Empty Bio",
                    onPressed: () => userDataServices.editField(context, 'Bio'))

                //user posts
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return CircularProgressIndicator(
            color: Colors.grey[900],
          );
        },
      ),
    );
  }
}
