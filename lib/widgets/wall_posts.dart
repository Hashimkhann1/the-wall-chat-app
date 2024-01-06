import 'package:flutter/material.dart';

class WallPosts extends StatefulWidget {
  final String message;
  final String user;
  final String time;

  const WallPosts({super.key,
    required this.message,
    required this.time,
    required this.user
  });

  @override
  State<WallPosts> createState() => _WallPostsState();
}

class _WallPostsState extends State<WallPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
      padding: EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400]
                ),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.person,color: Colors.white,),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.toString(),style: TextStyle(color: Colors.grey[500]),),
                  const SizedBox(height: 6.0,),
                  Text(widget.message.toString()),
                ],
              ),
            ],
          ),
          Text(widget.time,style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}
