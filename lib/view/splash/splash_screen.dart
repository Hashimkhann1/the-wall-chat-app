import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thewall/data/splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.splashTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: Center(
      child: Text(
        "Connect",
        style: GoogleFonts.rubikBurned(fontSize: 50,fontWeight: FontWeight.bold)
    )));
  }
}
