import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const MyButton({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
      ),
    );
  }
}
