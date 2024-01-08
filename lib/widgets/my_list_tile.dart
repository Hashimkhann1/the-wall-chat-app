import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  const MyListTile({super.key, required this.title, required this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 34,
        ),
        title: Text(
          title.toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onTap: onTap,
      ),
    );
  }
}
