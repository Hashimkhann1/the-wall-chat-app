import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thewall/data/getx/loading_getx.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool loading;
  MyButton(
      {super.key, required this.title, required this.onTap,this.loading = false});


  @override
  Widget build(BuildContext context) {
    // print('loading from my text btn $loading');
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(
          title.toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        )
      ),
    );
  }
}
