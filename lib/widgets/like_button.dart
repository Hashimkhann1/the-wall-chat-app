import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final Function()? onTap;

  const LikeButton({super.key,required this.onTap,required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey,
          ),
          const SizedBox(width: 1.0,),
          Text('Like',style: TextStyle(color: isLiked ? Colors.red : Colors.grey),)
        ],
      ),
    );
  }
}
