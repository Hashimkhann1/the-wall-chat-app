import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obbsecureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obbsecureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obbsecureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white))
      ),
    );
  }
}
