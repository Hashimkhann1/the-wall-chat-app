import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String comment;
  final String user;
  final String time;
  const Comments({super.key,required this.time,required this.user,required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(user,style: TextStyle(color: Colors.grey[600]),),
              Text(time,style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 4,),
          Text(comment,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey[800]),),
        ],
      ),
    );
  }
}
